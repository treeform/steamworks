## JSON-based Nim code generator for Steamworks SDK bindings.
## Reads steam_api.json and emits src/steamworks.nim.
##
## Usage: nim r tools/generate_api.nim

import std/[json, os, sequtils, sets, strformat, strutils, tables]

const
  Header =
    "# Auto-generated from steam_api.json - do not edit manually.\n" &
    "# Regenerate with: nim r tools/generate_api.nim\n"

  NimKeywords = [
    "addr", "and", "as", "asm", "bind", "block", "break", "case", "cast",
    "concept", "const", "continue", "converter", "defer", "discard",
    "distinct", "div", "do", "elif", "else", "end", "enum", "except",
    "export", "finally", "for", "from", "func", "if", "import", "in",
    "include", "interface", "is", "isnot", "iterator", "let", "macro",
    "method", "mixin", "mod", "nil", "not", "notin", "object", "of", "or",
    "out", "proc", "ptr", "raise", "ref", "result", "return", "shl", "shr",
    "static", "template", "try", "tuple", "type", "using", "var", "when",
    "while", "xor", "yield"
  ].toHashSet()

  PrimitiveTypeMap = {
    "void": "void",
    "bool": "bool",
    "char": "char",
    "signed char": "int8",
    "unsigned char": "uint8",
    "short": "int16",
    "unsigned short": "uint16",
    "int": "cint",
    "unsigned int": "uint32",
    "long long": "int64",
    "unsigned long long": "uint64",
    "int8": "int8",
    "uint8": "uint8",
    "int16": "int16",
    "uint16": "uint16",
    "int32": "int32",
    "uint32": "uint32",
    "int64": "int64",
    "uint64": "uint64",
    "int8_t": "int8",
    "uint8_t": "uint8",
    "int16_t": "int16",
    "uint16_t": "uint16",
    "int32_t": "int32",
    "uint32_t": "uint32",
    "int64_t": "int64",
    "uint64_t": "uint64",
    "intptr_t": "int",
    "uintptr_t": "uint",
    "size_t": "csize_t",
    "float": "float32",
    "double": "float64",
    "uint64_steamid": "SteamId",
    "uint64_gameid": "GameId",
  }.toTable()

  PrimitiveTypedefNames = [
    "uint8", "int8", "uint16", "int16", "uint32", "int32", "uint64",
    "int64", "lint64", "ulint64", "intp", "uintp"
  ].toHashSet()

  CompatibilityAliases = {
    "AccountID_t": "AccountId",
    "AppId_t": "AppId",
    "CGameID": "GameId",
    "DepotId_t": "DepotId",
    "gameserveritem_t": "GameServerItem",
    "PublishedFileId_t": "PublishedFileId",
    "servernetadr_t": "ServerNetAdr",
    "SteamAPICall_t": "SteamAPICall",
    "UGCHandle_t": "UGCHandle",
    "UGCQueryHandle_t": "UGCQueryHandle",
    "UGCUpdateHandle_t": "UGCUpdateHandle",
    "CSteamID": "SteamId",
    "ESteamAPIInitResult": "InitResult",
  }.toTable()

type
  GenContext = object
    api: JsonNode
    typedefs: Table[string, string]
    interfaces: HashSet[string]
    structs: HashSet[string]
    callbacks: HashSet[string]
    enums: HashSet[string]
    enumFqNames: Table[string, string]
    constNames: Table[string, string]
    emittedTypeAliases: HashSet[string]

  StringBufferSpec = object
    paramIndex: int
    countIndex: int
    fieldName: string
    bufferName: string
    countName: string
    countType: string
    countIsPtr: bool

  OutputParamSpec = object
    paramIndex: int
    fieldName: string
    varName: string
    typ: string

  CStringOutSpec = object
    paramIndex: int
    fieldName: string
    varName: string

proc children(node: JsonNode; key: string): seq[JsonNode] =
  if node.kind == JObject and key in node and node[key].kind == JArray:
    for item in node[key]:
      result.add item

proc text(node: JsonNode; key: string; fallback = ""): string =
  if node.kind == JObject and key in node and node[key].kind == JString:
    node[key].getStr()
  else:
    fallback

proc compactSpaces(s: string): string =
  result = s.multiReplace([
    ("\r", " "), ("\n", " "), ("\t", " "),
    ("*", " * "), ("&", " & "), ("[", " ["), ("]", "] ")
  ])
  while "  " in result:
    result = result.replace("  ", " ")
  result = result.strip()
  result = result.replace(" *", "*").replace("* ", "*")
  result = result.replace(" &", "&").replace("& ", "&")

proc sanitizeName(name: string): string =
  var outName = newStringOfCap(name.len)
  for c in name:
    if c.isAlphaNumeric() or c == '_':
      outName.add c
    else:
      outName.add '_'
  while "__" in outName:
    outName = outName.replace("__", "_")
  outName = outName.strip(chars = {'_'})
  if outName.len == 0:
    outName = "value"
  if outName[0].isDigit():
    outName = "n" & outName
  if outName in NimKeywords:
    outName.add "Value"
  result = outName

proc nimNormalize(name: string): string =
  for c in name:
    if c != '_':
      result.add c.toLowerAscii()

proc pascalWords(segment: string): seq[string] =
  if segment.len == 0:
    return
  var start = 0
  for i in 1 ..< segment.len:
    let
      c = segment[i]
      prev = segment[i - 1]
      next = if i + 1 < segment.len: segment[i + 1] else: '\0'
    let boundary =
      c.isUpperAscii() and
      ((not prev.isUpperAscii()) or
        (next != '\0' and next.isLowerAscii() and i - start > 1))
    if boundary:
      result.add segment[start ..< i]
      start = i
  result.add segment[start .. segment.high]

proc lowerCamel(name: string): string =
  let normalized = sanitizeName(name).replace("IPv", "IPV")
  var words: seq[string]
  for segment in normalized.split('_'):
    for word in pascalWords(segment):
      if word.len > 0:
        words.add word

  if words.len == 0:
    return "value"

  result = words[0].toLowerAscii()
  for i in 1 .. words.high:
    let word = words[i]
    result.add word[0].toUpperAscii()
    if word.len > 1:
      result.add word[1 .. ^1].toLowerAscii()
  if result in NimKeywords:
    result.add "Value"

proc stripKnownSuffixes(name: string): string =
  result = name
  if result.endsWith("_t"):
    result = result[0 ..< result.len - 2]

proc publicTypeName(name: string): string =
  if name in CompatibilityAliases:
    return CompatibilityAliases[name]
  sanitizeName(stripKnownSuffixes(name))

proc publicEnumTypeName(name: string): string =
  if name in CompatibilityAliases:
    return CompatibilityAliases[name]

  result = stripKnownSuffixes(name)
  if result.len > "ESteam".len and result.startsWith("ESteam") and
      result["ESteam".len].isUpperAscii():
    result = result["ESteam".len .. ^1]
  elif result.len > 1 and result[0] == 'E' and result[1].isUpperAscii():
    result = result[1 .. ^1]
  result = sanitizeName(result)

proc stripSteamConstantPrefix(name: string): string =
  result = sanitizeName(name)
  if result.len > 2 and result[0] in {'k', 'K'} and result[1] == '_':
    result = result[2 .. ^1]
  elif result.len > 1 and result[0] in {'k', 'K'} and result[1].isUpperAscii():
    result = result[1 .. ^1]

  for prefix in ["ESteam", "Steam", "E", "cch", "cub", "cb", "un", "ul",
      "us", "ub", "u", "n", "i", "c", "b", "fl"]:
    if result.len > prefix.len and result.startsWith(prefix) and
        result[prefix.len].isUpperAscii():
      return result[prefix.len .. ^1]

proc publicConstName(name: string): string =
  lowerCamel(stripSteamConstantPrefix(name))

proc nimProcName(cName: string): string =
  case cName
  of "operator<":
    return "isLessThan"
  of "operator==":
    return "isEqualTo"
  of "operator=":
    return "assign"
  else:
    discard

  var name = sanitizeName(cName)
  if name.len > 1 and name[0] == 'B' and name[1].isUpperAscii():
    name = name[1..^1]
  lowerCamel(name)

proc stripSuffix(name, suffix: string): string =
  if name.endsWith(suffix):
    name[0 ..< name.len - suffix.len]
  else:
    name

proc stripParamPrefix(name: string): string =
  result = sanitizeName(name)
  if result.startsWith("m_"):
    result = result[2 .. ^1]
  for prefix in ["rgch", "rgpsz", "pch", "psz", "pcsz", "ppch", "pvec",
      "pun", "pn", "pb", "pfl", "pi", "pp", "sz", "cch", "cub", "cb", "un",
      "ul", "us", "ub", "u", "n", "e", "i", "c", "b", "fl", "p"]:
    if result.len > prefix.len and result.startsWith(prefix) and
        result[prefix.len].isUpperAscii():
      return result[prefix.len .. ^1]

proc fieldNameFromParam(name: string): string =
  result = lowerCamel(stripParamPrefix(name))
  if result.len == 0:
    result = "value"

proc uniqueName(name: string; used: var HashSet[string]): string =
  result = name
  var suffix = 2
  while result in used:
    result = name & $suffix
    inc suffix
  used.incl result

proc paramNameFromParam(p: JsonNode; index: int): string =
  let name = text(p, "paramname", "param" & $index)
  if name.len == 0:
    return "param" & $index
  fieldNameFromParam(name)

proc paramNamesFor(params: seq[JsonNode]): seq[string] =
  var used: HashSet[string]
  for i, p in params:
    result.add uniqueName(paramNameFromParam(p, i), used)

proc parseArray(cType: string; baseOut, sizeOut: var string): bool =
  let l = cType.find('[')
  let r = cType.find(']')
  if l >= 0 and r > l:
    baseOut = cType[0 ..< l].strip()
    sizeOut = cType[l + 1 ..< r].strip()
    return true

proc splitCParams(params: string): seq[string] =
  var start = 0
  var depth = 0
  for i, c in params:
    case c
    of '(', '[', '<':
      inc depth
    of ')', ']', '>':
      if depth > 0:
        dec depth
    of ',':
      if depth == 0:
        let item = params[start ..< i].strip()
        if item.len > 0:
          result.add item
        start = i + 1
    else:
      discard
  let item = params[start .. ^1].strip()
  if item.len > 0:
    result.add item

proc typeNameForNested(ctx: GenContext; base: string): string =
  if base in ctx.enumFqNames:
    return publicEnumTypeName(ctx.enumFqNames[base])
  if base == "SteamInputActionEvent_t::AnalogAction_t":
    return "SteamInputActionEventAnalogAction"
  if base == "SteamInputActionEvent_t::DigitalAction_t":
    return "SteamInputActionEventDigitalAction"
  publicTypeName(base)

proc mapType(ctx: GenContext; cType: string; inReturn = false): string =
  var t = compactSpaces(cType)
  if t.len == 0:
    return "pointer"

  var arrayBase, arraySize: string
  if parseArray(t, arrayBase, arraySize):
    let mappedBase = mapType(ctx, arrayBase)
    return &"array[{arraySize}, {mappedBase}]"

  let fnMarker = t.find("(*)")
  if fnMarker >= 0:
    let
      returnType = t[0 ..< fnMarker].strip()
      paramsStart = t.find('(', fnMarker + 3)
      paramsEnd = t.rfind(')')
    if paramsStart < 0 or paramsEnd <= paramsStart:
      return "pointer"

    let paramsText = t[paramsStart + 1 ..< paramsEnd].strip()
    var pieces: seq[string]
    if paramsText.len > 0 and paramsText != "void":
      for i, item in splitCParams(paramsText):
        pieces.add &"arg{i}: {mapType(ctx, item)}"

    result = "proc (" & pieces.join(", ") & ")"
    let mappedReturn = mapType(ctx, returnType, inReturn = true)
    if mappedReturn != "void":
      result.add ": " & mappedReturn
    result.add " {.cdecl.}"
    return

  if "(*" in t or "( *" in t:
    return "pointer"

  let isConst = t.startsWith("const ") or t.contains(" const ")
  t = t.replace("const ", "")
  t = t.replace("class ", "")
  t = t.replace("struct ", "")
  t = t.replace("volatile ", "")
  t = t.strip()

  var refDepth = 0
  while t.endsWith("&"):
    inc refDepth
    t.setLen(t.len - 1)
    t = t.strip()

  var pointerDepth = 0
  while t.endsWith("*"):
    inc pointerDepth
    t.setLen(t.len - 1)
    t = t.strip()

  pointerDepth += refDepth
  let rawBase = t
  var base =
    if rawBase in ctx.enums:
      publicEnumTypeName(rawBase)
    else:
      ctx.typeNameForNested(rawBase)

  if rawBase in PrimitiveTypeMap:
    base = PrimitiveTypeMap[rawBase]

  if pointerDepth == 0:
    if rawBase in ctx.typedefs and rawBase notin PrimitiveTypedefNames:
      return base
    if rawBase in ctx.enums:
      return base
    if rawBase in ctx.structs or rawBase in ctx.callbacks:
      return base
    if rawBase in ctx.interfaces:
      return base
    if rawBase == "ISteamNetworkingConnectionSignaling" or
        rawBase == "ISteamNetworkingSignalingRecvContext" or
        rawBase == "SteamDatagramRelayAuthTicket" or
        rawBase == "ScePadTriggerEffectParam":
      return "pointer"
    return base

  if base == "char":
    if pointerDepth == 1 and isConst:
      return "cstring"
    if pointerDepth == 2 and isConst:
      return "ptr cstring"
    result = "char"
  elif base == "void":
    result = "pointer"
    dec pointerDepth
  elif rawBase in ctx.interfaces:
    result = base
    dec pointerDepth
  elif rawBase in ctx.typedefs or rawBase in ctx.enums or rawBase in ctx.structs or
      rawBase in ctx.callbacks or base in PrimitiveTypeMap.values.toSeq:
    result = base
  else:
    return "pointer"

  for _ in 0 ..< pointerDepth:
    result = "ptr " & result

proc mapParamType(ctx: GenContext; p: JsonNode): string =
  let flatType = text(p, "paramtype_flat")
  if flatType.len > 0:
    mapType(ctx, flatType)
  else:
    mapType(ctx, text(p, "paramtype"))

proc mapReturnType(ctx: GenContext; m: JsonNode): string =
  let flatType = text(m, "returntype_flat")
  if flatType.len > 0:
    mapType(ctx, flatType, inReturn = true)
  else:
    mapType(ctx, text(m, "returntype"), inReturn = true)

proc removeIntegerSuffixes(value: string): string =
  result = ""
  var i = 0
  while i < value.len:
    if value[i].isDigit():
      let start = i
      if i + 1 < value.len and value[i] == '0' and
          value[i + 1] in {'x', 'X'}:
        i += 2
        while i < value.len and value[i] in {'0'..'9', 'a'..'f', 'A'..'F'}:
          inc i
      else:
        while i < value.len and value[i].isDigit():
          inc i
      result.add value[start ..< i]
      while i < value.len and value[i] in {'u', 'U', 'l', 'L'}:
        inc i
    else:
      result.add value[i]
      inc i

proc removeSimpleCasts(value: string): string =
  result = value
  for castName in [
    "int", "uint32", "uint64", "SteamItemInstanceID_t",
    "SteamNetworkingPOPID", "HServerQuery", "uint16"
  ]:
    result = result.replace("( " & castName & " )", "")
    result = result.replace("(" & castName & ")", "")
    result = result.replace("( " & castName & ")", "")
    result = result.replace("(" & castName & " )", "")

proc replaceCharLiterals(value: string): string =
  result = ""
  var i = 0
  while i < value.len:
    if value[i] == '\'' and i + 2 < value.len and value[i + 2] == '\'':
      result.add $ord(value[i + 1])
      i += 3
    else:
      result.add value[i]
      inc i

proc replaceKnownIdentifiers(ctx: GenContext; value: string): string =
  result = ""
  var i = 0
  while i < value.len:
    if value[i].isAlphaAscii() or value[i] == '_':
      let start = i
      inc i
      while i < value.len and (value[i].isAlphaNumeric() or value[i] == '_'):
        inc i
      let token = value[start ..< i]
      result.add ctx.constNames.getOrDefault(token, token)
    else:
      result.add value[i]
      inc i

proc normalizeValue(ctx: GenContext; raw, cType: string): string =
  var v = raw.strip()
  if v.len == 0:
    return "0"

  v = v.replace("- ", "-")
  if "~" in v:
    let nimType = mapType(ctx, cType)
    if nimType.len > 0 and nimType != "pointer":
      return "high(" & nimType & ")"
    return "(not 0)"

  if not v.toLowerAscii().contains("0x"):
    if v.endsWith(".f") or v.endsWith(".F"):
      v = v[0 ..< v.len - 2] & ".0'f32"
    elif v.endsWith("f") or v.endsWith("F"):
      v = v[0 ..< v.len - 1] & "'f32"

  v = v.multiReplace([
    ("0xffffffffffffffffull", "0xffffffffffffffff'u64"),
    ("0xffffffffffffffffULL", "0xffffffffffffffff'u64"),
    ("0xFFFFFFFFFFFFFFFFull", "0xffffffffffffffff'u64"),
    ("0xFFFFFFFFFFFFFFFFULL", "0xffffffffffffffff'u64"),
  ])
  v = removeSimpleCasts(v)
  v = replaceCharLiterals(v)
  v = removeIntegerSuffixes(v)
  v = v.replace("<<", " shl ")
  v = v.replace(">>", " shr ")
  v = v.replace("|", " or ")
  v = v.replace("  ", " ")
  while "  " in v:
    v = v.replace("  ", " ")
  v = replaceKnownIdentifiers(ctx, v)
  v.strip()

proc allEnums(api: JsonNode): seq[JsonNode] =
  for e in children(api, "enums"):
    result.add e
  for iface in children(api, "interfaces"):
    for e in children(iface, "enums"):
      result.add e
  for cb in children(api, "callback_structs"):
    for e in children(cb, "enums"):
      result.add e

proc registerConstName(
  names: var Table[string, string];
  used: var HashSet[string];
  rawName: string;
  suffix = ""
) =
  var name = publicConstName(rawName)
  if suffix.len > 0:
    name.add suffix
  var candidate = name
  var suffix = 2
  while nimNormalize(candidate) in used:
    candidate = name & $suffix
    inc suffix
  used.incl nimNormalize(candidate)
  names[rawName] = candidate

proc buildContext(api: JsonNode): GenContext =
  result.api = api
  result.typedefs["CSteamID"] = "uint64"
  result.typedefs["CGameID"] = "uint64"
  result.typedefs["SteamAPIWarningMessageHook_t"] =
    "void (*)(int, const char *)"

  for td in children(api, "typedefs"):
    result.typedefs[text(td, "typedef")] = text(td, "type")

  for iface in children(api, "interfaces"):
    result.interfaces.incl text(iface, "classname")

  for s in children(api, "structs"):
    result.structs.incl text(s, "struct")

  for s in children(api, "callback_structs"):
    result.callbacks.incl text(s, "struct")

  for e in allEnums(api):
    let name = text(e, "enumname")
    result.enums.incl name
    let fqName = text(e, "fqname")
    if fqName.len > 0:
      result.enumFqNames[fqName] = name

  var usedConstNames: HashSet[string]
  for c in children(api, "consts"):
    registerConstName(result.constNames, usedConstNames, text(c, "constname"))
  for e in allEnums(api):
    for v in children(e, "values"):
      registerConstName(result.constNames, usedConstNames, text(v, "name"))
  for cb in children(api, "callback_structs"):
    let rawName = "k_i" & stripSuffix(text(cb, "struct"), "_t")
    registerConstName(result.constNames, usedConstNames, rawName, "CallbackId")

proc generateTypeAlias(lines: var seq[string]; ctx: var GenContext; name,
    target: string) =
  if name.len == 0 or name in PrimitiveTypedefNames:
    return
  if nimNormalize(name) in ctx.emittedTypeAliases:
    return
  ctx.emittedTypeAliases.incl nimNormalize(name)
  if target.startsWith("{."):
    lines.add &"  {name}* {target}"
  else:
    lines.add &"  {name}* = {target}"

proc generateTypes(ctxParam: GenContext): string =
  var ctx = ctxParam
  var lines: seq[string]

  lines.add "type"
  for iface in children(ctx.api, "interfaces"):
    generateTypeAlias(lines, ctx, publicTypeName(text(iface, "classname")),
      "distinct pointer")

  generateTypeAlias(lines, ctx, publicTypeName("CSteamID"), "uint64")
  generateTypeAlias(lines, ctx, publicTypeName("CGameID"), "uint64")
  generateTypeAlias(lines, ctx, publicTypeName("SteamAPIWarningMessageHook_t"),
    mapType(ctx, ctx.typedefs["SteamAPIWarningMessageHook_t"]))

  for td in children(ctx.api, "typedefs"):
    let name = text(td, "typedef")
    if name in PrimitiveTypedefNames:
      continue
    generateTypeAlias(lines, ctx, publicTypeName(name), mapType(ctx, text(td, "type")))

  for e in allEnums(ctx.api):
    generateTypeAlias(lines, ctx, publicEnumTypeName(text(e, "enumname")), "int32")

  generateTypeAlias(lines, ctx, "SteamInputActionEventAnalogAction", "object")
  lines.add "    actionHandle*: InputAnalogActionHandle"
  lines.add "    analogActionData*: InputAnalogActionData"
  lines.add ""
  generateTypeAlias(lines, ctx, "SteamInputActionEventDigitalAction", "object")
  lines.add "    actionHandle*: InputDigitalActionHandle"
  lines.add "    digitalActionData*: InputDigitalActionData"
  lines.add ""
  generateTypeAlias(lines, ctx, "SteamInputActionEventData", "{.union.} = object")
  lines.add "    analogAction*: SteamInputActionEventAnalogAction"
  lines.add "    digitalAction*: SteamInputActionEventDigitalAction"
  lines.add ""

  for s in children(ctx.api, "structs"):
    let name = text(s, "struct")
    if name == "SteamInputActionEvent_t":
      generateTypeAlias(lines, ctx, publicTypeName(name), "object")
      lines.add "    controllerHandle*: InputHandle"
      lines.add &"    eventType*: {publicEnumTypeName(\"ESteamInputActionEventType\")}"
      lines.add "    data*: SteamInputActionEventData"
      lines.add ""
      continue

    generateTypeAlias(lines, ctx, publicTypeName(name), "object")
    var usedFieldNames: HashSet[string]
    for f in children(s, "fields"):
      let fieldName = uniqueName(fieldNameFromParam(text(f, "fieldname")),
        usedFieldNames)
      lines.add &"    {fieldName}*: {mapType(ctx, text(f, \"fieldtype\"))}"
    lines.add ""

  for s in children(ctx.api, "callback_structs"):
    let name = text(s, "struct")
    generateTypeAlias(lines, ctx, publicTypeName(name), "object")
    var usedFieldNames: HashSet[string]
    for f in children(s, "fields"):
      let fieldName = uniqueName(fieldNameFromParam(text(f, "fieldname")),
        usedFieldNames)
      lines.add &"    {fieldName}*: {mapType(ctx, text(f, \"fieldtype\"))}"
    lines.add ""

  lines.join("\n") & "\n"

proc generateInterfaceHelpers(ctx: GenContext): string =
  var lines: seq[string]

  for iface in children(ctx.api, "interfaces"):
    let className = publicTypeName(text(iface, "classname"))
    lines.add &"proc isNil*(self: {className}): bool {{.borrow.}}"

  if lines.len > 0:
    lines.add ""
  lines.join("\n")

proc generateConstants(ctx: GenContext): string =
  var lines: seq[string]

  lines.add "const"
  for c in children(ctx.api, "consts"):
    let constName = ctx.constNames[text(c, "constname")]
    lines.add &"  {constName}* = {normalizeValue(ctx, text(c, \"constval\"), text(c, \"consttype\"))}"
  lines.add ""

  for e in allEnums(ctx.api):
    lines.add &"# {publicEnumTypeName(text(e, \"enumname\"))}"
    lines.add "const"
    for v in children(e, "values"):
      let constName = ctx.constNames[text(v, "name")]
      lines.add &"  {constName}* = {normalizeValue(ctx, text(v, \"value\"), text(e, \"enumname\"))}"
    lines.add ""

  if children(ctx.api, "callback_structs").len > 0:
    lines.add "# Callback IDs"
    lines.add "const"
    for cb in children(ctx.api, "callback_structs"):
      let structName = text(cb, "struct")
      if "callback_id" in cb:
        let rawName = "k_i" & stripSuffix(structName, "_t")
        lines.add &"  {ctx.constNames[rawName]}* = {cb[\"callback_id\"].getInt()}"
    lines.add ""

  lines.add "const"
  lines.add "  initOk* = apiInitResultOk"
  lines.add "  initFailedGeneric* = apiInitResultFailedGeneric"
  lines.add "  initNoSteamClient* = apiInitResultNoSteamClient"
  lines.add "  initVersionMismatch* = apiInitResultVersionMismatch"
  lines.add ""

  lines.join("\n")

proc procSignature(ctx: GenContext; name, selfType, returnType: string;
    params: seq[JsonNode]; exported = true): string =
  var pieces: seq[string]
  if selfType.len > 0:
    pieces.add &"self: {selfType}"
  let paramNames = paramNamesFor(params)
  for i, p in params:
    pieces.add &"{paramNames[i]}: {mapParamType(ctx, p)}"

  result = &"proc {name}"
  if exported:
    result.add "*"
  result.add "("
  result.add pieces.join(", ")
  result.add ")"
  if returnType != "void":
    result.add &": {returnType}"

proc generateRuntimeImports(): string =
  result = """
when defined(windows):
  when defined(cpu64):
    const steamApiDynlib* = "steam_api64"
  else:
    const steamApiDynlib* = "steam_api"
elif defined(macosx):
  const steamApiDynlib* = "libsteam_api.dylib"
else:
  const steamApiDynlib* = "libsteam_api.so"

{.push cdecl, dynlib: steamApiDynlib.}

proc RestartAppIfNecessary*(ownAppId: AppId): bool {.importc: "SteamAPI_RestartAppIfNecessary".}
proc InitFlat*(outErrMsg: ptr SteamErrMsg): InitResult {.importc: "SteamAPI_InitFlat".}
proc Shutdown*() {.importc: "SteamAPI_Shutdown".}
proc RunCallbacks*() {.importc: "SteamAPI_RunCallbacks".}
proc ReleaseCurrentThreadMemory*() {.importc: "SteamAPI_ReleaseCurrentThreadMemory".}
proc IsSteamRunning*(): bool {.importc: "SteamAPI_IsSteamRunning".}
proc GetSteamInstallPathRaw(): cstring {.importc: "SteamAPI_GetSteamInstallPath".}
proc InitSafe*(): bool {.importc: "SteamAPI_InitSafe".}
proc SteamGameServer_RunCallbacks*() {.importc: "SteamGameServer_RunCallbacks".}

"""

proc generateAccessors(ctx: GenContext): string =
  var lines: seq[string]
  for iface in children(ctx.api, "interfaces"):
    let className = publicTypeName(text(iface, "classname"))
    for accessor in children(iface, "accessors"):
      let name = sanitizeName(text(accessor, "name"))
      let flatName = text(accessor, "name_flat")
      lines.add &"proc {name}*(): {className} {{.importc: \"{flatName}\".}}"
  if lines.len > 0:
    lines.add ""
  lines.join("\n")

proc stringBuffersForMethod(ctx: GenContext; m: JsonNode): seq[StringBufferSpec]
proc cstringOutPointersForMethod(m: JsonNode): seq[CStringOutSpec]

proc methodHasCStringParam(ctx: GenContext; m: JsonNode): bool =
  for p in children(m, "params"):
    if mapParamType(ctx, p) in ["cstring", "ptr cstring",
        "ptr SteamParamStringArray"]:
      return true

proc generateMethod(ctx: GenContext; selfType: string; m: JsonNode): string =
  let name = nimProcName(text(m, "methodname"))
  let returnType = mapReturnType(ctx, m)
  let exported = returnType != "cstring" and
    stringBuffersForMethod(ctx, m).len == 0 and
    cstringOutPointersForMethod(m).len == 0 and
    not methodHasCStringParam(ctx, m)
  let procName = if exported: name else: name & "Raw"
  let sig = procSignature(ctx, procName, selfType, returnType,
    children(m, "params"), exported = exported)
  &"{sig} {{.importc: \"{text(m, \"methodname_flat\")}\".}}"

proc generateInterfaceMethods(ctx: GenContext): string =
  var lines: seq[string]
  for iface in children(ctx.api, "interfaces"):
    let className = publicTypeName(text(iface, "classname"))
    if children(iface, "methods").len == 0:
      continue
    lines.add &"# {className}"
    for m in children(iface, "methods"):
      lines.add generateMethod(ctx, className, m)
    lines.add ""
  lines.join("\n")

proc generateStructMethods(ctx: GenContext): string =
  var lines: seq[string]
  for s in children(ctx.api, "structs"):
    let structName = publicTypeName(text(s, "struct"))
    if children(s, "methods").len == 0:
      continue
    lines.add &"# {structName}"
    for m in children(s, "methods"):
      lines.add generateMethod(ctx, "ptr " & structName, m)
    lines.add ""
  lines.join("\n")

proc isMutableCharBufferParam(p: JsonNode): bool =
  let t = compactSpaces(text(p, "paramtype"))
  result = t == "char*" or t == "char *"

proc isMutableCharPointerPointerParam(p: JsonNode): bool =
  let t = compactSpaces(text(p, "paramtype"))
  result = t == "char**" or t == "char **"

proc isPlausibleSizeParam(ctx: GenContext; p: JsonNode): bool =
  let
    name = text(p, "paramname").toLowerAscii()
    typ = mapParamType(ctx, p)
  if not (name.contains("cch") or name.contains("cub") or
      name.contains("cb") or name.contains("size") or
      name.contains("len") or name.contains("max")):
    return false
  typ in ["cint", "int32", "uint32", "csize_t", "ptr cint", "ptr int32",
    "ptr uint32", "ptr csize_t"]

proc findParamIndex(params: seq[JsonNode]; name: string): int =
  for i, p in params:
    if text(p, "paramname") == name:
      return i
  -1

proc pointerBaseType(typ: string): string =
  if typ.startsWith("ptr "):
    typ["ptr ".len .. ^1]
  else:
    typ

proc countValueExpr(countType, bufferName: string): string =
  case countType
  of "cint":
    bufferName & ".len.cint"
  of "int32":
    bufferName & ".len.int32"
  of "uint32":
    bufferName & ".len.uint32"
  of "csize_t":
    bufferName & ".len.csize_t"
  else:
    countType & "(" & bufferName & ".len)"

proc initCountValueExpr(countBaseType, sizeParam: string): string =
  case countBaseType
  of "cint":
    sizeParam & ".cint"
  of "int32":
    sizeParam & ".int32"
  of "uint32":
    sizeParam & ".uint32"
  of "csize_t":
    sizeParam & ".csize_t"
  else:
    countBaseType & "(" & sizeParam & ")"

proc stringBuffersForMethod(ctx: GenContext; m: JsonNode): seq[StringBufferSpec] =
  let params = children(m, "params")
  var usedParams: HashSet[int]
  var usedNames: HashSet[string]

  for i, p in params:
    let countName = text(p, "out_string_count")
    if countName.len == 0 or not isMutableCharBufferParam(p):
      continue
    let countIndex = findParamIndex(params, countName)
    if countIndex < 0:
      continue
    usedParams.incl i
    usedParams.incl countIndex
    let countType = mapParamType(ctx, params[countIndex])
    let field = uniqueName(fieldNameFromParam(text(p, "paramname")), usedNames)
    result.add StringBufferSpec(
      paramIndex: i,
      countIndex: countIndex,
      fieldName: field,
      bufferName: field & "Buffer",
      countName: field & "BufferSize",
      countType: countType,
      countIsPtr: countType.startsWith("ptr ")
    )

  for i, p in params:
    if i in usedParams or not isMutableCharBufferParam(p):
      continue
    if i + 1 >= params.len or not isPlausibleSizeParam(ctx, params[i + 1]):
      continue
    let countIndex = i + 1
    usedParams.incl i
    usedParams.incl countIndex
    let countType = mapParamType(ctx, params[countIndex])
    let field = uniqueName(fieldNameFromParam(text(p, "paramname")), usedNames)
    result.add StringBufferSpec(
      paramIndex: i,
      countIndex: countIndex,
      fieldName: field,
      bufferName: field & "Buffer",
      countName: field & "BufferSize",
      countType: countType,
      countIsPtr: countType.startsWith("ptr ")
    )

proc isOutputPointerParam(ctx: GenContext; p: JsonNode): bool =
  let
    cType = compactSpaces(text(p, "paramtype"))
    typ = mapParamType(ctx, p)
  result = typ.startsWith("ptr ") and
    not cType.startsWith("const ") and
    not cType.contains("**") and
    not isMutableCharBufferParam(p)

proc cstringOutPointersForMethod(m: JsonNode): seq[CStringOutSpec] =
  var usedNames: HashSet[string]
  for i, p in children(m, "params"):
    if not isMutableCharPointerPointerParam(p):
      continue
    let field = uniqueName(fieldNameFromParam(text(p, "paramname")), usedNames)
    result.add CStringOutSpec(
      paramIndex: i,
      fieldName: field,
      varName: field & "Value"
    )

proc outputParamsForMethod(
  ctx: GenContext;
  m: JsonNode;
  removed: HashSet[int]
): seq[OutputParamSpec] =
  let params = children(m, "params")
  var usedNames: HashSet[string]
  for i, p in params:
    if i in removed or not isOutputPointerParam(ctx, p):
      continue
    let field = uniqueName(fieldNameFromParam(text(p, "paramname")), usedNames)
    result.add OutputParamSpec(
      paramIndex: i,
      fieldName: field,
      varName: field & "Value",
      typ: pointerBaseType(mapParamType(ctx, p))
    )

proc helperReturnType(
  rawReturn: string;
  buffers: seq[StringBufferSpec];
  outputs: seq[OutputParamSpec]
): tuple[typ: string, tupleReturn: bool] =
  if buffers.len == 1 and outputs.len == 0 and
      rawReturn in ["void", "bool", "cint", "int32", "uint32", "csize_t"]:
    return ("string", false)

  var fields: seq[string]
  if rawReturn == "bool":
    fields.add "ok: bool"
  elif rawReturn != "void":
    fields.add "returnValue: " & rawReturn
  for output in outputs:
    fields.add output.fieldName & ": " & output.typ
  for buffer in buffers:
    fields.add buffer.fieldName & ": string"
  ("tuple[" & fields.join(", ") & "]", true)

proc helperParamType(rawType: string): string =
  if rawType == "cstring":
    "string"
  elif rawType == "ptr cstring":
    "openArray[string]"
  elif rawType == "ptr SteamParamStringArray":
    "openArray[string]"
  elif rawType == "cint":
    "int"
  else:
    rawType

proc cstringArrayVarName(paramName: string): string =
  paramName & "CStrings"

proc steamParamStringArrayVarName(paramName: string): string =
  paramName & "Array"

proc steamParamStringArrayCStringsVarName(paramName: string): string =
  paramName & "SteamStrings"

proc helperArgExpr(paramName, rawType: string): string =
  if rawType == "cstring":
    paramName & ".cstring"
  elif rawType == "ptr cstring":
    let cstrings = cstringArrayVarName(paramName)
    "(if " & cstrings & ".len == 0: cast[ptr cstring](nil) else: " &
      cstrings & "[0].addr)"
  elif rawType == "ptr SteamParamStringArray":
    steamParamStringArrayVarName(paramName) & ".addr"
  elif rawType == "cint":
    paramName & ".cint"
  else:
    paramName

proc addCStringArrayTemps(
  lines: var seq[string];
  params: seq[JsonNode];
  paramNames: seq[string];
  ctx: GenContext;
  removed: HashSet[int]
) =
  for i, p in params:
    if i in removed or mapParamType(ctx, p) != "ptr cstring":
      continue
    let
      paramName = paramNames[i]
      cstrings = cstringArrayVarName(paramName)
    lines.add &"  var {cstrings} = newSeq[cstring]({paramName}.len)"
    lines.add &"  for i, item in {paramName}:"
    lines.add &"    {cstrings}[i] = item.cstring"

proc addSteamParamStringArrayTemps(
  lines: var seq[string];
  params: seq[JsonNode];
  paramNames: seq[string];
  ctx: GenContext;
  removed: HashSet[int]
) =
  for i, p in params:
    if i in removed or mapParamType(ctx, p) != "ptr SteamParamStringArray":
      continue
    let
      paramName = paramNames[i]
      cstrings = steamParamStringArrayCStringsVarName(paramName)
      arrayName = steamParamStringArrayVarName(paramName)
    lines.add &"  var {cstrings} = newSeq[cstring]({paramName}.len)"
    lines.add &"  for i, item in {paramName}:"
    lines.add &"    {cstrings}[i] = item.cstring"
    lines.add &"  var {arrayName} = SteamParamStringArray("
    lines.add &"    strings: (if {cstrings}.len == 0: cast[ptr cstring](nil) else: {cstrings}[0].addr),"
    lines.add &"    numStrings: {cstrings}.len.int32"
    lines.add &"  )"

proc generateStringWrapper(
  ctx: GenContext;
  selfType: string;
  m: JsonNode
): string =
  let buffers = stringBuffersForMethod(ctx, m)
  if buffers.len == 0:
    return ""

  var removed: HashSet[int]
  for b in buffers:
    removed.incl b.paramIndex
    removed.incl b.countIndex

  let outputs = outputParamsForMethod(ctx, m, removed)
  for output in outputs:
    removed.incl output.paramIndex

  let
    params = children(m, "params")
    rawReturn = mapReturnType(ctx, m)
    procName = nimProcName(text(m, "methodname"))
    ret = helperReturnType(rawReturn, buffers, outputs)
    paramNames = paramNamesFor(params)

  var sigParams = @[&"self: {selfType}"]
  for i, p in params:
    if i in removed:
      continue
    let rawType = mapParamType(ctx, p)
    sigParams.add &"{paramNames[i]}: {helperParamType(rawType)}"
  sigParams.add "steamworksBufferSize = defaultSteamworksBufferSize"

  var lines: seq[string]
  lines.add &"proc {procName}*({sigParams.join(\", \")}): {ret.typ} ="

  for buffer in buffers:
    lines.add &"  var {buffer.bufferName} = newString(max(1, steamworksBufferSize))"
    if buffer.countIsPtr:
      let baseType = pointerBaseType(buffer.countType)
      lines.add &"  var {buffer.countName} = {initCountValueExpr(baseType, \"steamworksBufferSize\")}"

  for output in outputs:
    lines.add &"  var {output.varName}: {output.typ}"

  addCStringArrayTemps(lines, params, paramNames, ctx, removed)
  addSteamParamStringArrayTemps(lines, params, paramNames, ctx, removed)

  var callArgs: seq[string]
  for i, p in params:
    var handled = false
    for buffer in buffers:
      if i == buffer.paramIndex:
        callArgs.add buffer.bufferName & "[0].addr"
        handled = true
        break
      if i == buffer.countIndex:
        if buffer.countIsPtr:
          callArgs.add buffer.countName & ".addr"
        else:
          callArgs.add countValueExpr(buffer.countType, buffer.bufferName)
        handled = true
        break
    if handled:
      continue
    for output in outputs:
      if i == output.paramIndex:
        callArgs.add output.varName & ".addr"
        handled = true
        break
    if not handled:
      let
        paramName = paramNames[i]
        rawType = mapParamType(ctx, p)
      callArgs.add helperArgExpr(paramName, rawType)

  let callExpr = "self." & procName & "Raw(" & callArgs.join(", ") & ")"
  if rawReturn == "void":
    lines.add "  " & callExpr
  elif ret.tupleReturn:
    if rawReturn == "bool":
      lines.add "  result.ok = " & callExpr
    else:
      lines.add "  result.returnValue = " & callExpr
  else:
    if rawReturn == "bool":
      lines.add "  if not " & callExpr & ":"
      lines.add "    return \"\""
    elif rawReturn != "void":
      lines.add "  let written = " & callExpr
      lines.add &"  if written > 0 and written.int < {buffers[0].bufferName}.len:"
      lines.add &"    {buffers[0].bufferName}.setLen(written.int)"

  for buffer in buffers:
    if ret.tupleReturn and rawReturn == "bool":
      lines.add &"  if result.ok:"
      lines.add &"    {buffer.bufferName}.zeroCap()"
      lines.add &"  else:"
      lines.add &"    {buffer.bufferName}.setLen(0)"
    else:
      lines.add &"  {buffer.bufferName}.zeroCap()"

  if ret.tupleReturn:
    for output in outputs:
      lines.add &"  result.{output.fieldName} = {output.varName}"
    for buffer in buffers:
      lines.add &"  result.{buffer.fieldName} = {buffer.bufferName}"
  else:
    lines.add &"  result = {buffers[0].bufferName}"

  lines.join("\n")

proc generateStringWrappers(ctx: GenContext): string =
  var lines: seq[string]
  for iface in children(ctx.api, "interfaces"):
    let className = publicTypeName(text(iface, "classname"))
    for m in children(iface, "methods"):
      let wrapper = generateStringWrapper(ctx, className, m)
      if wrapper.len > 0:
        lines.add wrapper
        lines.add ""
  for s in children(ctx.api, "structs"):
    let structName = publicTypeName(text(s, "struct"))
    for m in children(s, "methods"):
      let wrapper = generateStringWrapper(ctx, "ptr " & structName, m)
      if wrapper.len > 0:
        lines.add wrapper
        lines.add ""
  lines.join("\n")

proc generateCStringReturnWrapper(
  ctx: GenContext;
  selfType: string;
  m: JsonNode
): string =
  if mapReturnType(ctx, m) != "cstring":
    return ""

  let
    procName = nimProcName(text(m, "methodname"))
    rawName = procName & "Raw"
    params = children(m, "params")
    paramNames = paramNamesFor(params)

  var sigParams = @[&"self: {selfType}"]
  var callArgs: seq[string]
  for i, p in params:
    let
      paramName = paramNames[i]
      paramType = mapParamType(ctx, p)
    sigParams.add &"{paramName}: {helperParamType(paramType)}"
    callArgs.add helperArgExpr(paramName, paramType)

  var noRemoved: HashSet[int]
  var lines: seq[string]
  lines.add &"proc {procName}*({sigParams.join(\", \")}): string ="
  addCStringArrayTemps(lines, params, paramNames, ctx, noRemoved)
  addSteamParamStringArrayTemps(lines, params, paramNames, ctx, noRemoved)
  lines.add &"  steamString(self.{rawName}({callArgs.join(\", \")}))"
  result = lines.join("\n")

proc generateCStringReturnWrappers(ctx: GenContext): string =
  var lines: seq[string]
  for iface in children(ctx.api, "interfaces"):
    let className = publicTypeName(text(iface, "classname"))
    for m in children(iface, "methods"):
      let wrapper = generateCStringReturnWrapper(ctx, className, m)
      if wrapper.len > 0:
        lines.add wrapper
        lines.add ""
  for s in children(ctx.api, "structs"):
    let structName = publicTypeName(text(s, "struct"))
    for m in children(s, "methods"):
      let wrapper = generateCStringReturnWrapper(ctx, "ptr " & structName, m)
      if wrapper.len > 0:
        lines.add wrapper
        lines.add ""
  lines.join("\n")

proc generateCStringParamWrapper(
  ctx: GenContext;
  selfType: string;
  m: JsonNode
): string =
  if not methodHasCStringParam(ctx, m) or mapReturnType(ctx, m) == "cstring" or
      stringBuffersForMethod(ctx, m).len > 0 or
      cstringOutPointersForMethod(m).len > 0:
    return ""

  let
    procName = nimProcName(text(m, "methodname"))
    rawName = procName & "Raw"
    rawReturn = mapReturnType(ctx, m)
    params = children(m, "params")
    paramNames = paramNamesFor(params)

  var sigParams = @[&"self: {selfType}"]
  var callArgs: seq[string]
  for i, p in params:
    let
      paramName = paramNames[i]
      paramType = mapParamType(ctx, p)
    sigParams.add &"{paramName}: {helperParamType(paramType)}"
    callArgs.add helperArgExpr(paramName, paramType)

  var noRemoved: HashSet[int]
  var lines: seq[string]
  var signature = &"proc {procName}*({sigParams.join(\", \")})"
  if rawReturn != "void":
    signature.add ": " & rawReturn
  signature.add " ="
  lines.add signature
  addCStringArrayTemps(lines, params, paramNames, ctx, noRemoved)
  addSteamParamStringArrayTemps(lines, params, paramNames, ctx, noRemoved)
  if rawReturn == "void":
    lines.add &"  self.{rawName}({callArgs.join(\", \")})"
  else:
    lines.add &"  self.{rawName}({callArgs.join(\", \")})"
  result = lines.join("\n")

proc generateCStringParamWrappers(ctx: GenContext): string =
  var lines: seq[string]
  for iface in children(ctx.api, "interfaces"):
    let className = publicTypeName(text(iface, "classname"))
    for m in children(iface, "methods"):
      let wrapper = generateCStringParamWrapper(ctx, className, m)
      if wrapper.len > 0:
        lines.add wrapper
        lines.add ""
  for s in children(ctx.api, "structs"):
    let structName = publicTypeName(text(s, "struct"))
    for m in children(s, "methods"):
      let wrapper = generateCStringParamWrapper(ctx, "ptr " & structName, m)
      if wrapper.len > 0:
        lines.add wrapper
        lines.add ""
  lines.join("\n")

proc generateCStringOutPointerWrapper(
  ctx: GenContext;
  selfType: string;
  m: JsonNode
): string =
  let cstringOuts = cstringOutPointersForMethod(m)
  if cstringOuts.len == 0:
    return ""

  var removed: HashSet[int]
  for item in cstringOuts:
    removed.incl item.paramIndex

  let outputs = outputParamsForMethod(ctx, m, removed)
  for output in outputs:
    removed.incl output.paramIndex

  let
    params = children(m, "params")
    rawReturn = mapReturnType(ctx, m)
    procName = nimProcName(text(m, "methodname"))
    paramNames = paramNamesFor(params)

  var fields: seq[string]
  if rawReturn == "bool":
    fields.add "ok: bool"
  elif rawReturn != "void":
    fields.add "returnValue: " & rawReturn
  for output in outputs:
    fields.add output.fieldName & ": " & output.typ
  for item in cstringOuts:
    fields.add item.fieldName & ": string"

  var sigParams = @[&"self: {selfType}"]
  for i, p in params:
    if i in removed:
      continue
    let paramType = mapParamType(ctx, p)
    sigParams.add &"{paramNames[i]}: {helperParamType(paramType)}"

  var lines: seq[string]
  lines.add &"proc {procName}*({sigParams.join(\", \")}): tuple[{fields.join(\", \")}] ="

  for item in cstringOuts:
    lines.add &"  var {item.varName}: ptr char"
  for output in outputs:
    lines.add &"  var {output.varName}: {output.typ}"

  addCStringArrayTemps(lines, params, paramNames, ctx, removed)
  addSteamParamStringArrayTemps(lines, params, paramNames, ctx, removed)

  var callArgs: seq[string]
  for i, p in params:
    var handled = false
    for item in cstringOuts:
      if i == item.paramIndex:
        callArgs.add item.varName & ".addr"
        handled = true
        break
    if handled:
      continue
    for output in outputs:
      if i == output.paramIndex:
        callArgs.add output.varName & ".addr"
        handled = true
        break
    if not handled:
      let
        paramName = paramNames[i]
        paramType = mapParamType(ctx, p)
      callArgs.add helperArgExpr(paramName, paramType)

  let callExpr = "self." & procName & "Raw(" & callArgs.join(", ") & ")"
  if rawReturn == "bool":
    lines.add "  result.ok = " & callExpr
  elif rawReturn == "void":
    lines.add "  " & callExpr
  else:
    lines.add "  result.returnValue = " & callExpr

  for output in outputs:
    lines.add &"  result.{output.fieldName} = {output.varName}"
  for item in cstringOuts:
    lines.add &"  result.{item.fieldName} = steamString(cast[cstring]({item.varName}))"

  lines.join("\n")

proc generateCStringOutPointerWrappers(ctx: GenContext): string =
  var lines: seq[string]
  for iface in children(ctx.api, "interfaces"):
    let className = publicTypeName(text(iface, "classname"))
    for m in children(iface, "methods"):
      let wrapper = generateCStringOutPointerWrapper(ctx, className, m)
      if wrapper.len > 0:
        lines.add wrapper
        lines.add ""
  lines.join("\n")

proc isCharArrayType(cType: string): bool =
  var base, size: string
  parseArray(cType, base, size) and base.strip() == "char" and size.len > 0

proc shouldGenerateStringField(fieldName: string): bool =
  let lowered = fieldName.toLowerAscii()
  not (lowered == "padding" or lowered == "m_data" or
    lowered == "m_appdata")

proc generateStructStringAccessors(ctx: GenContext): string =
  var lines: seq[string]
  for s in children(ctx.api, "structs") & children(ctx.api, "callback_structs"):
    let structName = text(s, "struct")
    var usedNames: HashSet[string]
    for f in children(s, "fields"):
      let
        fieldName = text(f, "fieldname")
        fieldType = text(f, "fieldtype")
      if not isCharArrayType(fieldType) or not shouldGenerateStringField(fieldName):
        continue
      let procName = uniqueName(fieldNameFromParam(fieldName), usedNames)
      let
        ownerName = publicTypeName(structName)
        cleanFieldName = fieldNameFromParam(fieldName)
      lines.add &"proc {procName}*(self: {ownerName}): string ="
      lines.add &"  steamString(self.{cleanFieldName})"
      lines.add ""
      lines.add &"proc {procName}*(self: ptr {ownerName}): string ="
      lines.add &"  steamString(self[].{cleanFieldName})"
      lines.add ""
  lines.join("\n")

proc generateExtras(): string =
  result = """
{.pop.}

const defaultSteamworksBufferSize* = 8192

proc zeroCap(s: var string) =
  for i, c in s:
    if c == char(0):
      s.setLen(i)
      return

proc steamString*(chars: openArray[char]): string =
  result = newStringOfCap(chars.len)
  for c in chars:
    if c == char(0):
      return
    result.add c

proc steamString*(value: cstring): string =
  if value == nil:
    ""
  else:
    $value

proc InitFlat*(): InitResult =
  var errMsg: SteamErrMsg
  InitFlat(errMsg.addr)

proc InitFlat*(errorMessage: var string): InitResult =
  var errMsg: SteamErrMsg
  result = InitFlat(errMsg.addr)
  errorMessage = steamString(errMsg)

proc Init*(): bool =
  InitFlat() == initOk

proc GetSteamInstallPath*(): string =
  steamString(GetSteamInstallPathRaw())

proc getInstalledDepots*(
  self: ISteamApps,
  appID: AppId,
  maxDepots = 1024
): seq[DepotId] =
  if maxDepots <= 0:
    return @[]
  result.setLen(maxDepots)
  let count = self.getInstalledDepots(appID, result[0].addr, result.len.uint32)
  result.setLen(min(count.int, result.len))

proc getItemDownloadInfo*(
  self: ISteamUGC,
  publishedFileId: PublishedFileId
): tuple[ok: bool, bytesDownloaded, bytesTotal: uint64] =
  result.ok = self.getItemDownloadInfo(
    publishedFileId,
    result.bytesDownloaded.addr,
    result.bytesTotal.addr
  )

proc getSubscribedItems*(
  self: ISteamUGC,
  includeLocallyDisabled = false
): seq[PublishedFileId] =
  let count = self.getNumSubscribedItems(includeLocallyDisabled)
  if count == 0:
    return @[]
  result.setLen(count.int)
  let returned = self.getSubscribedItems(
    result[0].addr,
    count,
    includeLocallyDisabled
  )
  result.setLen(returned.int)

proc waitForApiCall*[T](
  self: ISteamUtils,
  steamAPICall: SteamAPICall,
  callbackExpected: int,
  timeoutMs = 30000,
  pollMs = 10
): tuple[ok: bool, failed: bool, timedOut: bool, data: T] =
  var elapsed = 0
  let actualPollMs = if pollMs <= 0: 10 else: pollMs

  RunCallbacks()
  while not self.isApiCallCompleted(steamAPICall, result.failed.addr):
    if timeoutMs >= 0 and elapsed >= timeoutMs:
      result.timedOut = true
      return
    sleep(actualPollMs)
    elapsed += actualPollMs
    RunCallbacks()

  RunCallbacks()
  result.ok = self.getApiCallResult(
    steamAPICall,
    result.data.addr,
    sizeof(T).cint,
    callbackExpected.cint,
    result.failed.addr
  )

"""

proc generate(api: JsonNode): string =
  let ctx = buildContext(api)
  result = Header
  result.add "\n"
  result.add "import std/os\n\n"
  result.add generateTypes(ctx)
  result.add "\n"
  result.add generateInterfaceHelpers(ctx)
  result.add "\n"
  result.add generateConstants(ctx)
  result.add "\n"
  result.add generateRuntimeImports()
  result.add generateAccessors(ctx)
  result.add generateInterfaceMethods(ctx)
  result.add generateStructMethods(ctx)
  result.add generateExtras()
  result.add "\n"
  result.add generateCStringReturnWrappers(ctx)
  result.add generateCStringParamWrappers(ctx)
  result.add generateCStringOutPointerWrappers(ctx)
  result.add generateStringWrappers(ctx)
  result.add generateStructStringAccessors(ctx)

proc main() =
  let root = currentSourcePath().parentDir / ".."
  let jsonPath = root / "steamworks_sdk_164" / "sdk" / "public" / "steam" /
    "steam_api.json"
  let outPath = root / "src" / "steamworks.nim"

  echo "Parsing: ", jsonPath
  let api = parseJson(readFile(jsonPath))
  let content = generate(api)
  writeFile(outPath, content)

  let ctx = buildContext(api)
  var totalMethods = 0
  for iface in children(api, "interfaces"):
    totalMethods += children(iface, "methods").len

  echo "Generated: ", outPath
  echo &"  Interfaces: {ctx.interfaces.len}"
  echo &"  Typedefs:   {ctx.typedefs.len}"
  echo &"  Enums:      {ctx.enums.len}"
  echo &"  Structs:    {ctx.structs.len}"
  echo &"  Callbacks:  {ctx.callbacks.len}"
  echo &"  Methods:    {totalMethods}"

when isMainModule:
  main()
