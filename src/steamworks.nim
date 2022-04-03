# This version uses the DLL api directly (No C++ or .lib files).
# Not need to use VC++. Gcc works even on windows.
import os

type
  ISteamApps = distinct pointer
  ISteamUser = distinct pointer
  ISteamFriends = distinct pointer
  ISteamUserStats = distinct pointer
  ISteamUtils = distinct pointer

  SteamAPICall = distinct uint64

  AppId = uint32
  SteamId = uint64

  FriendFlags* = enum
    FriendFlagNone = 0x00,
    FriendFlagBlocked = 0x01,
    FriendFlagFriendshipRequested = 0x02,
    FriendFlagImmediate = 0x04, # "regular" friend
    FriendFlagClanMember = 0x08,
    FriendFlagOnGameServer = 0x10,
    FriendFlagRequestingFriendship = 0x80,
    FriendFlagRequestingInfo = 0x100,
    FriendFlagIgnored = 0x200,
    FriendFlagIgnoredFriend = 0x400,
    FriendFlagChatMember = 0x1000,
    FriendFlagAll = 0xFFFF,

  NumberOfCurrentPlayers* = object {.pure, bycopy.}
    success: uint8 # Was the call successful? Returns 1 if it was; otherwise, 0 on failure.
    players: int32 # Number of players currently playing.

{.push stdcall, dynlib: "steam_api64".}

proc RestartAppIfNecessary*(ownAppID: AppId): bool {.importc: "SteamAPI_RestartAppIfNecessary".}
proc Init*(): bool {.importc: "SteamAPI_Init".}
proc RunCallbacks*() {.importc: "SteamAPI_RunCallbacks".}

proc SteamApps*(): ISteamApps {.importc: "SteamAPI_SteamApps_v008".}
proc isDlcInstalled*(self: ISteamApps, appID: AppId): bool {.importc: "SteamAPI_ISteamApps_BIsDlcInstalled".}
proc getAppInstallDir(self: ISteamApps, appID: AppId, folder: ptr char, folderBufferSize: uint32): uint32 {.importc: "SteamAPI_ISteamApps_GetAppInstallDir".}

proc isAppInstalled*(self: ISteamApps, appID: AppId): bool {.importc: "SteamAPI_ISteamApps_BIsAppInstalled".}
proc isVACBanned*(self: ISteamApps): bool {.importc: "SteamAPI_ISteamApps_BIsAppInstalled".}
proc getAppBuildId*(self: ISteamApps): int32 {.importc: "SteamAPI_ISteamApps_GetAppBuildId".}
proc getAppOwner*(self: ISteamApps): SteamID {.importc: "SteamAPI_ISteamApps_GetAppOwner".}
proc getCurrentBetaName*(self: ISteamApps, name: ptr char, nameBufferSize: cint): bool {.importc: "SteamAPI_ISteamApps_GetCurrentBetaName".}
proc GetCurrentGameLanguage*(self: ISteamApps): cstring {.importc: "SteamAPI_ISteamApps_GetCurrentGameLanguage".}

proc SteamUser*(): ISteamUser {.importc: "SteamAPI_SteamUser_v021".}
proc getSteamID*(self: ISteamUser): SteamId {.importc: "SteamAPI_ISteamUser_GetSteamID".}

proc SteamUserStats*(): ISteamUserStats {.importc: "SteamAPI_SteamUserStats_v012".}
proc getNumberOfCurrentPlayers*(self: ISteamUserStats): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers".}

proc SteamFriends*(): ISteamFriends {.importc: "SteamAPI_SteamFriends_v017".}
proc getPersonaName*(self: ISteamFriends): cstring {.importc: "SteamAPI_ISteamFriends_GetPersonaName".}
proc getFriendCount*(self: ISteamFriends, iFriendFlags: cint): cint {.importc: "SteamAPI_ISteamFriends_GetFriendCount".}
proc getFriendByIndex*(self: ISteamFriends, iFriend: cint, iFriendFlags: cint): SteamId {.importc: "SteamAPI_ISteamFriends_GetFriendByIndex".}
proc getFriendPersonaName*(self: ISteamFriends, steamIDFriend: SteamId): cstring {.importc: "SteamAPI_ISteamFriends_GetFriendPersonaName".}
proc replyToFriendMessage*(self: ISteamFriends, steamIDFriend: SteamId, msgToSend: cstring) {.importc: "SteamAPI_ISteamFriends_ReplyToFriendMessage".}
proc inviteUserToGame*(self: ISteamFriends, steamIDFriend: SteamId, connectString: cstring): bool {.importc: "SteamAPI_ISteamFriends_InviteUserToGame".}

proc SteamUtils*(): ISteamUtils {.importc: "SteamAPI_SteamUtils_v010".}
proc getAPICallResult*(self: ISteamUtils, steamAPICall: SteamAPICall, data: pointer, dataSize: cint, callbackExpected: cint, failed: ptr[bool]): bool {.importc: "SteamAPI_ISteamUtils_GetAPICallResult".}
proc isAPICallCompleted*(self: ISteamUtils, steamAPICall: SteamAPICall, failed: ptr[bool]): bool {.importc: "SteamAPI_ISteamUtils_IsAPICallCompleted".}
proc getAPICallFailureReason*(self: ISteamUtils, steamAPICall: SteamAPICall): cint  {.importc: "SteamAPI_ISteamUtils_GetAPICallFailureReason".}
{.pop.}

proc zeroCap(s: var string) =
  for i, c in s:
    if c == char(0):
      s.setLen(i)
      return

proc getAppInstallDir*(self: ISteamApps, appID: AppId): string =
  result = newString(1024)
  result.setLen(self.getAppInstallDir(appID, result[0].addr, result.len.uint32).int)

proc getCurrentBetaName*(self: ISteamApps): string =
  result = newString(1024)
  discard self.getCurrentBetaName(result[0].addr, result.len.cint)
  result.zeroCap()
