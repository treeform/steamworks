when defined(Windows):
  const dll = "c:/Users/me/Dropbox/p/istrolid2/steamworks/steamworks_sdk_142/redistributable_bin/win64/steam_api64.lib"
  {.link: dll.}
  const steam_api = "c:/Users/me/Dropbox/p/istrolid2/steamworks/steamworks_sdk_142/public/steam/steam_api.h"
when defined(MacOSX):
  const dll = "/Users/me/Dropbox/p/istrolid2/steamworks/steamworks_sdk_142/redistributable_bin/osx32/libsteam_api.dylib"
  {.link: dll.}
  const steam_api = "/Users/me/Dropbox/p/istrolid2/steamworks/steamworks_sdk_142/public/steam/steam_api.h"


type
  CSteamID {.importcpp: "CSteamID".} = object
  ISteamApps* {.importcpp: "ISteamApps".} = object
  ISteamFriends* {.importcpp: "ISteamFriends".} = object
  EFriendFlags* {.importcpp: "EFriendFlags".} = enum
    k_EFriendFlagImmediate

  EPersonaState* = enum
    k_EPersonaStateOffline = 0 ## Friend is not currently logged on.
    k_EPersonaStateOnline = 1 ## Friend is logged on.
    k_EPersonaStateBusy = 2 ## User is on, but busy.
    k_EPersonaStateAway = 3 ## Auto-away feature.
    k_EPersonaStateSnooze = 4 ## Auto-away for a long time.
    k_EPersonaStateLookingToTrade = 5 ## Online, trading.
    k_EPersonaStateLookingToPlay = 6 ## Online, wanting to play.
    k_EPersonaStateMax = 7 ## The total number of states. Only used for looping and validation.

  CGameID* {.importcpp: "CGameID".} = object
    m_nAppID: uint32

  FriendGameInfo_t* {.importcpp: "FriendGameInfo_t".} = object
    m_gameID: CGameID
    m_unGameIP: uint32
    m_usGamePort: uint16

proc SteamAPI_Init*(): bool {.importcpp: "SteamAPI_Init", header: steam_api.}

# steam apps
proc SteamApps*(): ptr ISteamApps {.importcpp: "SteamApps".}

proc BIsAppInstalled*(steamApps: ptr ISteamApps, appID: uint32): bool {.importcpp: "BIsAppInstalled".}
proc BIsDlcInstalled*(steamApps: ptr ISteamApps, appID: uint32): bool {.importcpp: "BIsDlcInstalled".}
proc BIsVACBanned*(steamApps: ptr ISteamApps): bool {.importcpp: "BIsVACBanned".}
proc GetAppBuildId*(steamApps: ptr ISteamApps): int32 {.importcpp: "GetAppBuildId".}
proc GetAppInstallDir*(steamApps: ptr ISteamApps, appID: uint32, pchFolder: cstring, size:int): int64 {.importcpp: "GetAppInstallDir".}
proc GetAppOwner*(steamApps: ptr ISteamApps): CSteamID {.importcpp: "GetAppOwner".}

# steam friends
proc SteamFriends*(): ptr ISteamFriends {.importcpp: "SteamFriends".}
proc GetFriendCount*(steamFriends: ptr ISteamFriends, iFriendFlags: int32): int32 {.importcpp: "GetFriendCount".}
proc GetFriendByIndex*(steamFriends: ptr ISteamFriends, iFriend: int, iFriendFlags: int32): CSteamID {.importcpp: "GetFriendByIndex".}
proc GetFriendPersonaState*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID): int32 {.importcpp: "GetFriendPersonaState".}
proc GetFriendGamePlayed*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID, FriendGameInfo_t: ptr ): bool {.importcpp: "GetFriendGamePlayed".}

#proc GetFriendPersonaName*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID): cstring {.importcpp: "GetFriendPersonaName".}
proc GetFriendPersonaName*(steamFriends: ptr ISteamFriends, steamIDFriend: CSteamID): cstring =
    {.emit: [result, "= (char *)SteamFriends()->GetFriendPersonaName(", steamIDFriend, ");"].}
proc GetPersonaName*(steamFriends: ptr ISteamFriends): cstring =
    {.emit: [result, "= (char *)SteamFriends()->GetPersonaName();"].}

# steam id
proc GetAccountID*(steamId: CSteamID): uint32 {.importcpp: "GetAccountID".}


proc getAppID(gameId: CGameID): uint32 =
  {.emit:[result, "=", gameId, ".AppID();"].}

type SteamPlayer* = object
  name*: string
  accountId*: int
  state*: EPersonaState
  inGame*: bool
  inOtherGameId*: int

var
  steamOk*: bool
  steamAccountId*: uint32
  steamName*: string
  steamAppDir*: string
  steamPlayers* = newSeq[SteamPlayer]()

const bufferSize: int = 4086
var buffer: cstring = cast[cstring](alloc(bufferSize))


proc updateSteamFriends*() =
  var numFriends = SteamFriends().GetFriendCount(0x04)
  for i in 0..<numFriends:
    var steamId = SteamFriends().GetFriendByIndex(i, 0x04)
    var accountId = steamId.GetAccountID()

    var name = SteamFriends().GetFriendPersonaName(steamId)
    var state = SteamFriends().GetFriendPersonaState(steamId)
    var stateR = EPersonaState(state)
    var inOtherGameId: uint32 = 0
    var inGame = false
    if stateR != k_EPersonaStateOffline:
      #echo accountId, " ", $s
      #echo "state: ", stateR
      var gameInfo = cast[ptr FriendGameInfo_t](alloc(sizeof(FriendGameInfo_t)))
      if SteamFriends().GetFriendGamePlayed(steamId, gameInfo):
        #echo "  got game info, IP:", gameInfo.m_unGameIP
        #echo "  game id: ", gameInfo.m_gameID.getAppID()
        inOtherGameId = gameInfo.m_gameID.getAppID()
        if gameInfo.m_gameID.getAppID() == 449140:
          inGame = true
    steamPlayers.add SteamPlayer(
      name: $name,
      accountId: int(accountId),
      state: stateR,
      inOtherGameId: int(inOtherGameId),
      inGame: inGame
    )


proc loadSteamworks*() =
  # buffer to copy string
  steamOk = SteamAPI_Init()

  if steamOk:
    steamAccountId = SteamApps().GetAppOwner().GetAccountID()
    steamName = $SteamFriends().GetPersonaName()
    #echo "is app 449140 installed? ", SteamApps().BIsAppInstalled(449140)
    #echo "is dlc 472490 installed? ", SteamApps().BIsDlcInstalled(472490)
    #echo "is dlc 614180 installed? ", SteamApps().BIsDlcInstalled(614180)
    #echo "is VAC banned? ", SteamApps().BIsVACBanned()
    #echo "GetAppBuildId: ", SteamApps().GetAppBuildId()

    var _ = SteamApps().GetAppInstallDir(449140, buffer, bufferSize)
    steamAppDir = $(buffer)
    echo "steamAppDir: ",  steamAppDir

    updateSteamFriends()

    #echo "exit"
    #echo GetAppOwner()

#loadSteamworks()
