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

  NumberOfCurrentPlayers* = object # {.pure, bycopy.}
    success: uint8 # Was the call successful? Returns 1 if it was; otherwise, 0 on failure.
    players: int32 # Number of players currently playing.

  Universe {.pure.} = enum
    Invalid
    Public
    Beta
    Internal
    Dev
    # RC = 5, # no such universe anymore
    Max
  NotificationPosition* {.pure.} = enum
    TopLeft = 0,
    TopRight
    BottomLeft
    BottomRight
  SteamAPICallFailure* {.pure.} = enum
    None                # no failure
    SteamGone           # the local Steam process has gone away
    NetworkFailure      # the network connection to Steam has been broken, or was already broken
                        # SteamServersDisconnected_t callback will be sent around the same time
                        # SteamServersConnected_t will be sent when the client is able to talk to the Steam servers again
    InvalidHandle       # the SteamAPICall_t handle passed in no longer exists
    MismatchedCallback  # GetAPICallResult() was called with the wrong callback type for this API call

  GamepadTextInputMode* {.pure.} = enum
    Normal = 0
    Password

  # Controls number of allowed lines for the Big Picture gamepad text entry
  GamepadTextInputLineMode* {.pure.} = enum
    SingleLine = 0
    MultipleLines

  FloatingGamepadTextInputMode* {.pure.} = enum
    SingleLine = 0     # Enter dismisses the keyboard
    MultipleLines      # User needs to explictly close the keyboard
    Email              # Keyboard layout is email, enter dismisses the keyboard
    Numeric            # Keyboard layout is numeric, enter dismisses the keyboard

  # The context where text filtering is being done
  TextFilteringContext* {.pure.} = enum
    Unknown = 0  # Unknown context
    GameContent  # Game content, only legally required filtering is performed
    Chat         # Chat from another player
    Name         # Character or item name

  SteamIPv6ConnectivityProtocol* {.pure.} = enum
    Invalid = 0
    HTTP         # because a proxy may make this different than other protocols
    UDP          # test UDP connectivity. Uses a port that is commonly needed for other Steam stuff. If UDP works, TCP probably works.

  # For the above transport protocol, what do we think the local machine's connectivity to the internet over ipv6 is like
  SteamIPv6ConnectivityState* {.pure.} = enum
    Unknown = 0  # We haven't run a test yet
    Good         # We have recently been able to make a request on ipv6 for the given protocol
    Bad          # We failed to make a request, either because this machine has no ipv6 address assigned, or it has no upstream connectivity

  SteamAPIWarningMessageHook* = proc(i: int, s: cstring)

when defined(windows):
  const soname = "steam_api64"
elif defined(macosx):
  const soname = "libsteam_api.dylib"
else:
  const soname = "libsteam_api.so"
{.push stdcall, dynlib: soname.}

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
proc getSecondsSinceAppActive*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetSecondsSinceAppActive".}
proc getSecondsSinceComputerActive*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetSecondsSinceComputerActive".}
proc getConnectedUniverse*(self: ISteamUtils): Universe {.importc: "SteamAPI_ISteamUtils_GetConnectedUniverse".}
proc getServerRealTime*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetServerRealTime".}
proc getIPCountry*(self: ISteamUtils): cstring {.importc: "SteamAPI_ISteamUtils_GetIPCountry".}
proc getImageSize*(self: ISteamUtils; iImage: cint; pnWidth: ptr uint32; pnHeight: ptr uint32): bool {.importc: "SteamAPI_ISteamUtils_GetImageSize".}
proc getImageRGBA*(self: ISteamUtils; iImage: cint; pubDest: ptr uint8; nDestBufferSize: cint): bool {.importc: "SteamAPI_ISteamUtils_GetImageRGBA".}
proc getCurrentBatteryPower*(self: ISteamUtils): uint8 {.importc: "SteamAPI_ISteamUtils_GetCurrentBatteryPower".}
proc getAppID*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetAppID".}
proc setOverlayNotificationPosition*(self: ISteamUtils; eNotificationPosition: NotificationPosition) {.importc: "SteamAPI_ISteamUtils_SetOverlayNotificationPosition".}
proc isAPICallCompleted*(self: ISteamUtils; hSteamAPICall: SteamAPICall; pbFailed: ptr bool): bool {.importc: "SteamAPI_ISteamUtils_IsAPICallCompleted".}
proc getAPICallFailureReason*(self: ISteamUtils; hSteamAPICall: SteamAPICall): SteamAPICallFailure {.importc: "SteamAPI_ISteamUtils_GetAPICallFailureReason".}
proc getAPICallResult*(self: ISteamUtils; hSteamAPICall: SteamAPICall; pCallback: pointer; cubCallback: cint; iCallbackExpected: cint; pbFailed: ptr bool): bool {.importc: "SteamAPI_ISteamUtils_GetAPICallResult".}
proc getIPCCallCount*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetIPCCallCount".}
proc setWarningMessageHook*(self: ISteamUtils; pFunction: SteamAPIWarningMessageHook) {.importc: "SteamAPI_ISteamUtils_SetWarningMessageHook".}
proc isOverlayEnabled*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsOverlayEnabled".}
proc bOverlayNeedsPresent*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_BOverlayNeedsPresent".}
proc checkFileSignature*(self: ISteamUtils; szFileName: cstring): SteamAPICall {.importc: "SteamAPI_ISteamUtils_CheckFileSignature".}
proc showGamepadTextInput*(self: ISteamUtils; eInputMode: GamepadTextInputMode; eLineInputMode: GamepadTextInputLineMode; pchDescription: cstring; unCharMax: uint32; pchExistingText: cstring): bool {.importc: "SteamAPI_ISteamUtils_ShowGamepadTextInput".}
proc getEnteredGamepadTextLength*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetEnteredGamepadTextLength".}
proc getEnteredGamepadTextInput*(self: ISteamUtils; pchText: cstring; cchText: uint32): bool {.importc: "SteamAPI_ISteamUtils_GetEnteredGamepadTextInput".}
proc getSteamUILanguage*(self: ISteamUtils): cstring {.importc: "SteamAPI_ISteamUtils_GetSteamUILanguage".}
proc isSteamRunningInVR*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsSteamRunningInVR".}
proc setOverlayNotificationInset*(self: ISteamUtils; nHorizontalInset: cint; nVerticalInset: cint) {.importc: "SteamAPI_ISteamUtils_SetOverlayNotificationInset".}
proc isSteamInBigPictureMode*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsSteamInBigPictureMode".}
proc startVRDashboard*(self: ISteamUtils) {.importc: "SteamAPI_ISteamUtils_StartVRDashboard".}
proc isVRHeadsetStreamingEnabled*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled".}
proc setVRHeadsetStreamingEnabled*(self: ISteamUtils; bEnabled: bool) {.importc: "SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled".}
proc isSteamChinaLauncher*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsSteamChinaLauncher".}
proc initFilterText*(self: ISteamUtils; unFilterOptions: uint32): bool {.importc: "SteamAPI_ISteamUtils_InitFilterText".}
proc filterText*(self: ISteamUtils; eContext: TextFilteringContext; sourceSteamID: SteamID; pchInputMessage: cstring; pchOutFilteredText: cstring; nByteSizeOutFilteredText: uint32): cint {.importc: "SteamAPI_ISteamUtils_FilterText".}
proc getIPv6ConnectivityState*(self: ISteamUtils; eProtocol: SteamIPv6ConnectivityProtocol): SteamIPv6ConnectivityState {.importc: "SteamAPI_ISteamUtils_GetIPv6ConnectivityState".}
proc isSteamRunningOnSteamDeck*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsSteamRunningOnSteamDeck".}
proc showFloatingGamepadTextInput*(self: ISteamUtils; eKeyboardMode: FloatingGamepadTextInputMode; nTextFieldXPosition: cint; nTextFieldYPosition: cint; nTextFieldWidth: cint; nTextFieldHeight: cint): bool {.importc: "SteamAPI_ISteamUtils_ShowFloatingGamepadTextInput".}
proc setGameLauncherMode*(self: ISteamUtils; bLauncherMode: bool) {.importc: "SteamAPI_ISteamUtils_SetGameLauncherMode".}
proc dismissFloatingGamepadTextInput*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_DismissFloatingGamepadTextInput".}
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
