import os
const sdkPath = currentSourcePath.parentDir().parentDir()
when defined(Windows):
  const dll = sdkPath & "/steamworks_sdk_151/redistributable_bin/win64/steam_api64.lib"
  {.link: dll.}
  const steam_api = sdkPath & "/steamworks_sdk_151/public/steam/steam_api.h"
when defined(MacOSX):
  const dll = sdkPath & "/steamworks_sdk_151/redistributable_bin/osx32/libsteam_api.dylib"
  {.link: dll.}
  const steam_api = sdkPath & "/steamworks_sdk_151/public/steam/steam_api.h"


var
  steamOk*: bool
  steamAppId*: uint32
  steamAccountId*: uint32
  steamUsername*: string
  steamAppDir*: string


type
  CSteamID* {.importcpp, header: steam_api.} = object
    ## 64 bits total
    m_unAccountID: uint32
    other: uint32

  ISteamApps* {.importcpp: "ISteamApps", header: steam_api.} = object
  ISteamFriends* {.importcpp} = object
  ISteamUserStats* {.importcpp} = object

  EFriendFlags* {.importcpp: "EFriendFlags".} = enum
    k_EFriendFlagImmediate

  EPersonaState* = enum
    Offline = 0 ## Friend is not currently logged on.
    Online = 1 ## Friend is logged on.
    Busy = 2 ## User is on, but busy.
    Away = 3 ## Auto-away feature.
    Snooze = 4 ## Auto-away for a long time.
    LookingToTrade = 5 ## Online, trading.
    LookingToPlay = 6 ## Online, wanting to play.
    Max = 7 ## The total number of states. Only used for looping and validation.

  ## Chat Entry Types.
  ## Returned by ISteamFriends::GetFriendMessage, ISteamFriends::GetClanChatMessage and ISteamMatchmaking::GetLobbyChatEntry.
  EChatEntryType* {.importcpp.} = enum
    Invalid = 0 ## Invalid.
    ChatMsg = 1 ## Normal text message from another user.
    Typing = 2 ## The other user is typing, not used in multi-user chat.
    InviteGame = 3 ## Invite from other user into that users current game.
    Emote = 4 ## Text emote message (Deprecated, should be treated as ChatMsg).
    LeftConversation = 6 ## A user has left the conversation (closed the chat window).
    Entered = 7 ## User has entered the conversation, used in multi-user chat and group chat.
    WasKicked = 8 ## User was kicked (Data: Steam ID of the user performing the kick).
    WasBanned = 9 ## User was banned (Data: Steam ID of the user performing the ban).
    Disconnected = 10 ## User disconnected.
    HistoricalChat = 11 ## A chat message from user's chat history or offline message.
    LinkBlocked = 14 ## A link was removed by the chat filter.

  CGameID* {.importcpp.} = object
    m_nAppID: uint32

  FriendGameInfo_t* {.importcpp.} = object
    m_gameID: CGameID
    m_unGameIP: uint32
    m_usGamePort: uint16

  SteamAPICall_t* {.importcpp.} = object

# buffer to copy string
const bufferSize: int = 4086
var buffer: cstring = cast[cstring](alloc(bufferSize))

proc SteamAPI_Init*(): bool {.importcpp, header: steam_api.}
proc SteamAPI_RunCallbacks*() {.importcpp, header: steam_api.}
proc SteamAPI_RestartAppIfNecessary*(appId: uint32): bool {.importcpp, header: steam_api.}

# steam apps
proc SteamApps*(): ptr ISteamApps {.importcpp.}
var steamApps*: ptr ISteamApps
proc BIsAppInstalled*(steamApps: ptr ISteamApps, appID: uint32): bool {.importcpp.}
proc BIsDlcInstalled*(steamApps: ptr ISteamApps, appID: uint32): bool {.importcpp.}
proc BIsVACBanned*(steamApps: ptr ISteamApps): bool {.importcpp.}
proc GetAppBuildId*(steamApps: ptr ISteamApps): int32 {.importcpp.}
proc GetAppInstallDir*(steamApps: ptr ISteamApps, appID: uint32, pchFolder: cstring, size:int): int64 {.importcpp.}
proc GetAppOwner*(steamApps: ptr ISteamApps): CSteamID {.importcpp.}
proc GetCurrentBetaName*(steamApps: ptr ISteamApps, pchName: cstring, cchNameBufferSize: int): bool {.importcpp.}
proc GetCurrentBetaName*(steamApps: ptr ISteamApps): string =
  discard steamApps.GetCurrentBetaName(buffer, bufferSize)
  return $buffer
proc GetCurrentGameLanguage*(steamApps: ptr ISteamApps): cstring =
  {.emit: "`result` = (char *)`steamApps`->GetCurrentGameLanguage();".}
proc GetDLCCount*(steamApps: ptr ISteamApps): int {.importcpp.}
proc GetDlcDownloadProgress*(steamApps: ptr ISteamApps, appID: uint32, punBytesDownloaded: ptr uint64, punBytesTotal: ptr uint64): int {.importcpp.}
proc GetEarliestPurchaseUnixTime*(steamApps: ptr ISteamApps, appID: uint32): uint32 {.importcpp.}
proc GetLaunchQueryParam*(steamApps: ptr ISteamApps, pchKey: cstring): cstring =
  {.emit: "`result` = (char *)`steamApps`->GetLaunchQueryParam(`pchKey`);".}


# steam friends
proc SteamFriends*(): ptr ISteamFriends {.importcpp.}
var steamFriends*: ptr ISteamFriends
proc ActivateGameOverlay(steamFriends: ptr ISteamFriends, pchDialog: cstring) {.importcpp.}
type DialogType* {.pure.} = enum
  friends
  community
  players
  settings
  officialgamegroup
  stats
  achievements
proc ActivateGameOverlay*(steamFriends: ptr ISteamFriends, dialog: DialogType) =
  steamFriends.ActivateGameOverlay($dialog)
proc GetFriendCount*(steamFriends: ptr ISteamFriends, iFriendFlags: int32): int32 {.importcpp.}
proc GetFriendByIndex*(steamFriends: ptr ISteamFriends, iFriend: int, iFriendFlags: int32): CSteamID {.importcpp.}
proc GetFriendPersonaState*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID): int32 {.importcpp.}
proc GetFriendGamePlayed*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID, FriendGameInfo_t: ptr ): bool {.importcpp.}
proc ReplyToFriendMessage*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID, pchMsgToSend: cstring): bool {.importcpp.}
proc SetListenForFriendsMessages*(steamFriends: ptr ISteamFriends, bInterceptEnabled : bool): bool {.importcpp.}
proc InviteUserToGame*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID, pchConnectString: cstring ): bool {.importcpp.}
proc GetFriendMessage*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID, iMessageID: int, pvData: cstring, cubData: int, peChatEntryType: ptr EChatEntryType): int {.importcpp.}


# steam user stats
proc SteamUserStats *(): ptr ISteamUserStats {.importcpp.}
var steamUserStats*: ptr ISteamUserStats
proc GetNumberOfCurrentPlayers*(steamUserStats: ptr ISteamUserStats): SteamAPICall_t {.importcpp.}

proc GetFriendPersonaName*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID): cstring =
  {.emit: "`result` = (char *)steamFriends->GetFriendPersonaName(`steamIDFriend`);".}
proc GetPersonaName*(steamFriends: ptr ISteamFriends): cstring =
  {.emit: "`result` = (char *)`steamFriends`->GetPersonaName();".}

# steam id
proc GetAccountID*(steamId: CSteamID): uint32 {.importcpp: "GetAccountID".}
proc getAppID(gameId: CGameID): uint32 =
  {.emit:[result, "=", gameId, ".AppID();"].}


type SteamPlayer* = object
  name*: string
  steamId*: CSteamID
  accountId*: uint32
  state*: EPersonaState
  playingAppId*: uint32


proc getSteamFriends*(): seq[SteamPlayer] =
  result = newSeq[SteamPlayer]()

  var numFriends = steamFriends.GetFriendCount(0x04)
  for i in 0..<numFriends:
    var steamId = steamFriends.GetFriendByIndex(i, 0x04)
    var accountId = steamId.GetAccountID()

    var name = steamFriends.GetFriendPersonaName(steamId)
    var state = steamFriends.GetFriendPersonaState(steamId)
    var stateR = EPersonaState(state)
    var playingAppId: uint32 = 0

    if stateR != Offline:
      var gameInfo = cast[ptr FriendGameInfo_t](alloc(sizeof(FriendGameInfo_t)))
      if steamFriends.GetFriendGamePlayed(steamId, gameInfo):
        playingAppId = gameInfo.m_gameID.getAppID()

    result.add SteamPlayer(
      name: $name,
      steamId: steamId,
      accountId: accountId,
      state: stateR,
      playingAppId: playingAppId
    )


proc getAppInstallDir*(steamApps: ptr ISteamApps, appId: uint32): string =
  var _ = steamApps.GetAppInstallDir(appId, buffer, bufferSize)
  return $buffer


proc sendMessageToFrind*(friend: SteamPlayer, message: string) =
  echo steamFriends.ReplyToFriendMessage(friend.steamId, message)
  return


proc setListenForFriendsMessages*(listen: bool) =
  echo steamFriends.SetListenForFriendsMessages(listen)


proc initSteamworks*(appId: uint32) =
  #if SteamAPI_RestartAppIfNecessary(appId):
  #  quit()

  steamOk = SteamAPI_Init()
  if steamOk:
    steamApps = SteamApps()
    steamFriends = SteamFriends()
    steamUserStats = SteamUserStats()

    steamAppId = appId
    steamAccountId = steamApps.GetAppOwner().GetAccountID()
    steamUsername = $steamFriends.GetPersonaName()
    steamAppDir = steamApps.getAppInstallDir(steamAppId)


# get number of CurrentPlayers
var numberOfCurrentPlayersCb*: proc (number: int)
proc numberOfCurrentPlayers(number: int) {.cdecl.} =
  numberOfCurrentPlayersCb(number)


var onGameConnectedFriendChatMsgCb*: proc(steamId: CSteamID, msgId: cint)
proc onGameConnectedFriendChatMsgInternal(steamId: CSteamID, msgId: cint) {.cdecl.} =
  if onGameConnectedFriendChatMsgCb != nil:
    onGameConnectedFriendChatMsgCb(steamId, msgId)


var onGameOverlayActivatedCb*: proc(active: bool)
proc onGameOverlayActivatedInternal(active: bool) {.cdecl.} =
  if onGameOverlayActivatedCb != nil:
    onGameOverlayActivatedCb(active)


var onNewLaunchQueryParametersCb*: proc()
proc onNewLaunchQueryParametersInternal() {.cdecl.} =
  if onNewLaunchQueryParametersCb != nil:
    onNewLaunchQueryParametersCb()


{.emit: """
// In your class definition
class CallBackSync {
  public:
 void OnGetNumberOfCurrentPlayers(NumberOfCurrentPlayers_t *pCallback, bool bIOFailure);
 CCallResult< CallBackSync, NumberOfCurrentPlayers_t > m_NumberOfCurrentPlayersCallResult;

  STEAM_CALLBACK(CallBackSync, OnGameConnectedFriendChatMessage, GameConnectedFriendChatMsg_t);

  STEAM_CALLBACK(CallBackSync, OnGameOverlayActivated, GameOverlayActivated_t);

  STEAM_CALLBACK(CallBackSync, OnNewLaunchQueryParameters, NewLaunchQueryParameters_t);


};

void CallBackSync::OnGetNumberOfCurrentPlayers(NumberOfCurrentPlayers_t *pCallback, bool bIOFailure){
  `numberOfCurrentPlayers`(pCallback->m_cPlayers);
}

void CallBackSync::OnGameConnectedFriendChatMessage(GameConnectedFriendChatMsg_t *pCallback) {
  `onGameConnectedFriendChatMsgInternal`(pCallback->m_steamIDUser, pCallback->m_iMessageID);
}

void CallBackSync::OnGameOverlayActivated(GameOverlayActivated_t* pCallback) {
 `onGameOverlayActivatedInternal`(pCallback->m_bActive);
}

void CallBackSync::OnNewLaunchQueryParameters(NewLaunchQueryParameters_t* pCallback) {
 `onNewLaunchQueryParametersInternal`();
}

CallBackSync *cbs = new CallBackSync();

""".}


proc getNumberOfCurrentPlayers*(steamUserStats: ptr ISteamUserStats, callBack: proc(number: int)) =
  numberOfCurrentPlayersCb = callBack
  {.emit: """
  SteamAPICall_t hSteamAPICall = `steamUserStats`->GetNumberOfCurrentPlayers();
  cbs->m_NumberOfCurrentPlayersCallResult.Set(hSteamAPICall, cbs, &CallBackSync::OnGetNumberOfCurrentPlayers);
  """.}


proc onGameConnectedFriendChatMsg*(steamFriends: ptr ISteamFriends, callBack: proc(steamId: CSteamID, msgId: cint)) =
  onGameConnectedFriendChatMsgCb = callBack


proc onGameOverlayActivated*(steamFriends: ptr ISteamFriends, callBack: proc(active: bool)) =
  onGameOverlayActivatedCb = callBack


proc onNewLaunchQueryParameters*(steamApps: ptr ISteamApps, callBack: proc()) =
  onNewLaunchQueryParametersCb = callBack