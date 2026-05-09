import std/[os, strformat]

import steamworks

const maxListed = 8

var
  checks = 0
  failures = 0

proc section(name: string) =
  echo ""
  echo "== ", name, " =="

proc info[T](label: string; value: T) =
  echo "     ", label, ": ", value

proc expect(label: string; condition: bool) =
  inc checks
  if condition:
    echo "ok   ", label
  else:
    inc failures
    echo "FAIL ", label

proc note(label: string) =
  echo ".... ", label

proc limited(count: SomeInteger; cap = maxListed): int =
  min(count.int, cap)

proc pumpNetworkingCallbacks(sockets: ISteamNetworkingSockets; cycles = 30) =
  for _ in 0 ..< cycles:
    RunCallbacks()
    sockets.runCallbacks()
    sleep(10)

proc main() =
  var initError: string
  let initResult = InitFlat(initError)
  expect("SteamAPI_InitFlat returns initOk", initResult == initOk)
  if initResult != initOk:
    info("init error", initError)
    quit(1)

  section("Runtime")
  expect("Steam client is running", IsSteamRunning())
  info("install path", GetSteamInstallPath())

  let
    steamApps = SteamApps()
    steamFriends = SteamFriends()
    steamUser = SteamUser()
    steamUserStats = SteamUserStats()
    steamUtils = SteamUtils()
    steamMatchmaking = SteamMatchmaking()
    steamParties = SteamParties()
    steamRemoteStorage = SteamRemoteStorage()
    steamScreenshots = SteamScreenshots()
    steamMusic = SteamMusic()
    steamHttp = SteamHTTP()
    steamInput = SteamInput()
    steamController = SteamController()
    steamUGC = SteamUGC()
    steamHtml = SteamHTMLSurface()
    steamInventory = SteamInventory()
    steamVideo = SteamVideo()
    steamParental = SteamParentalSettings()
    steamRemotePlay = SteamRemotePlay()
    steamNetworkingSockets = SteamNetworkingSockets_SteamAPI()
    steamNetworkingUtils = SteamNetworkingUtils_SteamAPI()

  let currentAppId = AppId(steamUtils.getAppId())

  section("User")
  let steamId = steamUser.getSteamId()
  expect("current Steam ID is non-zero", steamId != 0)
  info("logged on", steamUser.loggedOn())
  info("HSteamUser", steamUser.getHsteamUser())
  info("user data folder", steamUser.getUserDataFolder())
  info("player level", steamUser.getPlayerSteamLevel())
  info("voice sample rate", steamUser.getVoiceOptimalSampleRate())
  info("behind NAT", steamUser.isBehindNat())
  info("phone verified", steamUser.isPhoneVerified())
  info("two-factor enabled", steamUser.isTwoFactorEnabled())
  info("license for current app", steamUser.userHasLicenseForApp(steamId, currentAppId))

  section("Utils")
  expect("SteamUtils app id is non-zero", currentAppId != appIdInvalid)
  info("current app id", currentAppId)
  info("connected universe", steamUtils.getConnectedUniverse())
  info("server real time", steamUtils.getServerRealTime())
  info("seconds since app active", steamUtils.getSecondsSinceAppActive())
  info("seconds since computer active", steamUtils.getSecondsSinceComputerActive())
  info("battery power", steamUtils.getCurrentBatteryPower())
  info("IPC call count", steamUtils.getIpcCallCount())
  info("overlay enabled", steamUtils.isOverlayEnabled())
  info("overlay needs present", steamUtils.overlayNeedsPresent())
  info("Steam Deck", steamUtils.isSteamRunningOnSteamDeck())
  info("Big Picture", steamUtils.isSteamInBigPictureMode())
  info("SteamVR", steamUtils.isSteamRunningInVr())
  info("China launcher", steamUtils.isSteamChinaLauncher())
  discard steamUtils.initFilterText(0)
  info("filtered text", steamUtils.filterText(textFilteringContextChat, steamId, "hello <steam>"))
  info("IPv6 HTTP", steamUtils.getIpv6ConnectivityState(ipv6ConnectivityProtocolHttp))
  info("IPv6 UDP", steamUtils.getIpv6ConnectivityState(ipv6ConnectivityProtocolUdp))

  section("Apps")
  info("current language", steamApps.getCurrentGameLanguage())
  info("available languages", steamApps.getAvailableGameLanguages())
  info("subscribed", steamApps.isSubscribed())
  info("subscribed current app", steamApps.isSubscribedApp(currentAppId))
  info("installed current app", steamApps.isAppInstalled(currentAppId))
  info("install dir", steamApps.getAppInstallDir(currentAppId))
  info("launch command line", steamApps.getLaunchCommandLine())
  info("launch query param +connect_lobby", steamApps.getLaunchQueryParam("+connect_lobby"))
  info("current beta", steamApps.getCurrentBetaName())
  info("build id", steamApps.getAppBuildId())
  info("owner", steamApps.getAppOwner())
  info("VAC banned", steamApps.isVacBanned())
  info("low violence", steamApps.isLowViolence())
  info("cyber cafe", steamApps.isCybercafe())
  info("free weekend", steamApps.isSubscribedFromFreeWeekend())
  info("family sharing", steamApps.isSubscribedFromFamilySharing())
  info("purchase time", steamApps.getEarliestPurchaseUnixTime(currentAppId))

  let depots = steamApps.getInstalledDepots(currentAppId)
  info("installed depots", depots.len)
  for i, depot in depots[0 ..< limited(depots.len)]:
    info(&"depot {i}", depot)

  let dlcCount = steamApps.getDlcCount()
  expect("DLC count is non-negative", dlcCount >= 0)
  for i in 0 ..< limited(dlcCount):
    let dlc = steamApps.getDlcDataByIndex(i)
    info(&"DLC {i}", &"ok={dlc.ok} app={dlc.appId} available={dlc.available} name={dlc.name}")
    var downloaded, total: uint64
    info(&"DLC {i} download progress known",
      steamApps.getDlcDownloadProgress(dlc.appId, downloaded.addr, total.addr))

  var publicBetas, privateBetas: cint
  let betaCount = steamApps.getNumBetas(publicBetas.addr, privateBetas.addr)
  info("beta count", betaCount)
  info("public/private betas", &"{publicBetas}/{privateBetas}")
  for i in 0 ..< limited(betaCount):
    let beta = steamApps.getBetaInfo(i)
    info(&"beta {i}", &"ok={beta.ok} flags={beta.flags} build={beta.buildId} name={beta.betaName}")

  let detailsCall = steamApps.getFileDetails(getAppFilename())
  if detailsCall != apiCallInvalid:
    let details = waitForApiCall[FileDetailsResult](
      steamUtils,
      detailsCall,
      fileDetailsResultCallbackId,
      timeoutMs = 5000
    )
    info("file details callback", &"ok={details.ok} failed={details.failed} timedOut={details.timedOut} result={details.data.resultValue} size={details.data.fileSize}")
  else:
    note("file details call was invalid in this setup")

  section("Friends")
  info("persona", steamFriends.getPersonaName())
  info("persona state", steamFriends.getPersonaState())
  let friendCount = steamFriends.getFriendCount(friendFlagImmediate.cint)
  expect("friend count is non-negative", friendCount >= 0)
  for i in 0 ..< limited(friendCount):
    let friendId = steamFriends.getFriendByIndex(i.cint, friendFlagImmediate.cint)
    var gameInfo: FriendGameInfo
    let gameKnown = steamFriends.getFriendGamePlayed(friendId, gameInfo.addr)
    info(&"friend {i}", &"{friendId} {steamFriends.getFriendPersonaName(friendId)} rel={steamFriends.getFriendRelationship(friendId)} state={steamFriends.getFriendPersonaState(friendId)} gameKnown={gameKnown}")
    info(&"friend {i} level", steamFriends.getFriendSteamLevel(friendId))
    info(&"friend {i} rich presence keys", steamFriends.getFriendRichPresenceKeyCount(friendId))
    let avatar = steamFriends.getSmallFriendAvatar(friendId)
    if avatar > 0:
      var width, height: uint32
      if steamUtils.getImageSize(avatar, width.addr, height.addr):
        info(&"friend {i} avatar", &"{width}x{height}")
        let rgbaBytes = width.int * height.int * 4
        if rgbaBytes > 0 and rgbaBytes <= 512 * 512 * 4:
          var pixels = newSeq[uint8](rgbaBytes)
          info(&"friend {i} avatar RGBA", steamUtils.getImageRgba(avatar, pixels[0].addr, pixels.len.cint))

  let groupCount = steamFriends.getFriendsGroupCount()
  info("friend groups", groupCount)
  for i in 0 ..< limited(groupCount):
    let groupId = steamFriends.getFriendsGroupIdByIndex(i.cint)
    let members = steamFriends.getFriendsGroupMembersCount(groupId)
    info(&"friend group {i}", &"{steamFriends.getFriendsGroupName(groupId)} members={members}")
    if members > 0:
      var ids = newSeq[SteamId](members.int)
      steamFriends.getFriendsGroupMembersList(groupId, ids[0].addr, members)
      info(&"friend group {i} first member", ids[0])

  let clanCount = steamFriends.getClanCount()
  info("clans", clanCount)
  for i in 0 ..< limited(clanCount):
    let clanId = steamFriends.getClanByIndex(i.cint)
    info(&"clan {i}", &"{steamFriends.getClanName(clanId)} [{steamFriends.getClanTag(clanId)}] public={steamFriends.isClanPublic(clanId)} official={steamFriends.isClanOfficialGameGroup(clanId)}")

  info("coplay friends", steamFriends.getCoplayFriendCount())
  info("unread priority chats", steamFriends.getNumChatsWithUnreadPriorityMessages())

  section("User Stats")
  let achievementCount = steamUserStats.getNumAchievements()
  info("achievement count", achievementCount)
  for i in 0 ..< limited(achievementCount):
    let name = steamUserStats.getAchievementName(i.uint32)
    if name.len == 0:
      continue
    var achieved: bool
    var unlockTime: uint32
    discard steamUserStats.getAchievement(name, achieved.addr)
    discard steamUserStats.getAchievementAndUnlockTime(name, achieved.addr, unlockTime.addr)
    let displayName = steamUserStats.getAchievementDisplayAttribute(name, "name")
    info(&"achievement {i}", &"{name} achieved={achieved} unlock={unlockTime} display={displayName}")
    let icon = steamUserStats.getAchievementIcon(name)
    if icon > 0:
      var width, height: uint32
      info(&"achievement {i} icon size known", steamUtils.getImageSize(icon, width.addr, height.addr))

  let playersCall = steamUserStats.getNumberOfCurrentPlayers()
  if playersCall != apiCallInvalid:
    let players = waitForApiCall[NumberOfCurrentPlayers](
      steamUtils,
      playersCall,
      numberOfCurrentPlayersCallbackId,
      timeoutMs = 5000
    )
    expect("current players callback did not time out", not players.timedOut)
    info("current players", &"ok={players.ok} failed={players.failed} success={players.data.success} players={players.data.players}")

  let globalAchievementsCall = steamUserStats.requestGlobalAchievementPercentages()
  if globalAchievementsCall != apiCallInvalid:
    let globalAchievements = waitForApiCall[GlobalAchievementPercentagesReady](
      steamUtils,
      globalAchievementsCall,
      globalAchievementPercentagesReadyCallbackId,
      timeoutMs = 5000
    )
    info("global achievement percentages callback",
      &"ok={globalAchievements.ok} failed={globalAchievements.failed} timedOut={globalAchievements.timedOut} result={globalAchievements.data.resultValue}")
    if globalAchievements.ok and not globalAchievements.failed and not globalAchievements.timedOut:
      let top = steamUserStats.getMostAchievedAchievementInfo()
      info("most achieved achievement", &"return={top.returnValue} name={top.name} percent={top.percent} achieved={top.achieved}")

  section("Matchmaking and Parties")
  let favoriteCount = steamMatchmaking.getFavoriteGameCount()
  expect("favorite game count is non-negative", favoriteCount >= 0)
  for i in 0 ..< limited(favoriteCount):
    var appId: AppId
    var ip: uint32
    var connPort, queryPort: uint16
    var flags, lastPlayed: uint32
    if steamMatchmaking.getFavoriteGame(i.cint, appId.addr, ip.addr, connPort.addr,
        queryPort.addr, flags.addr, lastPlayed.addr):
      info(&"favorite game {i}", &"app={appId} ip={ip} conn={connPort} query={queryPort} flags={flags}")

  info("active party beacons", steamParties.getNumActiveBeacons())
  var locationCount: uint32
  if steamParties.getNumAvailableBeaconLocations(locationCount.addr):
    info("available party beacon locations", locationCount)
    if locationCount > 0:
      var locations = newSeq[SteamPartyBeaconLocation](min(locationCount.int, maxListed))
      info("party beacon location fetch",
        steamParties.getAvailableBeaconLocations(locations[0].addr, locations.len.uint32))

  section("Remote Storage")
  info("cloud enabled for account", steamRemoteStorage.isCloudEnabledForAccount())
  info("cloud enabled for app", steamRemoteStorage.isCloudEnabledForApp())
  var totalBytes, availableBytes: uint64
  info("quota known", steamRemoteStorage.getQuota(totalBytes.addr, availableBytes.addr))
  info("quota", &"{availableBytes}/{totalBytes}")

  let fileCount = steamRemoteStorage.getFileCount()
  expect("remote storage file count is non-negative", fileCount >= 0)
  for i in 0 ..< limited(fileCount):
    var fileSize: int32
    let fileName = steamRemoteStorage.getFileNameAndSize(i, fileSize.addr)
    info(&"cloud file {i}", &"{fileName} size={fileSize} exists={steamRemoteStorage.fileExists(fileName)} persisted={steamRemoteStorage.filePersisted(fileName)}")
    discard steamRemoteStorage.getSyncPlatforms(fileName)

  let localChangeCount = steamRemoteStorage.getLocalFileChangeCount()
  info("local file changes", localChangeCount)
  for i in 0 ..< limited(localChangeCount):
    var change: RemoteStorageLocalFileChange
    var pathType: RemoteStorageFilePathType
    info(&"local change {i}", steamRemoteStorage.getLocalFileChange(i, change.addr, pathType.addr))

  let cachedUgcCount = steamRemoteStorage.getCachedUgcCount()
  info("cached remote-storage UGC", cachedUgcCount)
  for i in 0 ..< limited(cachedUgcCount):
    let handle = steamRemoteStorage.getCachedUgcHandle(i.int32)
    let details = steamRemoteStorage.getUgcDetails(handle)
    info(&"cached UGC {i}", &"handle={handle} ok={details.ok} app={details.appId} size={details.fileSizeInBytes} name={details.name}")

  section("UGC")
  let subscribed = steamUGC.getSubscribedItems()
  info("subscribed workshop items", subscribed.len)
  for i, item in subscribed[0 ..< limited(subscribed.len)]:
    let install = steamUGC.getItemInstallInfo(item)
    let download = steamUGC.getItemDownloadInfo(item)
    info(&"subscribed item {i}", &"{item} state={steamUGC.getItemState(item)} install={install.ok} folder={install.folder} download={download.ok} {download.bytesDownloaded}/{download.bytesTotal}")

  let query = steamUGC.createQueryAllUgcRequest(
    ugcQueryRankedByVote,
    ugcMatchingUgcTypeItems,
    currentAppId,
    currentAppId,
    1'u32
  )
  if query != ugcQueryHandleInvalid:
    discard steamUGC.setReturnMetadata(query, true)
    discard steamUGC.setReturnKeyValueTags(query, true)
    discard steamUGC.setReturnAdditionalPreviews(query, true)
    discard steamUGC.setLanguage(query, "english")
    let queryCall = steamUGC.sendQueryUgcRequest(query)
    if queryCall != apiCallInvalid:
      let queryDone = waitForApiCall[SteamUGCQueryCompleted](
        steamUtils,
        queryCall,
        steamUgcQueryCompletedCallbackId,
        timeoutMs = 10000
      )
      info("UGC query callback", &"ok={queryDone.ok} failed={queryDone.failed} timedOut={queryDone.timedOut} result={queryDone.data.resultValue} returned={queryDone.data.numResultsReturned} total={queryDone.data.totalMatchingResults} next={queryDone.data.nextCursor()}")
      if queryDone.ok and not queryDone.failed and not queryDone.timedOut:
        for i in 0 ..< limited(queryDone.data.numResultsReturned, 3):
          var details: SteamUGCDetails
          if steamUGC.getQueryUgcResult(query, i.uint32, details.addr):
            info(&"UGC result {i}", &"{details.publishedFileId} {details.title()} score={details.score} owner={details.steamIdOwner}")
            info(&"UGC result {i} preview", steamUGC.getQueryUgcPreviewUrl(query, i.uint32))
            info(&"UGC result {i} metadata", steamUGC.getQueryUgcMetadata(query, i.uint32))
            let tagCount = steamUGC.getQueryUgcNumTags(query, i.uint32)
            for tag in 0 ..< limited(tagCount, 3):
              info(&"UGC result {i} tag {tag}",
                &"{steamUGC.getQueryUgcTag(query, i.uint32, tag.uint32)} / {steamUGC.getQueryUgcTagDisplayName(query, i.uint32, tag.uint32)}")
    discard steamUGC.releaseQueryUgcRequest(query)
  else:
    note("UGC query handle was invalid in this setup")

  section("HTTP")
  let request = steamHttp.createHttpRequest(
    httpMethodGet,
    "https://api.steampowered.com/ISteamWebAPIUtil/GetServerInfo/v1/?format=json"
  )
  if request != 0:
    discard steamHttp.setHttpRequestContextValue(request, 0x53545732'u64)
    discard steamHttp.setHttpRequestHeaderValue(request, "Accept", "application/json")
    discard steamHttp.setHttpRequestUserAgentInfo(request, "nim-steamworks-test2")
    discard steamHttp.setHttpRequestNetworkActivityTimeout(request, 10)
    var httpCall: SteamAPICall
    if steamHttp.sendHttpRequest(request, httpCall.addr) and httpCall != apiCallInvalid:
      let httpDone = waitForApiCall[HTTPRequestCompleted](
        steamUtils,
        httpCall,
        httpRequestCompletedCallbackId,
        timeoutMs = 10000
      )
      info("HTTP callback", &"ok={httpDone.ok} failed={httpDone.failed} timedOut={httpDone.timedOut} successful={httpDone.data.requestSuccessful} status={httpDone.data.statusCode} bytes={httpDone.data.bodySize}")
      if httpDone.ok and not httpDone.failed and not httpDone.timedOut:
        var bodySize: uint32
        if steamHttp.getHttpResponseBodySize(request, bodySize.addr):
          info("HTTP body size", bodySize)
          if bodySize > 0 and bodySize <= 4096:
            var body = newSeq[uint8](bodySize.int)
            info("HTTP body read", steamHttp.getHttpResponseBodyData(request, body[0].addr, bodySize))
    var timedOut: bool
    discard steamHttp.getHttpRequestWasTimedOut(request, timedOut.addr)
    info("HTTP timed out flag", timedOut)
    discard steamHttp.releaseHttpRequest(request)
  else:
    note("HTTP request handle was invalid in this setup")

  let cookies = steamHttp.createCookieContainer(false)
  if cookies != 0:
    discard steamHttp.setCookie(cookies, "example.invalid", "/", "test2=1")
    info("cookie container released", steamHttp.releaseCookieContainer(cookies))

  section("Input and Controller")
  let inputInit = steamInput.init(false)
  info("Steam Input init", inputInit)
  if inputInit:
    steamInput.runFrame(false)
    var inputHandles: array[16, InputHandle]
    let inputCount = steamInput.getConnectedControllers(inputHandles[0].addr)
    info("Steam Input controllers", inputCount)
    if inputCount > 0:
      let handle = inputHandles[0]
      info("first input type", steamInput.getInputTypeForHandle(handle))
      info("first input gamepad index", steamInput.getGamepadIndexForController(handle))
      var major, minor: cint
      info("first input binding revision", steamInput.getDeviceBindingRevision(handle, major.addr, minor.addr))
    discard steamInput.shutdown()

  let controllerInit = steamController.init()
  info("Steam Controller init", controllerInit)
  if controllerInit:
    steamController.runFrame()
    var controllerHandles: array[16, ControllerHandle]
    let controllerCount = steamController.getConnectedControllers(controllerHandles[0].addr)
    info("Steam Controller handles", controllerCount)
    if controllerCount > 0:
      let handle = controllerHandles[0]
      info("first controller type", steamController.getInputTypeForHandle(handle))
      var major, minor: cint
      info("first controller binding revision", steamController.getControllerBindingRevision(handle, major.addr, minor.addr))
    discard steamController.shutdown()

  section("Other Interfaces")
  info("screenshots hooked", steamScreenshots.isScreenshotsHooked())
  info("music enabled", steamMusic.isEnabled())
  info("music playing", steamMusic.isPlaying())
  info("music playback status", steamMusic.getPlaybackStatus())
  info("music volume", steamMusic.getVolume())

  let htmlInit = steamHtml.init()
  info("HTML surface init", htmlInit)
  if htmlInit:
    discard steamHtml.shutdown()

  var inventoryResult: SteamInventoryResult
  if steamInventory.getAllItems(inventoryResult.addr):
    info("inventory result", inventoryResult)
    info("inventory status", steamInventory.getResultStatus(inventoryResult))
    info("inventory timestamp", steamInventory.getResultTimestamp(inventoryResult))
    var itemCount: uint32
    discard steamInventory.getResultItems(inventoryResult, nil, itemCount.addr)
    info("inventory item count", itemCount)
    if itemCount > 0:
      var items = newSeq[SteamItemDetails](min(itemCount.int, maxListed))
      var requested = items.len.uint32
      if steamInventory.getResultItems(inventoryResult, items[0].addr, requested.addr):
        for i, item in items:
          info(&"inventory item {i}", &"id={item.itemId} def={item.definition} qty={item.quantity} flags={item.flags}")
    steamInventory.destroyResult(inventoryResult)
  else:
    note("inventory getAllItems was not available")
  info("inventory definitions loaded", steamInventory.loadItemDefinitions())
  var definitionCount: uint32
  discard steamInventory.getItemDefinitionIds(nil, definitionCount.addr)
  info("inventory definition count", definitionCount)
  info("inventory priced item count", steamInventory.getNumItemsWithPrices())

  var viewerCount: cint
  info("broadcasting", steamVideo.isBroadcasting(viewerCount.addr))
  info("broadcast viewers", viewerCount)
  info("OPF string", steamVideo.getOpfStringForApp(currentAppId))

  info("parental lock enabled", steamParental.isParentalLockEnabled())
  info("parental lock locked", steamParental.isParentalLockLocked())
  info("current app blocked", steamParental.isAppBlocked(currentAppId))
  info("current app in block list", steamParental.isAppInBlockList(currentAppId))
  info("community blocked", steamParental.isFeatureBlocked(featureCommunity))
  info("community in block list", steamParental.isFeatureInBlockList(featureCommunity))

  let remotePlaySessions = steamRemotePlay.getSessionCount()
  info("remote play sessions", remotePlaySessions)
  for i in 0 ..< limited(remotePlaySessions):
    let sessionId = steamRemotePlay.getSessionId(i.cint)
    var x, y: cint
    info(&"remote play session {i}", &"id={sessionId} steam={steamRemotePlay.getSessionSteamId(sessionId)} guest={steamRemotePlay.getSessionGuestId(sessionId)} name={steamRemotePlay.getSessionClientName(sessionId)} form={steamRemotePlay.getSessionClientFormFactor(sessionId)}")
    info(&"remote play session {i} resolution",
      steamRemotePlay.getSessionClientResolution(sessionId, x.addr, y.addr))

  section("Networking")
  var ipAddr: SteamNetworkingIPAddr
  ipAddr.addr.clear()
  ipAddr.addr.setIpv6LocalHost(27015)
  expect("SteamNetworkingIPAddr localhost", ipAddr.addr.isLocalHost())
  info("IP addr string", ipAddr.addr.toString(true))
  var parsedAddr: SteamNetworkingIPAddr
  info("parse IPv4 endpoint", parsedAddr.addr.parseString("127.0.0.1:27015"))
  info("parsed endpoint string", parsedAddr.addr.toString(true))
  info("fake IP type", parsedAddr.addr.getFakeIpType())

  var identity: SteamNetworkingIdentity
  identity.addr.clear()
  identity.addr.setSteamId(steamId)
  expect("networking identity round-trips Steam ID", identity.addr.getSteamId() == steamId)
  let identityText = identity.addr.toString()
  info("identity string", identityText)
  var parsedIdentity: SteamNetworkingIdentity
  info("parse identity", parsedIdentity.addr.parseString(identityText))
  info("parsed identity string", parsedIdentity.addr.toString())

  steamNetworkingUtils.initRelayNetworkAccess()
  var relayStatus: SteamRelayNetworkStatus
  info("relay status", steamNetworkingUtils.getRelayNetworkStatus(relayStatus.addr))
  var pingLocation: SteamNetworkPingLocation
  info("local ping age", steamNetworkingUtils.getLocalPingLocation(pingLocation.addr))
  let pingLocationText = steamNetworkingUtils.convertPingLocationToString(pingLocation.addr)
  info("local ping location", pingLocationText)
  var parsedPingLocation: SteamNetworkPingLocation
  if pingLocationText.len > 0:
    info("parse ping location", steamNetworkingUtils.parsePingLocationString(pingLocationText, parsedPingLocation.addr))
    info("ping self estimate", steamNetworkingUtils.estimatePingTimeBetweenTwoLocations(pingLocation.addr, parsedPingLocation.addr))
  info("ping data fresh", steamNetworkingUtils.checkPingDataUpToDate(60.0'f32))
  info("POP count", steamNetworkingUtils.getPopCount())
  info("network local timestamp", steamNetworkingUtils.getLocalTimestamp())

  var socketIdentity: SteamNetworkingIdentity
  info("socket identity known", steamNetworkingSockets.getIdentity(socketIdentity.addr))
  var authStatus: SteamNetAuthenticationStatus
  info("socket auth availability", steamNetworkingSockets.getAuthenticationStatus(authStatus.addr))

  var connA, connB: HSteamNetConnection
  if steamNetworkingSockets.createSocketPair(
      connA.addr,
      connB.addr,
      true,
      nil,
      nil
    ):
    info("socket pair", &"{connA}/{connB}")
    steamNetworkingSockets.setConnectionName(connA, "test2-a")
    steamNetworkingSockets.setConnectionName(connB, "test2-b")
    info("socket A name", steamNetworkingSockets.getConnectionName(connA))
    info("socket B status", steamNetworkingSockets.getDetailedConnectionStatus(connB))
    info("socket A closed", steamNetworkingSockets.closeConnection(connA, 0, "test2 close A", false))
    info("socket B closed", steamNetworkingSockets.closeConnection(connB, 0, "test2 close B", false))
    pumpNetworkingCallbacks(steamNetworkingSockets)
  else:
    note("socket pair could not be created")

  section("Summary")
  info("checks", checks)
  info("failures", failures)
  Shutdown()
  if failures > 0:
    quit(1)

main()
