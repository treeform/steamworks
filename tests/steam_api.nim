when defined(Windows):
  const dynlibsteam_api = "steam_api.dll"

when defined(Linux):
  const dynlibsteam_api = "libsteam_api.so"

when defined(MacOSX):
  const dynlibsteam_api = "libsteam_api.dylib"

import strutils


const
  k_nMaxLobbyKeyLength* = 255
  INVALID_SCREENSHOT_HANDLE* = 0
  k_SteamMusicNameMaxLength* = 255
  k_SteamMusicPNGMaxLength* = 65535
  INVALID_HTTPREQUEST_HANDLE* = 0
  INVALID_HTTPCOOKIE_HANDLE* = 0
  STEAM_CONTROLLER_MAX_COUNT* = 16
  STEAM_CONTROLLER_MAX_ANALOG_ACTIONS* = 16
  STEAM_CONTROLLER_MAX_DIGITAL_ACTIONS* = 128
  STEAM_CONTROLLER_MAX_ORIGINS* = 8
  STEAM_CONTROLLER_MIN_ANALOG_ACTION_DATA* = -1.0
  STEAM_CONTROLLER_MAX_ANALOG_ACTION_DATA* = 1.0
  POSIX* = 1
  QUERY_PORT_NOT_INITIALIZED* = 0x00000000
  QUERY_PORT_ERROR* = 0x00000000

type
#  uint8* = cuchar
  uint8* = cuchar
  int8* = cchar
  uint16* = int16
  uint32* = int32
  uint64* = int64
  lint64* = int64
  ulint64* = uint64
  uintp* = int32

const k_cubSaltSize* = 8

type
  Salt_t* = array[k_cubSaltSize, uint8]
  GID_t* = uint64

var k_GIDNil* {.importcpp: "k_GIDNil", dynlib: dynlibsteam_api.}: GID_t

type
  JobID_t* = uint64
  TxnID_t* = GID_t

var k_TxnIDNil* {.importcpp: "k_TxnIDNil", dynlib: dynlibsteam_api.}: GID_t

var k_TxnIDUnknown* {.importcpp: "k_TxnIDUnknown", dynlib: dynlibsteam_api.}: GID_t

var k_JobIDNil* {.importcpp: "k_JobIDNil", dynlib: dynlibsteam_api.}: JobID_t

type
  PackageId_t* = uint32

var k_uPackageIdFreeSub* {.importcpp: "k_uPackageIdFreeSub", dynlib: dynlibsteam_api.}: PackageId_t

var k_uPackageIdInvalid* {.importcpp: "k_uPackageIdInvalid", dynlib: dynlibsteam_api.}: PackageId_t

type
  BundleId_t* = uint32

var k_uBundleIdInvalid* {.importcpp: "k_uBundleIdInvalid", dynlib: dynlibsteam_api.}: BundleId_t

type
  AppId_t* = uint32

var k_uAppIdInvalid* {.importcpp: "k_uAppIdInvalid", dynlib: dynlibsteam_api.}: AppId_t

type
  AssetClassId_t* = uint64

var k_ulAssetClassIdInvalid* {.importcpp: "k_ulAssetClassIdInvalid", dynlib: dynlibsteam_api.}: AssetClassId_t

type
  PhysicalItemId_t* = uint32

var k_uPhysicalItemIdInvalid* {.importcpp: "k_uPhysicalItemIdInvalid", dynlib: dynlibsteam_api.}: PhysicalItemId_t

type
  DepotId_t* = uint32

var k_uDepotIdInvalid* {.importcpp: "k_uDepotIdInvalid", dynlib: dynlibsteam_api.}: DepotId_t

type
  RTime32* = uint32
  CellID_t* = uint32

var k_uCellIDInvalid* {.importcpp: "k_uCellIDInvalid", dynlib: dynlibsteam_api.}: CellID_t

type
  SteamAPICall_t* = uint64

var k_uAPICallInvalid* {.importcpp: "k_uAPICallInvalid", dynlib: dynlibsteam_api.}: SteamAPICall_t

type
  AccountID_t* = uint32
  PartnerId_t* = uint32

var k_uPartnerIdInvalid* {.importcpp: "k_uPartnerIdInvalid", dynlib: dynlibsteam_api.}: PartnerId_t

type
  ManifestId_t* = uint64

var k_uManifestIdInvalid* {.importcpp: "k_uManifestIdInvalid", dynlib: dynlibsteam_api.}: ManifestId_t

type
  SiteId_t* = uint64

var k_ulSiteIdInvalid* {.importcpp: "k_ulSiteIdInvalid", dynlib: dynlibsteam_api.}: SiteId_t

type
  EUniverse* {.size: sizeof(cint).} = enum
    k_EUniverseInvalid = 0, k_EUniversePublic = 1, k_EUniverseBeta = 2, k_EUniverseInternal = 3, k_EUniverseDev = 4, k_EUniverseMax


type
  EResult* {.size: sizeof(cint).} = enum
    k_EResultOK = 1, k_EResultFail = 2, k_EResultNoConnection = 3, k_EResultInvalidPassword = 5, k_EResultLoggedInElsewhere = 6, k_EResultInvalidProtocolVer = 7, k_EResultInvalidParam = 8, k_EResultFileNotFound = 9, k_EResultBusy = 10, k_EResultInvalidState = 11, k_EResultInvalidName = 12, k_EResultInvalidEmail = 13, k_EResultDuplicateName = 14, k_EResultAccessDenied = 15, k_EResultTimeout = 16, k_EResultBanned = 17, k_EResultAccountNotFound = 18, k_EResultInvalidSteamID = 19, k_EResultServiceUnavailable = 20, k_EResultNotLoggedOn = 21, k_EResultPending = 22, k_EResultEncryptionFailure = 23, k_EResultInsufficientPrivilege = 24, k_EResultLimitExceeded = 25, k_EResultRevoked = 26, k_EResultExpired = 27, k_EResultAlreadyRedeemed = 28, k_EResultDuplicateRequest = 29, k_EResultAlreadyOwned = 30, k_EResultIPNotFound = 31, k_EResultPersistFailed = 32, k_EResultLockingFailed = 33, k_EResultLogonSessionReplaced = 34, k_EResultConnectFailed = 35, k_EResultHandshakeFailed = 36, k_EResultIOFailure = 37, k_EResultRemoteDisconnect = 38, k_EResultShoppingCartNotFound = 39, k_EResultBlocked = 40, k_EResultIgnored = 41, k_EResultNoMatch = 42, k_EResultAccountDisabled = 43, k_EResultServiceReadOnly = 44, k_EResultAccountNotFeatured = 45, k_EResultAdministratorOK = 46, k_EResultContentVersion = 47, k_EResultTryAnotherCM = 48, k_EResultPasswordRequiredToKickSession = 49, k_EResultAlreadyLoggedInElsewhere = 50, k_EResultSuspended = 51, k_EResultCancelled = 52, k_EResultDataCorruption = 53, k_EResultDiskFull = 54, k_EResultRemoteCallFailed = 55, k_EResultPasswordUnset = 56, k_EResultExternalAccountUnlinked = 57, k_EResultPSNTicketInvalid = 58, k_EResultExternalAccountAlreadyLinked = 59, k_EResultRemoteFileConflict = 60, k_EResultIllegalPassword = 61, k_EResultSameAsPreviousValue = 62, k_EResultAccountLogonDenied = 63, k_EResultCannotUseOldPassword = 64, k_EResultInvalidLoginAuthCode = 65, k_EResultAccountLogonDeniedNoMail = 66, k_EResultHardwareNotCapableOfIPT = 67, k_EResultIPTInitError = 68, k_EResultParentalControlRestricted = 69, k_EResultFacebookQueryError = 70, k_EResultExpiredLoginAuthCode = 71, k_EResultIPLoginRestrictionFailed = 72, k_EResultAccountLockedDown = 73, k_EResultAccountLogonDeniedVerifiedEmailRequired = 74, k_EResultNoMatchingURL = 75, k_EResultBadResponse = 76, k_EResultRequirePasswordReEntry = 77, k_EResultValueOutOfRange = 78, k_EResultUnexpectedError = 79, k_EResultDisabled = 80, k_EResultInvalidCEGSubmission = 81, k_EResultRestrictedDevice = 82, k_EResultRegionLocked = 83, k_EResultRateLimitExceeded = 84, k_EResultAccountLoginDeniedNeedTwoFactor = 85, k_EResultItemDeleted = 86, k_EResultAccountLoginDeniedThrottle = 87, k_EResultTwoFactorCodeMismatch = 88, k_EResultTwoFactorActivationCodeMismatch = 89, k_EResultAccountAssociatedToMultiplePartners = 90, k_EResultNotModified = 91, k_EResultNoMobileDevice = 92, k_EResultTimeNotSynced = 93, k_EResultSmsCodeFailed = 94, k_EResultAccountLimitExceeded = 95, k_EResultAccountActivityLimitExceeded = 96, k_EResultPhoneActivityLimitExceeded = 97, k_EResultRefundToWallet = 98, k_EResultEmailSendFailure = 99, k_EResultNotSettled = 100, k_EResultNeedCaptcha = 101, k_EResultGSLTDenied = 102, k_EResultGSOwnerDenied = 103, k_EResultInvalidItemType = 104, k_EResultIPBanned = 105, k_EResultGSLTExpired = 106, k_EResultInsufficientFunds = 107, k_EResultTooManyPending = 108, k_EResultNoSiteLicensesFound = 109, k_EResultWGNetworkSendExceeded = 110, k_EResultAccountNotFriends = 111, k_EResultLimitedUserAccount = 112


type
  EVoiceResult* {.size: sizeof(cint).} = enum
    k_EVoiceResultOK = 0, k_EVoiceResultNotInitialized = 1, k_EVoiceResultNotRecording = 2, k_EVoiceResultNoData = 3, k_EVoiceResultBufferTooSmall = 4, k_EVoiceResultDataCorrupted = 5, k_EVoiceResultRestricted = 6, k_EVoiceResultUnsupportedCodec = 7, k_EVoiceResultReceiverOutOfDate = 8, k_EVoiceResultReceiverDidNotAnswer = 9


type
  EDenyReason* {.size: sizeof(cint).} = enum
    k_EDenyInvalid = 0, k_EDenyInvalidVersion = 1, k_EDenyGeneric = 2, k_EDenyNotLoggedOn = 3, k_EDenyNoLicense = 4, k_EDenyCheater = 5, k_EDenyLoggedInElseWhere = 6, k_EDenyUnknownText = 7, k_EDenyIncompatibleAnticheat = 8, k_EDenyMemoryCorruption = 9, k_EDenyIncompatibleSoftware = 10, k_EDenySteamConnectionLost = 11, k_EDenySteamConnectionError = 12, k_EDenySteamResponseTimedOut = 13, k_EDenySteamValidationStalled = 14, k_EDenySteamOwnerLeftGuestUser = 15


type
  HAuthTicket* = uint32

var k_HAuthTicketInvalid* {.importcpp: "k_HAuthTicketInvalid", dynlib: dynlibsteam_api.}: HAuthTicket

type
  EBeginAuthSessionResult* {.size: sizeof(cint).} = enum
    k_EBeginAuthSessionResultOK = 0, k_EBeginAuthSessionResultInvalidTicket = 1, k_EBeginAuthSessionResultDuplicateRequest = 2, k_EBeginAuthSessionResultInvalidVersion = 3, k_EBeginAuthSessionResultGameMismatch = 4, k_EBeginAuthSessionResultExpiredTicket = 5


type
  EAuthSessionResponse* {.size: sizeof(cint).} = enum
    k_EAuthSessionResponseOK = 0, k_EAuthSessionResponseUserNotConnectedToSteam = 1, k_EAuthSessionResponseNoLicenseOrExpired = 2, k_EAuthSessionResponseVACBanned = 3, k_EAuthSessionResponseLoggedInElseWhere = 4, k_EAuthSessionResponseVACCheckTimedOut = 5, k_EAuthSessionResponseAuthTicketCanceled = 6, k_EAuthSessionResponseAuthTicketInvalidAlreadyUsed = 7, k_EAuthSessionResponseAuthTicketInvalid = 8, k_EAuthSessionResponsePublisherIssuedBan = 9


type
  EUserHasLicenseForAppResult* {.size: sizeof(cint).} = enum
    k_EUserHasLicenseResultHasLicense = 0, k_EUserHasLicenseResultDoesNotHaveLicense = 1, k_EUserHasLicenseResultNoAuth = 2


type
  EAccountType* {.size: sizeof(cint).} = enum
    k_EAccountTypeInvalid = 0, k_EAccountTypeIndividual = 1, k_EAccountTypeMultiseat = 2, k_EAccountTypeGameServer = 3, k_EAccountTypeAnonGameServer = 4, k_EAccountTypePending = 5, k_EAccountTypeContentServer = 6, k_EAccountTypeClan = 7, k_EAccountTypeChat = 8, k_EAccountTypeConsoleUser = 9, k_EAccountTypeAnonUser = 10, k_EAccountTypeMax


type
  EAppReleaseState* {.size: sizeof(cint).} = enum
    k_EAppReleaseState_Unknown = 0, k_EAppReleaseState_Unavailable = 1, k_EAppReleaseState_Prerelease = 2, k_EAppReleaseState_PreloadOnly = 3, k_EAppReleaseState_Released = 4


type
  EAppOwnershipFlags* {.size: sizeof(cint).} = enum
    k_EAppOwnershipFlags_None = 0x00000000, k_EAppOwnershipFlags_OwnsLicense = 0x00000001, k_EAppOwnershipFlags_FreeLicense = 0x00000002, k_EAppOwnershipFlags_RegionRestricted = 0x00000004, k_EAppOwnershipFlags_LowViolence = 0x00000008, k_EAppOwnershipFlags_InvalidPlatform = 0x00000010, k_EAppOwnershipFlags_SharedLicense = 0x00000020, k_EAppOwnershipFlags_FreeWeekend = 0x00000040, k_EAppOwnershipFlags_RetailLicense = 0x00000080, k_EAppOwnershipFlags_LicenseLocked = 0x00000100, k_EAppOwnershipFlags_LicensePending = 0x00000200, k_EAppOwnershipFlags_LicenseExpired = 0x00000400, k_EAppOwnershipFlags_LicensePermanent = 0x00000800, k_EAppOwnershipFlags_LicenseRecurring = 0x00001000, k_EAppOwnershipFlags_LicenseCanceled = 0x00002000, k_EAppOwnershipFlags_AutoGrant = 0x00004000, k_EAppOwnershipFlags_PendingGift = 0x00008000, k_EAppOwnershipFlags_RentalNotActivated = 0x00010000, k_EAppOwnershipFlags_Rental = 0x00020000, k_EAppOwnershipFlags_SiteLicense = 0x00040000


type
  EAppType* {.size: sizeof(cint).} = enum
    k_EAppType_Invalid = 0x00000000, k_EAppType_Game = 0x00000001, k_EAppType_Application = 0x00000002, k_EAppType_Tool = 0x00000004, k_EAppType_Demo = 0x00000008, k_EAppType_Media_DEPRECATED = 0x00000010, k_EAppType_DLC = 0x00000020, k_EAppType_Guide = 0x00000040, k_EAppType_Driver = 0x00000080, k_EAppType_Config = 0x00000100, k_EAppType_Hardware = 0x00000200, k_EAppType_Franchise = 0x00000400, k_EAppType_Video = 0x00000800, k_EAppType_Plugin = 0x00001000, k_EAppType_Music = 0x00002000, k_EAppType_Series = 0x00004000, k_EAppType_Comic = 0x00008000, k_EAppType_Shortcut = 0x40000000, k_EAppType_DepotOnly = 0x80000000


type
  ESteamUserStatType* {.size: sizeof(cint).} = enum
    k_ESteamUserStatTypeINVALID = 0, k_ESteamUserStatTypeINT = 1, k_ESteamUserStatTypeFLOAT = 2, k_ESteamUserStatTypeAVGRATE = 3, k_ESteamUserStatTypeACHIEVEMENTS = 4, k_ESteamUserStatTypeGROUPACHIEVEMENTS = 5, k_ESteamUserStatTypeMAX


type
  EChatEntryType* {.size: sizeof(cint).} = enum
    k_EChatEntryTypeInvalid = 0, k_EChatEntryTypeChatMsg = 1, k_EChatEntryTypeTyping = 2, k_EChatEntryTypeInviteGame = 3, k_EChatEntryTypeEmote = 4, k_EChatEntryTypeLeftConversation = 6, k_EChatEntryTypeEntered = 7, k_EChatEntryTypeWasKicked = 8, k_EChatEntryTypeWasBanned = 9, k_EChatEntryTypeDisconnected = 10, k_EChatEntryTypeHistoricalChat = 11, k_EChatEntryTypeLinkBlocked = 14


type
  EChatRoomEnterResponse* {.size: sizeof(cint).} = enum
    k_EChatRoomEnterResponseSuccess = 1, k_EChatRoomEnterResponseDoesntExist = 2, k_EChatRoomEnterResponseNotAllowed = 3, k_EChatRoomEnterResponseFull = 4, k_EChatRoomEnterResponseError = 5, k_EChatRoomEnterResponseBanned = 6, k_EChatRoomEnterResponseLimited = 7, k_EChatRoomEnterResponseClanDisabled = 8, k_EChatRoomEnterResponseCommunityBan = 9, k_EChatRoomEnterResponseMemberBlockedYou = 10, k_EChatRoomEnterResponseYouBlockedMember = 11, k_EChatRoomEnterResponseRatelimitExceeded = 15


type
  PFNLegacyKeyRegistration* = proc (pchCDKey: cstring; pchInstallPath: cstring) {. stdcall.}
  PFNLegacyKeyInstalled* = proc (): bool {.stdcall.}

var k_unSteamAccountIDMask* {.importcpp: "k_unSteamAccountIDMask", dynlib: dynlibsteam_api.}: cuint

var k_unSteamAccountInstanceMask* {.importcpp: "k_unSteamAccountInstanceMask", dynlib: dynlibsteam_api.}: cuint

var k_unSteamUserDesktopInstance* {.importcpp: "k_unSteamUserDesktopInstance", dynlib: dynlibsteam_api.}: cuint

var k_unSteamUserConsoleInstance* {.importcpp: "k_unSteamUserConsoleInstance", dynlib: dynlibsteam_api.}: cuint

var k_unSteamUserWebInstance* {.importcpp: "k_unSteamUserWebInstance", dynlib: dynlibsteam_api.}: cuint

type
  EChatSteamIDInstanceFlags* {.size: sizeof(cint).} = enum
    k_EChatAccountInstanceMask = 0x00000FFF, k_EChatInstanceFlagClan = (k_unSteamAccountInstanceMask + 1) shr 1, k_EChatInstanceFlagLobby = (k_unSteamAccountInstanceMask + 1) shr 2, k_EChatInstanceFlagMMSLobby = (k_unSteamAccountInstanceMask + 1) shr 3


type
  EMarketingMessageFlags* {.size: sizeof(cint).} = enum
    k_EMarketingMessageFlagsNone = 0, k_EMarketingMessageFlagsHighPriority = 1 shl 0, k_EMarketingMessageFlagsPlatformWindows = 1 shl 1, k_EMarketingMessageFlagsPlatformMac = 1 shl 2, k_EMarketingMessageFlagsPlatformLinux = 1 shl 3, k_EMarketingMessageFlagsPlatformRestrictions = k_EMarketingMessageFlagsPlatformWindows or
        k_EMarketingMessageFlagsPlatformMac or
        k_EMarketingMessageFlagsPlatformLinux


type
  ENotificationPosition* {.size: sizeof(cint).} = enum
    k_EPositionTopLeft = 0, k_EPositionTopRight = 1, k_EPositionBottomLeft = 2, k_EPositionBottomRight = 3


type
  EBroadcastUploadResult* {.size: sizeof(cint).} = enum
    k_EBroadcastUploadResultNone = 0, k_EBroadcastUploadResultOK = 1, k_EBroadcastUploadResultInitFailed = 2, k_EBroadcastUploadResultFrameFailed = 3, k_EBroadcastUploadResultTimeout = 4, k_EBroadcastUploadResultBandwidthExceeded = 5, k_EBroadcastUploadResultLowFPS = 6, k_EBroadcastUploadResultMissingKeyFrames = 7, k_EBroadcastUploadResultNoConnection = 8, k_EBroadcastUploadResultRelayFailed = 9, k_EBroadcastUploadResultSettingsChanged = 10, k_EBroadcastUploadResultMissingAudio = 11, k_EBroadcastUploadResultTooFarBehind = 12, k_EBroadcastUploadResultTranscodeBehind = 13


type
  ELaunchOptionType* {.size: sizeof(cint).} = enum
    k_ELaunchOptionType_None = 0, k_ELaunchOptionType_Default = 1, k_ELaunchOptionType_SafeMode = 2, k_ELaunchOptionType_Multiplayer = 3, k_ELaunchOptionType_Config = 4, k_ELaunchOptionType_OpenVR = 5, k_ELaunchOptionType_Server = 6, k_ELaunchOptionType_Editor = 7, k_ELaunchOptionType_Manual = 8, k_ELaunchOptionType_Benchmark = 9, k_ELaunchOptionType_Option1 = 10, k_ELaunchOptionType_Option2 = 11, k_ELaunchOptionType_Option3 = 12, k_ELaunchOptionType_OculusVR = 13, k_ELaunchOptionType_OpenVROverlay = 14, k_ELaunchOptionType_OSVR = 15, k_ELaunchOptionType_Dialog = 1000


proc BIsVRLaunchOptionType*(eType: ELaunchOptionType): bool {.stdcall.}
type
  EVRHMDType* {.size: sizeof(cint).} = enum
    k_eEVRHMDType_None = -1, k_eEVRHMDType_Unknown = 0, k_eEVRHMDType_HTC_Dev = 1, k_eEVRHMDType_HTC_VivePre = 2, k_eEVRHMDType_HTC_Vive = 3, k_eEVRHMDType_HTC_Unknown = 20, k_eEVRHMDType_Oculus_DK1 = 21, k_eEVRHMDType_Oculus_DK2 = 22, k_eEVRHMDType_Oculus_Rift = 23, k_eEVRHMDType_Oculus_Unknown = 40, k_eEVRHMDType_Acer_Unknown = 50, k_eEVRHMDType_Acer_WindowsMR = 51, k_eEVRHMDType_Dell_Unknown = 60, k_eEVRHMDType_Dell_Visor = 61, k_eEVRHMDType_Lenovo_Unknown = 70, k_eEVRHMDType_Lenovo_Explorer = 71, k_eEVRHMDType_HP_Unknown = 80, k_eEVRHMDType_HP_WindowsMR = 81, k_eEVRHMDType_Samsung_Unknown = 90, k_eEVRHMDType_Samsung_Odyssey = 91, k_eEVRHMDType_Unannounced_Unknown = 100, k_eEVRHMDType_Unannounced_WindowsMR = 101


proc BIsOculusHMD*(eType: EVRHMDType): bool {.stdcall.}
proc BIsWindowsMRHeadset*(eType: EVRHMDType): bool {.stdcall.}
proc BIsViveHMD*(eType: EVRHMDType): bool {.stdcall.}
type
  CSteamID* {.bycopy.} = object


proc constructCSteamID*(): CSteamID {.stdcall, constructor, importcpp: "CSteamID(@)", dynlib: dynlibsteam_api.}
proc constructCSteamID*(unAccountID: uint32; eUniverse: EUniverse; eAccountType: EAccountType): CSteamID {.stdcall, constructor, importcpp: "CSteamID(@)", dynlib: dynlibsteam_api.}
proc constructCSteamID*(unAccountID: uint32; unAccountInstance: cuint; eUniverse: EUniverse; eAccountType: EAccountType): CSteamID {. stdcall, constructor, importcpp: "CSteamID(@)", dynlib: dynlibsteam_api.}
proc constructCSteamID*(ulSteamID: uint64): CSteamID {.stdcall, constructor, importcpp: "CSteamID(@)", dynlib: dynlibsteam_api.}
proc Set*(this: var CSteamID; unAccountID: uint32; eUniverse: EUniverse; eAccountType: EAccountType) {.stdcall, importcpp: "Set", dynlib: dynlibsteam_api.}
proc InstancedSet*(this: var CSteamID; unAccountID: uint32; unInstance: uint32; eUniverse: EUniverse; eAccountType: EAccountType) {.stdcall, importcpp: "InstancedSet", dynlib: dynlibsteam_api.}
proc FullSet*(this: var CSteamID; ulIdentifier: uint64; eUniverse: EUniverse; eAccountType: EAccountType) {.stdcall, importcpp: "FullSet", dynlib: dynlibsteam_api.}
proc SetFromUint64*(this: var CSteamID; ulSteamID: uint64) {.stdcall, importcpp: "SetFromUint64", dynlib: dynlibsteam_api.}
proc Clear*(this: var CSteamID) {.stdcall, importcpp: "Clear", dynlib: dynlibsteam_api.}
proc ConvertToUint64*(this: CSteamID): uint64 {.noSideEffect, stdcall, importcpp: "ConvertToUint64", dynlib: dynlibsteam_api.}
proc GetStaticAccountKey*(this: CSteamID): uint64 {.noSideEffect, stdcall, importcpp: "GetStaticAccountKey", dynlib: dynlibsteam_api.}
proc CreateBlankAnonLogon*(this: var CSteamID; eUniverse: EUniverse) {.stdcall, importcpp: "CreateBlankAnonLogon", dynlib: dynlibsteam_api.}
proc CreateBlankAnonUserLogon*(this: var CSteamID; eUniverse: EUniverse) {.stdcall, importcpp: "CreateBlankAnonUserLogon", dynlib: dynlibsteam_api.}
proc BBlankAnonAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BBlankAnonAccount", dynlib: dynlibsteam_api.}
proc BGameServerAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BGameServerAccount", dynlib: dynlibsteam_api.}
proc BPersistentGameServerAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BPersistentGameServerAccount", dynlib: dynlibsteam_api.}
proc BAnonGameServerAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BAnonGameServerAccount", dynlib: dynlibsteam_api.}
proc BContentServerAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BContentServerAccount", dynlib: dynlibsteam_api.}
proc BClanAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BClanAccount", dynlib: dynlibsteam_api.}
proc BChatAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BChatAccount", dynlib: dynlibsteam_api.}
proc IsLobby*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "IsLobby", dynlib: dynlibsteam_api.}
proc BIndividualAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BIndividualAccount", dynlib: dynlibsteam_api.}
proc BAnonAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BAnonAccount", dynlib: dynlibsteam_api.}
proc BAnonUserAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BAnonUserAccount", dynlib: dynlibsteam_api.}
proc BConsoleUserAccount*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BConsoleUserAccount", dynlib: dynlibsteam_api.}
proc SetAccountID*(this: var CSteamID; unAccountID: uint32) {.stdcall, importcpp: "SetAccountID", dynlib: dynlibsteam_api.}
proc SetAccountInstance*(this: var CSteamID; unInstance: uint32) {.stdcall, importcpp: "SetAccountInstance", dynlib: dynlibsteam_api.}
proc ClearIndividualInstance*(this: var CSteamID) {.stdcall, importcpp: "ClearIndividualInstance", dynlib: dynlibsteam_api.}
proc HasNoIndividualInstance*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "HasNoIndividualInstance", dynlib: dynlibsteam_api.}
proc GetAccountID*(this: CSteamID): AccountID_t {.noSideEffect, stdcall, importcpp: "GetAccountID", dynlib: dynlibsteam_api.}
proc GetUnAccountInstance*(this: CSteamID): uint32 {.noSideEffect, stdcall, importcpp: "GetUnAccountInstance", dynlib: dynlibsteam_api.}
proc GetEAccountType*(this: CSteamID): EAccountType {.noSideEffect, stdcall, importcpp: "GetEAccountType", dynlib: dynlibsteam_api.}
proc GetEUniverse*(this: CSteamID): EUniverse {.noSideEffect, stdcall, importcpp: "GetEUniverse", dynlib: dynlibsteam_api.}
proc SetEUniverse*(this: var CSteamID; eUniverse: EUniverse) {.stdcall, importcpp: "SetEUniverse", dynlib: dynlibsteam_api.}
proc IsValid*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "IsValid", dynlib: dynlibsteam_api.}
proc constructCSteamID*(pchSteamID: cstring; eDefaultUniverse: EUniverse = k_EUniverseInvalid): CSteamID {. stdcall, constructor, importcpp: "CSteamID(@)", dynlib: dynlibsteam_api.}
proc Render*(this: CSteamID): cstring {.noSideEffect, stdcall, importcpp: "Render", dynlib: dynlibsteam_api.}
proc Render*(ulSteamID: uint64): cstring {.stdcall, importcpp: "CSteamID::Render(@)", dynlib: dynlibsteam_api.}
proc SetFromString*(this: var CSteamID; pchSteamID: cstring; eDefaultUniverse: EUniverse) {.stdcall, importcpp: "SetFromString", dynlib: dynlibsteam_api.}
proc SetFromStringStrict*(this: var CSteamID; pchSteamID: cstring; eDefaultUniverse: EUniverse): bool {.stdcall, importcpp: "SetFromStringStrict", dynlib: dynlibsteam_api.}
proc SetFromSteam2String*(this: var CSteamID; pchSteam2ID: cstring; eUniverse: EUniverse): bool {.stdcall, importcpp: "SetFromSteam2String", dynlib: dynlibsteam_api.}
proc `==`*(this: CSteamID; val: CSteamID): bool {.noSideEffect, stdcall, importcpp: "(# == #)", dynlib: dynlibsteam_api.}
proc `<`*(this: CSteamID; val: CSteamID): bool {.noSideEffect, stdcall, importcpp: "(# < #)", dynlib: dynlibsteam_api.}
proc BValidExternalSteamID*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "BValidExternalSteamID", dynlib: dynlibsteam_api.}
proc IsValid*(this: CSteamID): bool {.noSideEffect, stdcall, importcpp: "IsValid", dynlib: dynlibsteam_api.}
type
  CGameID* {.bycopy.} = object


proc constructCGameID*(): CGameID {.stdcall, constructor, importcpp: "CGameID(@)", dynlib: dynlibsteam_api.}
proc constructCGameID*(ulGameID: uint64): CGameID {.stdcall, constructor, importcpp: "CGameID(@)", dynlib: dynlibsteam_api.}
proc constructCGameID*(nAppID: int32): CGameID {.stdcall, constructor, importcpp: "CGameID(@)", dynlib: dynlibsteam_api.}
proc constructCGameID*(nAppID: uint32): CGameID {.stdcall, constructor, importcpp: "CGameID(@)", dynlib: dynlibsteam_api.}
proc constructCGameID*(nAppID: uint32; nModID: uint32): CGameID {.stdcall, constructor, importcpp: "CGameID(@)", dynlib: dynlibsteam_api.}
proc constructCGameID*(pchGameID: cstring): CGameID {.stdcall, constructor, importcpp: "CGameID(@)", dynlib: dynlibsteam_api.}
proc Render*(this: CGameID): cstring {.noSideEffect, stdcall, importcpp: "Render", dynlib: dynlibsteam_api.}
proc Render*(ulGameID: uint64): cstring {.stdcall, importcpp: "CGameID::Render(@)", dynlib: dynlibsteam_api.}
proc ToUint64*(this: CGameID): uint64 {.noSideEffect, stdcall, importcpp: "ToUint64", dynlib: dynlibsteam_api.}
proc GetUint64Ptr*(this: var CGameID): ptr uint64 {.stdcall, importcpp: "GetUint64Ptr", dynlib: dynlibsteam_api.}
proc Set*(this: var CGameID; ulGameID: uint64) {.stdcall, importcpp: "Set", dynlib: dynlibsteam_api.}
proc IsMod*(this: CGameID): bool {.noSideEffect, stdcall, importcpp: "IsMod", dynlib: dynlibsteam_api.}
proc IsShortcut*(this: CGameID): bool {.noSideEffect, stdcall, importcpp: "IsShortcut", dynlib: dynlibsteam_api.}
proc IsP2PFile*(this: CGameID): bool {.noSideEffect, stdcall, importcpp: "IsP2PFile", dynlib: dynlibsteam_api.}
proc IsSteamApp*(this: CGameID): bool {.noSideEffect, stdcall, importcpp: "IsSteamApp", dynlib: dynlibsteam_api.}
proc ModID*(this: CGameID): uint32 {.noSideEffect, stdcall, importcpp: "ModID", dynlib: dynlibsteam_api.}
proc AppID*(this: CGameID): uint32 {.noSideEffect, stdcall, importcpp: "AppID", dynlib: dynlibsteam_api.}
proc `==`*(this: CGameID; rhs: CGameID): bool {.noSideEffect, stdcall, importcpp: "(# == #)", dynlib: dynlibsteam_api.}
proc `<`*(this: CGameID; rhs: CGameID): bool {.noSideEffect, stdcall, importcpp: "(# < #)", dynlib: dynlibsteam_api.}
proc IsValid*(this: CGameID): bool {.noSideEffect, stdcall, importcpp: "IsValid", dynlib: dynlibsteam_api.}
proc Reset*(this: var CGameID) {.stdcall, importcpp: "Reset", dynlib: dynlibsteam_api.}
var k_cchGameExtraInfoMax* {.importcpp: "k_cchGameExtraInfoMax", dynlib: dynlibsteam_api.}: cint

type
  PFNPreMinidumpCallback* = proc (context: pointer) {.stdcall.}
  BREAKPAD_HANDLE* = pointer
  ValvePackingSentinel_t* {.bycopy.} = object
    m_u32*: uint32
    m_u64*: uint64
    m_u16*: uint16
    m_d*: cdouble

  compile_time_assert_type* = array[if (sizeof((ValvePackingSentinel_t)) == 24): 1 else: -1, char]
  HSteamPipe* = int32
  HSteamUser* = int32
  SteamAPIWarningMessageHook_t* = proc (a2: cint; a3: cstring) {.stdcall.}
  SteamAPI_CheckCallbackRegistered_t* = proc (iCallbackNum: cint): uint32 {.stdcall.}

discard "forward decl of ISteamUser"
discard "forward decl of ISteamGameServer"
discard "forward decl of ISteamFriends"
discard "forward decl of ISteamUtils"
discard "forward decl of ISteamMatchmaking"
discard "forward decl of ISteamContentServer"
discard "forward decl of ISteamMatchmakingServers"
discard "forward decl of ISteamUserStats"
discard "forward decl of ISteamApps"
discard "forward decl of ISteamNetworking"
discard "forward decl of ISteamRemoteStorage"
discard "forward decl of ISteamScreenshots"
discard "forward decl of ISteamMusic"
discard "forward decl of ISteamMusicRemote"
discard "forward decl of ISteamGameServerStats"
discard "forward decl of ISteamPS3OverlayRender"
discard "forward decl of ISteamHTTP"
discard "forward decl of ISteamController"
discard "forward decl of ISteamUGC"
discard "forward decl of ISteamAppList"
discard "forward decl of ISteamHTMLSurface"
discard "forward decl of ISteamInventory"
discard "forward decl of ISteamVideo"
discard "forward decl of ISteamParentalSettings"
type
  ISteamClient* {.bycopy.} = object


proc CreateSteamPipe*(this: var ISteamClient): HSteamPipe {.stdcall, importcpp: "CreateSteamPipe", dynlib: dynlibsteam_api.}
proc BReleaseSteamPipe*(this: var ISteamClient; hSteamPipe: HSteamPipe): bool {. stdcall, importcpp: "BReleaseSteamPipe", dynlib: dynlibsteam_api.}
proc ConnectToGlobalUser*(this: var ISteamClient; hSteamPipe: HSteamPipe): HSteamUser {. stdcall, importcpp: "ConnectToGlobalUser", dynlib: dynlibsteam_api.}
proc CreateLocalUser*(this: var ISteamClient; phSteamPipe: ptr HSteamPipe; eAccountType: EAccountType): HSteamUser {.stdcall, importcpp: "CreateLocalUser", dynlib: dynlibsteam_api.}
proc ReleaseUser*(this: var ISteamClient; hSteamPipe: HSteamPipe; hUser: HSteamUser) {. stdcall, importcpp: "ReleaseUser", dynlib: dynlibsteam_api.}
proc GetISteamUser*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamUser {. stdcall, importcpp: "GetISteamUser", dynlib: dynlibsteam_api.}
proc GetISteamGameServer*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamGameServer {. stdcall, importcpp: "GetISteamGameServer", dynlib: dynlibsteam_api.}
proc SetLocalIPBinding*(this: var ISteamClient; unIP: uint32; usPort: uint16) {.stdcall, importcpp: "SetLocalIPBinding", dynlib: dynlibsteam_api.}
proc GetISteamFriends*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamFriends {. stdcall, importcpp: "GetISteamFriends", dynlib: dynlibsteam_api.}
proc GetISteamUtils*(this: var ISteamClient; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamUtils {.stdcall, importcpp: "GetISteamUtils", dynlib: dynlibsteam_api.}
proc GetISteamMatchmaking*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamMatchmaking {. stdcall, importcpp: "GetISteamMatchmaking", dynlib: dynlibsteam_api.}
proc GetISteamMatchmakingServers*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamMatchmakingServers {. stdcall, importcpp: "GetISteamMatchmakingServers", dynlib: dynlibsteam_api.}
proc GetISteamGenericInterface*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): pointer {. stdcall, importcpp: "GetISteamGenericInterface", dynlib: dynlibsteam_api.}
proc GetISteamUserStats*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamUserStats {. stdcall, importcpp: "GetISteamUserStats", dynlib: dynlibsteam_api.}
proc GetISteamGameServerStats*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamGameServerStats {. stdcall, importcpp: "GetISteamGameServerStats", dynlib: dynlibsteam_api.}
proc GetISteamApps*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamApps {. stdcall, importcpp: "GetISteamApps", dynlib: dynlibsteam_api.}
proc GetISteamNetworking*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamNetworking {. stdcall, importcpp: "GetISteamNetworking", dynlib: dynlibsteam_api.}
proc GetISteamRemoteStorage*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamRemoteStorage {. stdcall, importcpp: "GetISteamRemoteStorage", dynlib: dynlibsteam_api.}
proc GetISteamScreenshots*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamScreenshots {. stdcall, importcpp: "GetISteamScreenshots", dynlib: dynlibsteam_api.}
proc GetIPCCallCount*(this: var ISteamClient): uint32 {.stdcall, importcpp: "GetIPCCallCount", dynlib: dynlibsteam_api.}
proc SetWarningMessageHook*(this: var ISteamClient; pFunction: SteamAPIWarningMessageHook_t) {.stdcall, importcpp: "SetWarningMessageHook", dynlib: dynlibsteam_api.}
proc BShutdownIfAllPipesClosed*(this: var ISteamClient): bool {.stdcall, importcpp: "BShutdownIfAllPipesClosed", dynlib: dynlibsteam_api.}
proc GetISteamHTTP*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamHTTP {. stdcall, importcpp: "GetISteamHTTP", dynlib: dynlibsteam_api.}
proc GetISteamController*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamController {. stdcall, importcpp: "GetISteamController", dynlib: dynlibsteam_api.}
proc GetISteamUGC*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamUGC {. stdcall, importcpp: "GetISteamUGC", dynlib: dynlibsteam_api.}
proc GetISteamAppList*(this: var ISteamClient; hSteamUser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamAppList {. stdcall, importcpp: "GetISteamAppList", dynlib: dynlibsteam_api.}
proc GetISteamMusic*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamMusic {. stdcall, importcpp: "GetISteamMusic", dynlib: dynlibsteam_api.}
proc GetISteamMusicRemote*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamMusicRemote {. stdcall, importcpp: "GetISteamMusicRemote", dynlib: dynlibsteam_api.}
proc GetISteamHTMLSurface*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamHTMLSurface {. stdcall, importcpp: "GetISteamHTMLSurface", dynlib: dynlibsteam_api.}
proc GetISteamInventory*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamInventory {. stdcall, importcpp: "GetISteamInventory", dynlib: dynlibsteam_api.}
proc GetISteamVideo*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamVideo {. stdcall, importcpp: "GetISteamVideo", dynlib: dynlibsteam_api.}
proc GetISteamParentalSettings*(this: var ISteamClient; hSteamuser: HSteamUser; hSteamPipe: HSteamPipe; pchVersion: cstring): ptr ISteamParentalSettings {. stdcall, importcpp: "GetISteamParentalSettings", dynlib: dynlibsteam_api.}
const
  k_iSteamUserCallbacks* = 100

const
  k_iSteamGameServerCallbacks* = 200

const
  k_iSteamFriendsCallbacks* = 300

const
  k_iSteamBillingCallbacks* = 400

const
  k_iSteamMatchmakingCallbacks* = 500

const
  k_iSteamContentServerCallbacks* = 600

const
  k_iSteamUtilsCallbacks* = 700

const
  k_iClientFriendsCallbacks* = 800

const
  k_iClientUserCallbacks* = 900

const
  k_iSteamAppsCallbacks* = 1000

const
  k_iSteamUserStatsCallbacks* = 1100

const
  k_iSteamNetworkingCallbacks* = 1200

const
  k_iClientRemoteStorageCallbacks* = 1300

const
  k_iClientDepotBuilderCallbacks* = 1400

const
  k_iSteamGameServerItemsCallbacks* = 1500

const
  k_iClientUtilsCallbacks* = 1600

const
  k_iSteamGameCoordinatorCallbacks* = 1700

const
  k_iSteamGameServerStatsCallbacks* = 1800

const
  k_iSteam2AsyncCallbacks* = 1900

const
  k_iSteamGameStatsCallbacks* = 2000

const
  k_iClientHTTPCallbacks* = 2100

const
  k_iClientScreenshotsCallbacks* = 2200

const
  k_iSteamScreenshotsCallbacks* = 2300

const
  k_iClientAudioCallbacks* = 2400

const
  k_iClientUnifiedMessagesCallbacks* = 2500

const
  k_iSteamStreamLauncherCallbacks* = 2600

const
  k_iClientControllerCallbacks* = 2700

const
  k_iSteamControllerCallbacks* = 2800

const
  k_iClientParentalSettingsCallbacks* = 2900

const
  k_iClientDeviceAuthCallbacks* = 3000

const
  k_iClientNetworkDeviceManagerCallbacks* = 3100

const
  k_iClientMusicCallbacks* = 3200

const
  k_iClientRemoteClientManagerCallbacks* = 3300

const
  k_iClientUGCCallbacks* = 3400

const
  k_iSteamStreamClientCallbacks* = 3500

const
  k_IClientProductBuilderCallbacks* = 3600

const
  k_iClientShortcutsCallbacks* = 3700

const
  k_iClientRemoteControlManagerCallbacks* = 3800

const
  k_iSteamAppListCallbacks* = 3900

const
  k_iSteamMusicCallbacks* = 4000

const
  k_iSteamMusicRemoteCallbacks* = 4100

const
  k_iClientVRCallbacks* = 4200

const
  k_iClientGameNotificationCallbacks* = 4300

const
  k_iSteamGameNotificationCallbacks* = 4400

const
  k_iSteamHTMLSurfaceCallbacks* = 4500

const
  k_iClientVideoCallbacks* = 4600

const
  k_iClientInventoryCallbacks* = 4700

const
  k_iClientBluetoothManagerCallbacks* = 4800

const
  k_iClientSharedConnectionCallbacks* = 4900

const
  k_ISteamParentalSettingsCallbacks* = 5000

const
  k_iClientShaderCallbacks* = 5100

type
  CallbackMsg_t* {.bycopy.} = object
    m_hSteamUser*: HSteamUser
    m_iCallback*: cint
    m_pubParam*: ptr uint8
    m_cubParam*: cint

  ISteamUser* {.bycopy.} = object


proc GetHSteamUser*(this: var ISteamUser): HSteamUser {.stdcall, importcpp: "GetHSteamUser", dynlib: dynlibsteam_api.}
proc BLoggedOn*(this: var ISteamUser): bool {.stdcall, importcpp: "BLoggedOn", dynlib: dynlibsteam_api.}
proc GetSteamID*(this: var ISteamUser): CSteamID {.stdcall, importcpp: "GetSteamID", dynlib: dynlibsteam_api.}
proc InitiateGameConnection*(this: var ISteamUser; pAuthBlob: pointer; cbMaxAuthBlob: cint; steamIDGameServer: CSteamID; unIPServer: uint32; usPortServer: uint16; bSecure: bool): cint {. stdcall, importcpp: "InitiateGameConnection", dynlib: dynlibsteam_api.}
proc TerminateGameConnection*(this: var ISteamUser; unIPServer: uint32; usPortServer: uint16) {.stdcall, importcpp: "TerminateGameConnection", dynlib: dynlibsteam_api.}
proc TrackAppUsageEvent*(this: var ISteamUser; gameID: CGameID; eAppUsageEvent: cint; pchExtraInfo: cstring = "") {.stdcall, importcpp: "TrackAppUsageEvent", dynlib: dynlibsteam_api.}
proc GetUserDataFolder*(this: var ISteamUser; pchBuffer: cstring; cubBuffer: cint): bool {. stdcall, importcpp: "GetUserDataFolder", dynlib: dynlibsteam_api.}
proc StartVoiceRecording*(this: var ISteamUser) {.stdcall, importcpp: "StartVoiceRecording", dynlib: dynlibsteam_api.}
proc StopVoiceRecording*(this: var ISteamUser) {.stdcall, importcpp: "StopVoiceRecording", dynlib: dynlibsteam_api.}
proc GetAvailableVoice*(this: var ISteamUser; pcbCompressed: ptr uint32; pcbUncompressed_Deprecated: ptr uint32 = 0; nUncompressedVoiceDesiredSampleRate_Deprecated: uint32 = 0): EVoiceResult {. stdcall, importcpp: "GetAvailableVoice", dynlib: dynlibsteam_api.}
proc GetVoice*(this: var ISteamUser; bWantCompressed: bool; pDestBuffer: pointer; cbDestBufferSize: uint32; nBytesWritten: ptr uint32; bWantUncompressed_Deprecated: bool = false; pUncompressedDestBuffer_Deprecated: pointer = 0; cbUncompressedDestBufferSize_Deprecated: uint32 = 0; nUncompressBytesWritten_Deprecated: ptr uint32 = 0; nUncompressedVoiceDesiredSampleRate_Deprecated: uint32 = 0): EVoiceResult {. stdcall, importcpp: "GetVoice", dynlib: dynlibsteam_api.}
proc DecompressVoice*(this: var ISteamUser; pCompressed: pointer; cbCompressed: uint32; pDestBuffer: pointer; cbDestBufferSize: uint32; nBytesWritten: ptr uint32; nDesiredSampleRate: uint32): EVoiceResult {.stdcall, importcpp: "DecompressVoice", dynlib: dynlibsteam_api.}
proc GetVoiceOptimalSampleRate*(this: var ISteamUser): uint32 {.stdcall, importcpp: "GetVoiceOptimalSampleRate", dynlib: dynlibsteam_api.}
proc GetAuthSessionTicket*(this: var ISteamUser; pTicket: pointer; cbMaxTicket: cint; pcbTicket: ptr uint32): HAuthTicket {.stdcall, importcpp: "GetAuthSessionTicket", dynlib: dynlibsteam_api.}
proc BeginAuthSession*(this: var ISteamUser; pAuthTicket: pointer; cbAuthTicket: cint; steamID: CSteamID): EBeginAuthSessionResult {.stdcall, importcpp: "BeginAuthSession", dynlib: dynlibsteam_api.}
proc EndAuthSession*(this: var ISteamUser; steamID: CSteamID) {.stdcall, importcpp: "EndAuthSession", dynlib: dynlibsteam_api.}
proc CancelAuthTicket*(this: var ISteamUser; hAuthTicket: HAuthTicket) {.stdcall, importcpp: "CancelAuthTicket", dynlib: dynlibsteam_api.}
proc UserHasLicenseForApp*(this: var ISteamUser; steamID: CSteamID; appID: AppId_t): EUserHasLicenseForAppResult {. stdcall, importcpp: "UserHasLicenseForApp", dynlib: dynlibsteam_api.}
proc BIsBehindNAT*(this: var ISteamUser): bool {.stdcall, importcpp: "BIsBehindNAT", dynlib: dynlibsteam_api.}
proc AdvertiseGame*(this: var ISteamUser; steamIDGameServer: CSteamID; unIPServer: uint32; usPortServer: uint16) {.stdcall, importcpp: "AdvertiseGame", dynlib: dynlibsteam_api.}
proc RequestEncryptedAppTicket*(this: var ISteamUser; pDataToInclude: pointer; cbDataToInclude: cint): SteamAPICall_t {.stdcall, importcpp: "RequestEncryptedAppTicket", dynlib: dynlibsteam_api.}
proc GetEncryptedAppTicket*(this: var ISteamUser; pTicket: pointer; cbMaxTicket: cint; pcbTicket: ptr uint32): bool {.stdcall, importcpp: "GetEncryptedAppTicket", dynlib: dynlibsteam_api.}
proc GetGameBadgeLevel*(this: var ISteamUser; nSeries: cint; bFoil: bool): cint {. stdcall, importcpp: "GetGameBadgeLevel", dynlib: dynlibsteam_api.}
proc GetPlayerSteamLevel*(this: var ISteamUser): cint {.stdcall, importcpp: "GetPlayerSteamLevel", dynlib: dynlibsteam_api.}
proc RequestStoreAuthURL*(this: var ISteamUser; pchRedirectURL: cstring): SteamAPICall_t {. stdcall, importcpp: "RequestStoreAuthURL", dynlib: dynlibsteam_api.}
proc BIsPhoneVerified*(this: var ISteamUser): bool {.stdcall, importcpp: "BIsPhoneVerified", dynlib: dynlibsteam_api.}
proc BIsTwoFactorEnabled*(this: var ISteamUser): bool {.stdcall, importcpp: "BIsTwoFactorEnabled", dynlib: dynlibsteam_api.}
proc BIsPhoneIdentifying*(this: var ISteamUser): bool {.stdcall, importcpp: "BIsPhoneIdentifying", dynlib: dynlibsteam_api.}
proc BIsPhoneRequiringVerification*(this: var ISteamUser): bool {.stdcall, importcpp: "BIsPhoneRequiringVerification", dynlib: dynlibsteam_api.}
type
  SteamServersConnected_t* {.bycopy.} = object


const
  k_iCallback* = k_iSteamUserCallbacks + 1

type
  SteamServerConnectFailure_t* {.bycopy.} = object
    m_eResult*: EResult
    m_bStillRetrying*: bool


const
  k_iCallback* = k_iSteamUserCallbacks + 2

type
  SteamServersDisconnected_t* {.bycopy.} = object
    m_eResult*: EResult


const
  k_iCallback* = k_iSteamUserCallbacks + 3

type
  ClientGameServerDeny_t* {.bycopy.} = object
    m_uAppID*: uint32
    m_unGameServerIP*: uint32
    m_usGameServerPort*: uint16
    m_bSecure*: uint16
    m_uReason*: uint32


const
  k_iCallback* = k_iSteamUserCallbacks + 13

type
  IPCFailure_t* {.bycopy.} = object
    m_eFailureType*: uint8


const
  k_iCallback* = k_iSteamUserCallbacks + 17

type
  EFailureType* {.size: sizeof(cint).} = enum
    k_EFailureFlushedCallbackQueue, k_EFailurePipeFail


type
  LicensesUpdated_t* {.bycopy.} = object


const
  k_iCallback* = k_iSteamUserCallbacks + 25

type
  ValidateAuthTicketResponse_t* {.bycopy.} = object
    m_SteamID*: CSteamID
    m_eAuthSessionResponse*: EAuthSessionResponse
    m_OwnerSteamID*: CSteamID


const
  k_iCallback* = k_iSteamUserCallbacks + 43

type
  MicroTxnAuthorizationResponse_t* {.bycopy.} = object
    m_unAppID*: uint32
    m_ulOrderID*: uint64
    m_bAuthorized*: uint8


const
  k_iCallback* = k_iSteamUserCallbacks + 52

type
  EncryptedAppTicketResponse_t* {.bycopy.} = object
    m_eResult*: EResult


const
  k_iCallback* = k_iSteamUserCallbacks + 54

type
  GetAuthSessionTicketResponse_t* {.bycopy.} = object
    m_hAuthTicket*: HAuthTicket
    m_eResult*: EResult


const
  k_iCallback* = k_iSteamUserCallbacks + 63

type
  GameWebCallback_t* {.bycopy.} = object
    m_szURL*: array[256, char]


const
  k_iCallback* = k_iSteamUserCallbacks + 64

type
  StoreAuthURLResponse_t* {.bycopy.} = object
    m_szURL*: array[512, char]


const
  k_iCallback* = k_iSteamUserCallbacks + 65

type
  EFriendRelationship* {.size: sizeof(cint).} = enum
    k_EFriendRelationshipNone = 0, k_EFriendRelationshipBlocked = 1, k_EFriendRelationshipRequestRecipient = 2, k_EFriendRelationshipFriend = 3, k_EFriendRelationshipRequestInitiator = 4, k_EFriendRelationshipIgnored = 5, k_EFriendRelationshipIgnoredFriend = 6, k_EFriendRelationshipSuggested_DEPRECATED = 7, k_EFriendRelationshipMax = 8


var k_cchMaxFriendsGroupName* {.importcpp: "k_cchMaxFriendsGroupName", dynlib: dynlibsteam_api.}: cint

var k_cFriendsGroupLimit* {.importcpp: "k_cFriendsGroupLimit", dynlib: dynlibsteam_api.}: cint

type
  FriendsGroupID_t* = int16

var k_FriendsGroupID_Invalid* {.importcpp: "k_FriendsGroupID_Invalid", dynlib: dynlibsteam_api.}: FriendsGroupID_t

var k_cEnumerateFollowersMax* {.importcpp: "k_cEnumerateFollowersMax", dynlib: dynlibsteam_api.}: cint

type
  EPersonaState* {.size: sizeof(cint).} = enum
    k_EPersonaStateOffline = 0, k_EPersonaStateOnline = 1, k_EPersonaStateBusy = 2, k_EPersonaStateAway = 3, k_EPersonaStateSnooze = 4, k_EPersonaStateLookingToTrade = 5, k_EPersonaStateLookingToPlay = 6, k_EPersonaStateMax


type
  EFriendFlags* {.size: sizeof(cint).} = enum
    k_EFriendFlagNone = 0x00000000, k_EFriendFlagBlocked = 0x00000001, k_EFriendFlagFriendshipRequested = 0x00000002, k_EFriendFlagImmediate = 0x00000004, k_EFriendFlagClanMember = 0x00000008, k_EFriendFlagOnGameServer = 0x00000010, k_EFriendFlagRequestingFriendship = 0x00000080, k_EFriendFlagRequestingInfo = 0x00000100, k_EFriendFlagIgnored = 0x00000200, k_EFriendFlagIgnoredFriend = 0x00000400, k_EFriendFlagChatMember = 0x00001000, k_EFriendFlagAll = 0x0000FFFF


type
  FriendGameInfo_t* {.bycopy.} = object
    m_gameID*: CGameID
    m_unGameIP*: uint32
    m_usGamePort*: uint16
    m_usQueryPort*: uint16
    m_steamIDLobby*: CSteamID


const
  k_cchPersonaNameMax* = 128
  k_cwchPersonaNameMax* = 32

type
  EUserRestriction* {.size: sizeof(cint).} = enum
    k_nUserRestrictionNone = 0, k_nUserRestrictionUnknown = 1, k_nUserRestrictionAnyChat = 2, k_nUserRestrictionVoiceChat = 4, k_nUserRestrictionGroupChat = 8, k_nUserRestrictionRating = 16, k_nUserRestrictionGameInvites = 32, k_nUserRestrictionTrading = 64


type
  FriendSessionStateInfo_t* {.bycopy.} = object
    m_uiOnlineSessionInstances*: uint32
    m_uiPublishedToFriendsSessionInstance*: uint8


var k_cubChatMetadataMax* {.importcpp: "k_cubChatMetadataMax", dynlib: dynlibsteam_api.}: uint32

const
  k_cchMaxRichPresenceKeys* = 20

const
  k_cchMaxRichPresenceKeyLength* = 64

const
  k_cchMaxRichPresenceValueLength* = 256

type
  EOverlayToStoreFlag* {.size: sizeof(cint).} = enum
    k_EOverlayToStoreFlag_None = 0, k_EOverlayToStoreFlag_AddToCart = 1, k_EOverlayToStoreFlag_AddToCartAndShow = 2


type
  ISteamFriends* {.bycopy.} = object


proc GetPersonaName*(this: var ISteamFriends): cstring {.stdcall, importcpp: "GetPersonaName", dynlib: dynlibsteam_api.}
proc SetPersonaName*(this: var ISteamFriends; pchPersonaName: cstring): SteamAPICall_t {. stdcall, importcpp: "SetPersonaName", dynlib: dynlibsteam_api.}
proc GetPersonaState*(this: var ISteamFriends): EPersonaState {.stdcall, importcpp: "GetPersonaState", dynlib: dynlibsteam_api.}
proc GetFriendCount*(this: var ISteamFriends; iFriendFlags: cint): cint {.stdcall, importcpp: "GetFriendCount", dynlib: dynlibsteam_api.}
proc GetFriendByIndex*(this: var ISteamFriends; iFriend: cint; iFriendFlags: cint): CSteamID {. stdcall, importcpp: "GetFriendByIndex", dynlib: dynlibsteam_api.}
proc GetFriendRelationship*(this: var ISteamFriends; steamIDFriend: CSteamID): EFriendRelationship {. stdcall, importcpp: "GetFriendRelationship", dynlib: dynlibsteam_api.}
proc GetFriendPersonaState*(this: var ISteamFriends; steamIDFriend: CSteamID): EPersonaState {. stdcall, importcpp: "GetFriendPersonaState", dynlib: dynlibsteam_api.}
proc GetFriendPersonaName*(this: var ISteamFriends; steamIDFriend: CSteamID): cstring {. stdcall, importcpp: "GetFriendPersonaName", dynlib: dynlibsteam_api.}
proc GetFriendGamePlayed*(this: var ISteamFriends; steamIDFriend: CSteamID; pFriendGameInfo: ptr FriendGameInfo_t): bool {.stdcall, importcpp: "GetFriendGamePlayed", dynlib: dynlibsteam_api.}
proc GetFriendPersonaNameHistory*(this: var ISteamFriends; steamIDFriend: CSteamID; iPersonaName: cint): cstring {.stdcall, importcpp: "GetFriendPersonaNameHistory", dynlib: dynlibsteam_api.}
proc GetFriendSteamLevel*(this: var ISteamFriends; steamIDFriend: CSteamID): cint {. stdcall, importcpp: "GetFriendSteamLevel", dynlib: dynlibsteam_api.}
proc GetPlayerNickname*(this: var ISteamFriends; steamIDPlayer: CSteamID): cstring {. stdcall, importcpp: "GetPlayerNickname", dynlib: dynlibsteam_api.}
proc GetFriendsGroupCount*(this: var ISteamFriends): cint {.stdcall, importcpp: "GetFriendsGroupCount", dynlib: dynlibsteam_api.}
proc GetFriendsGroupIDByIndex*(this: var ISteamFriends; iFG: cint): FriendsGroupID_t {. stdcall, importcpp: "GetFriendsGroupIDByIndex", dynlib: dynlibsteam_api.}
proc GetFriendsGroupName*(this: var ISteamFriends; friendsGroupID: FriendsGroupID_t): cstring {. stdcall, importcpp: "GetFriendsGroupName", dynlib: dynlibsteam_api.}
proc GetFriendsGroupMembersCount*(this: var ISteamFriends; friendsGroupID: FriendsGroupID_t): cint {.stdcall, importcpp: "GetFriendsGroupMembersCount", dynlib: dynlibsteam_api.}
proc GetFriendsGroupMembersList*(this: var ISteamFriends; friendsGroupID: FriendsGroupID_t; pOutSteamIDMembers: ptr CSteamID; nMembersCount: cint) {.stdcall, importcpp: "GetFriendsGroupMembersList", dynlib: dynlibsteam_api.}
proc HasFriend*(this: var ISteamFriends; steamIDFriend: CSteamID; iFriendFlags: cint): bool {. stdcall, importcpp: "HasFriend", dynlib: dynlibsteam_api.}
proc GetClanCount*(this: var ISteamFriends): cint {.stdcall, importcpp: "GetClanCount", dynlib: dynlibsteam_api.}
proc GetClanByIndex*(this: var ISteamFriends; iClan: cint): CSteamID {.stdcall, importcpp: "GetClanByIndex", dynlib: dynlibsteam_api.}
proc GetClanName*(this: var ISteamFriends; steamIDClan: CSteamID): cstring {.stdcall, importcpp: "GetClanName", dynlib: dynlibsteam_api.}
proc GetClanTag*(this: var ISteamFriends; steamIDClan: CSteamID): cstring {.stdcall, importcpp: "GetClanTag", dynlib: dynlibsteam_api.}
proc GetClanActivityCounts*(this: var ISteamFriends; steamIDClan: CSteamID; pnOnline: ptr cint; pnInGame: ptr cint; pnChatting: ptr cint): bool {.stdcall, importcpp: "GetClanActivityCounts", dynlib: dynlibsteam_api.}
proc DownloadClanActivityCounts*(this: var ISteamFriends; psteamIDClans: ptr CSteamID; cClansToRequest: cint): SteamAPICall_t {. stdcall, importcpp: "DownloadClanActivityCounts", dynlib: dynlibsteam_api.}
proc GetFriendCountFromSource*(this: var ISteamFriends; steamIDSource: CSteamID): cint {. stdcall, importcpp: "GetFriendCountFromSource", dynlib: dynlibsteam_api.}
proc GetFriendFromSourceByIndex*(this: var ISteamFriends; steamIDSource: CSteamID; iFriend: cint): CSteamID {.stdcall, importcpp: "GetFriendFromSourceByIndex", dynlib: dynlibsteam_api.}
proc IsUserInSource*(this: var ISteamFriends; steamIDUser: CSteamID; steamIDSource: CSteamID): bool {.stdcall, importcpp: "IsUserInSource", dynlib: dynlibsteam_api.}
proc SetInGameVoiceSpeaking*(this: var ISteamFriends; steamIDUser: CSteamID; bSpeaking: bool) {.stdcall, importcpp: "SetInGameVoiceSpeaking", dynlib: dynlibsteam_api.}
proc ActivateGameOverlay*(this: var ISteamFriends; pchDialog: cstring) {.stdcall, importcpp: "ActivateGameOverlay", dynlib: dynlibsteam_api.}
proc ActivateGameOverlayToUser*(this: var ISteamFriends; pchDialog: cstring; steamID: CSteamID) {.stdcall, importcpp: "ActivateGameOverlayToUser", dynlib: dynlibsteam_api.}
proc ActivateGameOverlayToWebPage*(this: var ISteamFriends; pchURL: cstring) {. stdcall, importcpp: "ActivateGameOverlayToWebPage", dynlib: dynlibsteam_api.}
proc ActivateGameOverlayToStore*(this: var ISteamFriends; nAppID: AppId_t; eFlag: EOverlayToStoreFlag) {.stdcall, importcpp: "ActivateGameOverlayToStore", dynlib: dynlibsteam_api.}
proc SetPlayedWith*(this: var ISteamFriends; steamIDUserPlayedWith: CSteamID) {. stdcall, importcpp: "SetPlayedWith", dynlib: dynlibsteam_api.}
proc ActivateGameOverlayInviteDialog*(this: var ISteamFriends; steamIDLobby: CSteamID) {.stdcall, importcpp: "ActivateGameOverlayInviteDialog", dynlib: dynlibsteam_api.}
proc GetSmallFriendAvatar*(this: var ISteamFriends; steamIDFriend: CSteamID): cint {. stdcall, importcpp: "GetSmallFriendAvatar", dynlib: dynlibsteam_api.}
proc GetMediumFriendAvatar*(this: var ISteamFriends; steamIDFriend: CSteamID): cint {. stdcall, importcpp: "GetMediumFriendAvatar", dynlib: dynlibsteam_api.}
proc GetLargeFriendAvatar*(this: var ISteamFriends; steamIDFriend: CSteamID): cint {. stdcall, importcpp: "GetLargeFriendAvatar", dynlib: dynlibsteam_api.}
proc RequestUserInformation*(this: var ISteamFriends; steamIDUser: CSteamID; bRequireNameOnly: bool): bool {.stdcall, importcpp: "RequestUserInformation", dynlib: dynlibsteam_api.}
proc RequestClanOfficerList*(this: var ISteamFriends; steamIDClan: CSteamID): SteamAPICall_t {. stdcall, importcpp: "RequestClanOfficerList", dynlib: dynlibsteam_api.}
proc GetClanOwner*(this: var ISteamFriends; steamIDClan: CSteamID): CSteamID {.stdcall, importcpp: "GetClanOwner", dynlib: dynlibsteam_api.}
proc GetClanOfficerCount*(this: var ISteamFriends; steamIDClan: CSteamID): cint {. stdcall, importcpp: "GetClanOfficerCount", dynlib: dynlibsteam_api.}
proc GetClanOfficerByIndex*(this: var ISteamFriends; steamIDClan: CSteamID; iOfficer: cint): CSteamID {.stdcall, importcpp: "GetClanOfficerByIndex", dynlib: dynlibsteam_api.}
proc GetUserRestrictions*(this: var ISteamFriends): uint32 {.stdcall, importcpp: "GetUserRestrictions", dynlib: dynlibsteam_api.}
proc SetRichPresence*(this: var ISteamFriends; pchKey: cstring; pchValue: cstring): bool {. stdcall, importcpp: "SetRichPresence", dynlib: dynlibsteam_api.}
proc ClearRichPresence*(this: var ISteamFriends) {.stdcall, importcpp: "ClearRichPresence", dynlib: dynlibsteam_api.}
proc GetFriendRichPresence*(this: var ISteamFriends; steamIDFriend: CSteamID; pchKey: cstring): cstring {.stdcall, importcpp: "GetFriendRichPresence", dynlib: dynlibsteam_api.}
proc GetFriendRichPresenceKeyCount*(this: var ISteamFriends; steamIDFriend: CSteamID): cint {. stdcall, importcpp: "GetFriendRichPresenceKeyCount", dynlib: dynlibsteam_api.}
proc GetFriendRichPresenceKeyByIndex*(this: var ISteamFriends; steamIDFriend: CSteamID; iKey: cint): cstring {. stdcall, importcpp: "GetFriendRichPresenceKeyByIndex", dynlib: dynlibsteam_api.}
proc RequestFriendRichPresence*(this: var ISteamFriends; steamIDFriend: CSteamID) {. stdcall, importcpp: "RequestFriendRichPresence", dynlib: dynlibsteam_api.}
proc InviteUserToGame*(this: var ISteamFriends; steamIDFriend: CSteamID; pchConnectString: cstring): bool {.stdcall, importcpp: "InviteUserToGame", dynlib: dynlibsteam_api.}
proc GetCoplayFriendCount*(this: var ISteamFriends): cint {.stdcall, importcpp: "GetCoplayFriendCount", dynlib: dynlibsteam_api.}
proc GetCoplayFriend*(this: var ISteamFriends; iCoplayFriend: cint): CSteamID {. stdcall, importcpp: "GetCoplayFriend", dynlib: dynlibsteam_api.}
proc GetFriendCoplayTime*(this: var ISteamFriends; steamIDFriend: CSteamID): cint {. stdcall, importcpp: "GetFriendCoplayTime", dynlib: dynlibsteam_api.}
proc GetFriendCoplayGame*(this: var ISteamFriends; steamIDFriend: CSteamID): AppId_t {. stdcall, importcpp: "GetFriendCoplayGame", dynlib: dynlibsteam_api.}
proc JoinClanChatRoom*(this: var ISteamFriends; steamIDClan: CSteamID): SteamAPICall_t {. stdcall, importcpp: "JoinClanChatRoom", dynlib: dynlibsteam_api.}
proc LeaveClanChatRoom*(this: var ISteamFriends; steamIDClan: CSteamID): bool {. stdcall, importcpp: "LeaveClanChatRoom", dynlib: dynlibsteam_api.}
proc GetClanChatMemberCount*(this: var ISteamFriends; steamIDClan: CSteamID): cint {. stdcall, importcpp: "GetClanChatMemberCount", dynlib: dynlibsteam_api.}
proc GetChatMemberByIndex*(this: var ISteamFriends; steamIDClan: CSteamID; iUser: cint): CSteamID {. stdcall, importcpp: "GetChatMemberByIndex", dynlib: dynlibsteam_api.}
proc SendClanChatMessage*(this: var ISteamFriends; steamIDClanChat: CSteamID; pchText: cstring): bool {.stdcall, importcpp: "SendClanChatMessage", dynlib: dynlibsteam_api.}
proc GetClanChatMessage*(this: var ISteamFriends; steamIDClanChat: CSteamID; iMessage: cint; prgchText: pointer; cchTextMax: cint; peChatEntryType: ptr EChatEntryType; psteamidChatter: ptr CSteamID): cint {.stdcall, importcpp: "GetClanChatMessage", dynlib: dynlibsteam_api.}
proc IsClanChatAdmin*(this: var ISteamFriends; steamIDClanChat: CSteamID; steamIDUser: CSteamID): bool {.stdcall, importcpp: "IsClanChatAdmin", dynlib: dynlibsteam_api.}
proc IsClanChatWindowOpenInSteam*(this: var ISteamFriends; steamIDClanChat: CSteamID): bool {. stdcall, importcpp: "IsClanChatWindowOpenInSteam", dynlib: dynlibsteam_api.}
proc OpenClanChatWindowInSteam*(this: var ISteamFriends; steamIDClanChat: CSteamID): bool {. stdcall, importcpp: "OpenClanChatWindowInSteam", dynlib: dynlibsteam_api.}
proc CloseClanChatWindowInSteam*(this: var ISteamFriends; steamIDClanChat: CSteamID): bool {. stdcall, importcpp: "CloseClanChatWindowInSteam", dynlib: dynlibsteam_api.}
proc SetListenForFriendsMessages*(this: var ISteamFriends; bInterceptEnabled: bool): bool {. stdcall, importcpp: "SetListenForFriendsMessages", dynlib: dynlibsteam_api.}
proc ReplyToFriendMessage*(this: var ISteamFriends; steamIDFriend: CSteamID; pchMsgToSend: cstring): bool {.stdcall, importcpp: "ReplyToFriendMessage", dynlib: dynlibsteam_api.}
proc GetFriendMessage*(this: var ISteamFriends; steamIDFriend: CSteamID; iMessageID: cint; pvData: pointer; cubData: cint; peChatEntryType: ptr EChatEntryType): cint {.stdcall, importcpp: "GetFriendMessage", dynlib: dynlibsteam_api.}
proc GetFollowerCount*(this: var ISteamFriends; steamID: CSteamID): SteamAPICall_t {. stdcall, importcpp: "GetFollowerCount", dynlib: dynlibsteam_api.}
proc IsFollowing*(this: var ISteamFriends; steamID: CSteamID): SteamAPICall_t {. stdcall, importcpp: "IsFollowing", dynlib: dynlibsteam_api.}
proc EnumerateFollowingList*(this: var ISteamFriends; unStartIndex: uint32): SteamAPICall_t {. stdcall, importcpp: "EnumerateFollowingList", dynlib: dynlibsteam_api.}
proc IsClanPublic*(this: var ISteamFriends; steamIDClan: CSteamID): bool {.stdcall, importcpp: "IsClanPublic", dynlib: dynlibsteam_api.}
proc IsClanOfficialGameGroup*(this: var ISteamFriends; steamIDClan: CSteamID): bool {. stdcall, importcpp: "IsClanOfficialGameGroup", dynlib: dynlibsteam_api.}
type
  PersonaStateChange_t* {.bycopy.} = object
    m_ulSteamID*: uint64
    m_nChangeFlags*: cint


const
  k_iCallback* = k_iSteamFriendsCallbacks + 4

type
  EPersonaChange* {.size: sizeof(cint).} = enum
    k_EPersonaChangeName = 0x00000001, k_EPersonaChangeStatus = 0x00000002, k_EPersonaChangeComeOnline = 0x00000004, k_EPersonaChangeGoneOffline = 0x00000008, k_EPersonaChangeGamePlayed = 0x00000010, k_EPersonaChangeGameServer = 0x00000020, k_EPersonaChangeAvatar = 0x00000040, k_EPersonaChangeJoinedSource = 0x00000080, k_EPersonaChangeLeftSource = 0x00000100, k_EPersonaChangeRelationshipChanged = 0x00000200, k_EPersonaChangeNameFirstSet = 0x00000400, k_EPersonaChangeFacebookInfo = 0x00000800, k_EPersonaChangeNickname = 0x00001000, k_EPersonaChangeSteamLevel = 0x00002000


type
  GameOverlayActivated_t* {.bycopy.} = object
    m_bActive*: uint8


const
  k_iCallback* = k_iSteamFriendsCallbacks + 31

type
  GameServerChangeRequested_t* {.bycopy.} = object
    m_rgchServer*: array[64, char]
    m_rgchPassword*: array[64, char]


const
  k_iCallback* = k_iSteamFriendsCallbacks + 32

type
  GameLobbyJoinRequested_t* {.bycopy.} = object
    m_steamIDLobby*: CSteamID
    m_steamIDFriend*: CSteamID


const
  k_iCallback* = k_iSteamFriendsCallbacks + 33

type
  AvatarImageLoaded_t* {.bycopy.} = object
    m_steamID*: CSteamID
    m_iImage*: cint
    m_iWide*: cint
    m_iTall*: cint


const
  k_iCallback* = k_iSteamFriendsCallbacks + 34

type
  ClanOfficerListResponse_t* {.bycopy.} = object
    m_steamIDClan*: CSteamID
    m_cOfficers*: cint
    m_bSuccess*: uint8


const
  k_iCallback* = k_iSteamFriendsCallbacks + 35

type
  FriendRichPresenceUpdate_t* {.bycopy.} = object
    m_steamIDFriend*: CSteamID
    m_nAppID*: AppId_t


const
  k_iCallback* = k_iSteamFriendsCallbacks + 36

type
  GameRichPresenceJoinRequested_t* {.bycopy.} = object
    m_steamIDFriend*: CSteamID
    m_rgchConnect*: array[k_cchMaxRichPresenceValueLength, char]


const
  k_iCallback* = k_iSteamFriendsCallbacks + 37

type
  GameConnectedClanChatMsg_t* {.bycopy.} = object
    m_steamIDClanChat*: CSteamID
    m_steamIDUser*: CSteamID
    m_iMessageID*: cint


const
  k_iCallback* = k_iSteamFriendsCallbacks + 38

type
  GameConnectedChatJoin_t* {.bycopy.} = object
    m_steamIDClanChat*: CSteamID
    m_steamIDUser*: CSteamID


const
  k_iCallback* = k_iSteamFriendsCallbacks + 39

type
  GameConnectedChatLeave_t* {.bycopy.} = object
    m_steamIDClanChat*: CSteamID
    m_steamIDUser*: CSteamID
    m_bKicked*: bool
    m_bDropped*: bool


const
  k_iCallback* = k_iSteamFriendsCallbacks + 40

type
  DownloadClanActivityCountsResult_t* {.bycopy.} = object
    m_bSuccess*: bool


const
  k_iCallback* = k_iSteamFriendsCallbacks + 41

type
  JoinClanChatRoomCompletionResult_t* {.bycopy.} = object
    m_steamIDClanChat*: CSteamID
    m_eChatRoomEnterResponse*: EChatRoomEnterResponse


const
  k_iCallback* = k_iSteamFriendsCallbacks + 42

type
  GameConnectedFriendChatMsg_t* {.bycopy.} = object
    m_steamIDUser*: CSteamID
    m_iMessageID*: cint


const
  k_iCallback* = k_iSteamFriendsCallbacks + 43

type
  FriendsGetFollowerCount_t* {.bycopy.} = object
    m_eResult*: EResult
    m_steamID*: CSteamID
    m_nCount*: cint


const
  k_iCallback* = k_iSteamFriendsCallbacks + 44

type
  FriendsIsFollowing_t* {.bycopy.} = object
    m_eResult*: EResult
    m_steamID*: CSteamID
    m_bIsFollowing*: bool


const
  k_iCallback* = k_iSteamFriendsCallbacks + 45

type
  FriendsEnumerateFollowingList_t* {.bycopy.} = object
    m_eResult*: EResult
    m_rgSteamID*: array[k_cEnumerateFollowersMax, CSteamID]
    m_nResultsReturned*: int32
    m_nTotalResultCount*: int32


const
  k_iCallback* = k_iSteamFriendsCallbacks + 46

type
  SetPersonaNameResponse_t* {.bycopy.} = object
    m_bSuccess*: bool
    m_bLocalSuccess*: bool
    m_result*: EResult


const
  k_iCallback* = k_iSteamFriendsCallbacks + 47

type
  ESteamAPICallFailure* {.size: sizeof(cint).} = enum
    k_ESteamAPICallFailureNone = -1, k_ESteamAPICallFailureSteamGone = 0, k_ESteamAPICallFailureNetworkFailure = 1, k_ESteamAPICallFailureInvalidHandle = 2, k_ESteamAPICallFailureMismatchedCallback = 3


type
  EGamepadTextInputMode* {.size: sizeof(cint).} = enum
    k_EGamepadTextInputModeNormal = 0, k_EGamepadTextInputModePassword = 1


type
  EGamepadTextInputLineMode* {.size: sizeof(cint).} = enum
    k_EGamepadTextInputLineModeSingleLine = 0, k_EGamepadTextInputLineModeMultipleLines = 1


type
  SteamAPIWarningMessageHook_t* = proc (a2: cint; a3: cstring) {.stdcall.}
  ISteamUtils* {.bycopy.} = object


proc GetSecondsSinceAppActive*(this: var ISteamUtils): uint32 {.stdcall, importcpp: "GetSecondsSinceAppActive", dynlib: dynlibsteam_api.}
proc GetSecondsSinceComputerActive*(this: var ISteamUtils): uint32 {.stdcall, importcpp: "GetSecondsSinceComputerActive", dynlib: dynlibsteam_api.}
proc GetConnectedUniverse*(this: var ISteamUtils): EUniverse {.stdcall, importcpp: "GetConnectedUniverse", dynlib: dynlibsteam_api.}
proc GetServerRealTime*(this: var ISteamUtils): uint32 {.stdcall, importcpp: "GetServerRealTime", dynlib: dynlibsteam_api.}
proc GetIPCountry*(this: var ISteamUtils): cstring {.stdcall, importcpp: "GetIPCountry", dynlib: dynlibsteam_api.}
proc GetImageSize*(this: var ISteamUtils; iImage: cint; pnWidth: ptr uint32; pnHeight: ptr uint32): bool {.stdcall, importcpp: "GetImageSize", dynlib: dynlibsteam_api.}
proc GetImageRGBA*(this: var ISteamUtils; iImage: cint; pubDest: ptr uint8; nDestBufferSize: cint): bool {.stdcall, importcpp: "GetImageRGBA", dynlib: dynlibsteam_api.}
proc GetCSERIPPort*(this: var ISteamUtils; unIP: ptr uint32; usPort: ptr uint16): bool {. stdcall, importcpp: "GetCSERIPPort", dynlib: dynlibsteam_api.}
proc GetCurrentBatteryPower*(this: var ISteamUtils): uint8 {.stdcall, importcpp: "GetCurrentBatteryPower", dynlib: dynlibsteam_api.}
proc GetAppID*(this: var ISteamUtils): uint32 {.stdcall, importcpp: "GetAppID", dynlib: dynlibsteam_api.}
proc SetOverlayNotificationPosition*(this: var ISteamUtils; eNotificationPosition: ENotificationPosition) {. stdcall, importcpp: "SetOverlayNotificationPosition", dynlib: dynlibsteam_api.}
proc IsAPICallCompleted*(this: var ISteamUtils; hSteamAPICall: SteamAPICall_t; pbFailed: ptr bool): bool {.stdcall, importcpp: "IsAPICallCompleted", dynlib: dynlibsteam_api.}
proc GetAPICallFailureReason*(this: var ISteamUtils; hSteamAPICall: SteamAPICall_t): ESteamAPICallFailure {. stdcall, importcpp: "GetAPICallFailureReason", dynlib: dynlibsteam_api.}
proc GetAPICallResult*(this: var ISteamUtils; hSteamAPICall: SteamAPICall_t; pCallback: pointer; cubCallback: cint; iCallbackExpected: cint; pbFailed: ptr bool): bool {.stdcall, importcpp: "GetAPICallResult", dynlib: dynlibsteam_api.}
proc GetIPCCallCount*(this: var ISteamUtils): uint32 {.stdcall, importcpp: "GetIPCCallCount", dynlib: dynlibsteam_api.}
proc SetWarningMessageHook*(this: var ISteamUtils; pFunction: SteamAPIWarningMessageHook_t) {.stdcall, importcpp: "SetWarningMessageHook", dynlib: dynlibsteam_api.}
proc IsOverlayEnabled*(this: var ISteamUtils): bool {.stdcall, importcpp: "IsOverlayEnabled", dynlib: dynlibsteam_api.}
proc BOverlayNeedsPresent*(this: var ISteamUtils): bool {.stdcall, importcpp: "BOverlayNeedsPresent", dynlib: dynlibsteam_api.}
proc CheckFileSignature*(this: var ISteamUtils; szFileName: cstring): SteamAPICall_t {. stdcall, importcpp: "CheckFileSignature", dynlib: dynlibsteam_api.}
proc ShowGamepadTextInput*(this: var ISteamUtils; eInputMode: EGamepadTextInputMode; eLineInputMode: EGamepadTextInputLineMode; pchDescription: cstring; unCharMax: uint32; pchExistingText: cstring): bool {.stdcall, importcpp: "ShowGamepadTextInput", dynlib: dynlibsteam_api.}
proc GetEnteredGamepadTextLength*(this: var ISteamUtils): uint32 {.stdcall, importcpp: "GetEnteredGamepadTextLength", dynlib: dynlibsteam_api.}
proc GetEnteredGamepadTextInput*(this: var ISteamUtils; pchText: cstring; cchText: uint32): bool {.stdcall, importcpp: "GetEnteredGamepadTextInput", dynlib: dynlibsteam_api.}
proc GetSteamUILanguage*(this: var ISteamUtils): cstring {.stdcall, importcpp: "GetSteamUILanguage", dynlib: dynlibsteam_api.}
proc IsSteamRunningInVR*(this: var ISteamUtils): bool {.stdcall, importcpp: "IsSteamRunningInVR", dynlib: dynlibsteam_api.}
proc SetOverlayNotificationInset*(this: var ISteamUtils; nHorizontalInset: cint; nVerticalInset: cint) {.stdcall, importcpp: "SetOverlayNotificationInset", dynlib: dynlibsteam_api.}
proc IsSteamInBigPictureMode*(this: var ISteamUtils): bool {.stdcall, importcpp: "IsSteamInBigPictureMode", dynlib: dynlibsteam_api.}
proc StartVRDashboard*(this: var ISteamUtils) {.stdcall, importcpp: "StartVRDashboard", dynlib: dynlibsteam_api.}
proc IsVRHeadsetStreamingEnabled*(this: var ISteamUtils): bool {.stdcall, importcpp: "IsVRHeadsetStreamingEnabled", dynlib: dynlibsteam_api.}
proc SetVRHeadsetStreamingEnabled*(this: var ISteamUtils; bEnabled: bool) {.stdcall, importcpp: "SetVRHeadsetStreamingEnabled", dynlib: dynlibsteam_api.}
type
  IPCountry_t* {.bycopy.} = object


const
  k_iCallback* = k_iSteamUtilsCallbacks + 1

type
  LowBatteryPower_t* {.bycopy.} = object
    m_nMinutesBatteryLeft*: uint8


const
  k_iCallback* = k_iSteamUtilsCallbacks + 2

type
  SteamAPICallCompleted_t* {.bycopy.} = object
    m_hAsyncCall*: SteamAPICall_t
    m_iCallback*: cint
    m_cubParam*: uint32


const
  k_iCallback* = k_iSteamUtilsCallbacks + 3

type
  SteamShutdown_t* {.bycopy.} = object


const
  k_iCallback* = k_iSteamUtilsCallbacks + 4

type
  ECheckFileSignature* {.size: sizeof(cint).} = enum
    k_ECheckFileSignatureInvalidSignature = 0, k_ECheckFileSignatureValidSignature = 1, k_ECheckFileSignatureFileNotFound = 2, k_ECheckFileSignatureNoSignaturesFoundForThisApp = 3, k_ECheckFileSignatureNoSignaturesFoundForThisFile = 4


type
  CheckFileSignature_t* {.bycopy.} = object
    m_eCheckFileSignature*: ECheckFileSignature


const
  k_iCallback* = k_iSteamUtilsCallbacks + 5

type
  GamepadTextInputDismissed_t* {.bycopy.} = object
    m_bSubmitted*: bool
    m_unSubmittedText*: uint32


const
  k_iCallback* = k_iSteamUtilsCallbacks + 14

var k_cbMaxGameServerGameDir* {.importcpp: "k_cbMaxGameServerGameDir", dynlib: dynlibsteam_api.}: cint

var k_cbMaxGameServerMapName* {.importcpp: "k_cbMaxGameServerMapName", dynlib: dynlibsteam_api.}: cint

var k_cbMaxGameServerGameDescription* {.importcpp: "k_cbMaxGameServerGameDescription", dynlib: dynlibsteam_api.}: cint

var k_cbMaxGameServerName* {.importcpp: "k_cbMaxGameServerName", dynlib: dynlibsteam_api.}: cint

var k_cbMaxGameServerTags* {.importcpp: "k_cbMaxGameServerTags", dynlib: dynlibsteam_api.}: cint

var k_cbMaxGameServerGameData* {.importcpp: "k_cbMaxGameServerGameData", dynlib: dynlibsteam_api.}: cint

type
  MatchMakingKeyValuePair_t* {.bycopy.} = object
    m_szKey*: array[256, char]
    m_szValue*: array[256, char]


proc constructMatchMakingKeyValuePair_t*(): MatchMakingKeyValuePair_t {.stdcall, constructor, importcpp: "MatchMakingKeyValuePair_t(@)", dynlib: dynlibsteam_api.}
proc constructMatchMakingKeyValuePair_t*(pchKey: cstring; pchValue: cstring): MatchMakingKeyValuePair_t {. stdcall, constructor, importcpp: "MatchMakingKeyValuePair_t(@)", dynlib: dynlibsteam_api.}
type
  EMatchMakingServerResponse* {.size: sizeof(cint).} = enum
    eServerResponded = 0, eServerFailedToRespond, eNoServersListedOnMasterServer


type
  servernetadr_t* {.bycopy.} = object


proc constructservernetadr_t*(): servernetadr_t {.stdcall, constructor, importcpp: "servernetadr_t(@)", dynlib: dynlibsteam_api.}
proc Init*(this: var servernetadr_t; ip: cuint; usQueryPort: uint16; usConnectionPort: uint16) {.stdcall, importcpp: "Init", dynlib: dynlibsteam_api.}
proc GetQueryPort*(this: servernetadr_t): uint16 {.noSideEffect, stdcall, importcpp: "GetQueryPort", dynlib: dynlibsteam_api.}
proc SetQueryPort*(this: var servernetadr_t; usPort: uint16) {.stdcall, importcpp: "SetQueryPort", dynlib: dynlibsteam_api.}
proc GetConnectionPort*(this: servernetadr_t): uint16 {.noSideEffect, stdcall, importcpp: "GetConnectionPort", dynlib: dynlibsteam_api.}
proc SetConnectionPort*(this: var servernetadr_t; usPort: uint16) {.stdcall, importcpp: "SetConnectionPort", dynlib: dynlibsteam_api.}
proc GetIP*(this: servernetadr_t): uint32 {.noSideEffect, stdcall, importcpp: "GetIP", dynlib: dynlibsteam_api.}
proc SetIP*(this: var servernetadr_t; a3: uint32) {.stdcall, importcpp: "SetIP", dynlib: dynlibsteam_api.}
proc GetConnectionAddressString*(this: servernetadr_t): cstring {.noSideEffect, stdcall, importcpp: "GetConnectionAddressString", dynlib: dynlibsteam_api.}
proc GetQueryAddressString*(this: servernetadr_t): cstring {.noSideEffect, stdcall, importcpp: "GetQueryAddressString", dynlib: dynlibsteam_api.}
proc lessthan*(this: servernetadr_t; netadr: servernetadr_t): bool {.noSideEffect, stdcall, importcpp: "lessthan", dynlib: dynlibsteam_api.}
proc Init*(this: var servernetadr_t; ip: cuint; usQueryPort: uint16; usConnectionPort: uint16) {.stdcall, importcpp: "Init", dynlib: dynlibsteam_api.}
proc GetQueryPort*(this: servernetadr_t): uint16 {.noSideEffect, stdcall, importcpp: "GetQueryPort", dynlib: dynlibsteam_api.}
proc SetQueryPort*(this: var servernetadr_t; usPort: uint16) {.stdcall, importcpp: "SetQueryPort", dynlib: dynlibsteam_api.}
proc GetConnectionPort*(this: servernetadr_t): uint16 {.noSideEffect, stdcall, importcpp: "GetConnectionPort", dynlib: dynlibsteam_api.}
proc SetConnectionPort*(this: var servernetadr_t; usPort: uint16) {.stdcall, importcpp: "SetConnectionPort", dynlib: dynlibsteam_api.}
proc GetIP*(this: servernetadr_t): uint32 {.noSideEffect, stdcall, importcpp: "GetIP", dynlib: dynlibsteam_api.}
proc SetIP*(this: var servernetadr_t; unIP: uint32) {.stdcall, importcpp: "SetIP", dynlib: dynlibsteam_api.}
proc ToString*(this: servernetadr_t; unIP: uint32; usPort: uint16): cstring {. noSideEffect, stdcall, importcpp: "ToString", dynlib: dynlibsteam_api.}
proc GetConnectionAddressString*(this: servernetadr_t): cstring {.noSideEffect, stdcall, importcpp: "GetConnectionAddressString", dynlib: dynlibsteam_api.}
proc GetQueryAddressString*(this: servernetadr_t): cstring {.noSideEffect, stdcall, importcpp: "GetQueryAddressString", dynlib: dynlibsteam_api.}
proc lessthan*(this: servernetadr_t; netadr: servernetadr_t): bool {.noSideEffect, stdcall, importcpp: "lessthan", dynlib: dynlibsteam_api.}
type
  gameserveritem_t* {.bycopy.} = object
    m_NetAdr*: servernetadr_t
    m_nPing*: cint
    m_bHadSuccessfulResponse*: bool
    m_bDoNotRefresh*: bool
    m_szGameDir*: array[k_cbMaxGameServerGameDir, char]
    m_szMap*: array[k_cbMaxGameServerMapName, char]
    m_szGameDescription*: array[k_cbMaxGameServerGameDescription, char]
    m_nAppID*: uint32
    m_nPlayers*: cint
    m_nMaxPlayers*: cint
    m_nBotPlayers*: cint
    m_bPassword*: bool
    m_bSecure*: bool
    m_ulTimeLastPlayed*: uint32
    m_nServerVersion*: cint
    m_szGameTags*: array[k_cbMaxGameServerTags, char]
    m_steamID*: CSteamID


proc constructgameserveritem_t*(): gameserveritem_t {.stdcall, constructor, importcpp: "gameserveritem_t(@)", dynlib: dynlibsteam_api.}
proc GetName*(this: gameserveritem_t): cstring {.noSideEffect, stdcall, importcpp: "GetName", dynlib: dynlibsteam_api.}
proc SetName*(this: var gameserveritem_t; pName: cstring) {.stdcall, importcpp: "SetName", dynlib: dynlibsteam_api.}
proc dummy*() {.stdcall.}
proc GetName*(this: gameserveritem_t): cstring {.noSideEffect, stdcall, importcpp: "GetName", dynlib: dynlibsteam_api.}
proc SetName*(this: var gameserveritem_t; pName: cstring) {.stdcall, importcpp: "SetName", dynlib: dynlibsteam_api.}
type
  ELobbyType* {.size: sizeof(cint).} = enum
    k_ELobbyTypePrivate = 0, k_ELobbyTypeFriendsOnly = 1, k_ELobbyTypePublic = 2, k_ELobbyTypeInvisible = 3


type
  ELobbyComparison* {.size: sizeof(cint).} = enum
    k_ELobbyComparisonEqualToOrLessThan = -2, k_ELobbyComparisonLessThan = -1, k_ELobbyComparisonEqual = 0, k_ELobbyComparisonGreaterThan = 1, k_ELobbyComparisonEqualToOrGreaterThan = 2, k_ELobbyComparisonNotEqual = 3


type
  ELobbyDistanceFilter* {.size: sizeof(cint).} = enum
    k_ELobbyDistanceFilterClose, k_ELobbyDistanceFilterDefault, k_ELobbyDistanceFilterFar, k_ELobbyDistanceFilterWorldwide


type
  ISteamMatchmaking* {.bycopy.} = object


proc GetFavoriteGameCount*(this: var ISteamMatchmaking): cint {.stdcall, importcpp: "GetFavoriteGameCount", dynlib: dynlibsteam_api.}
proc GetFavoriteGame*(this: var ISteamMatchmaking; iGame: cint; pnAppID: ptr AppId_t; pnIP: ptr uint32; pnConnPort: ptr uint16; pnQueryPort: ptr uint16; punFlags: ptr uint32; pRTime32LastPlayedOnServer: ptr uint32): bool {.stdcall, importcpp: "GetFavoriteGame", dynlib: dynlibsteam_api.}
proc AddFavoriteGame*(this: var ISteamMatchmaking; nAppID: AppId_t; nIP: uint32; nConnPort: uint16; nQueryPort: uint16; unFlags: uint32; rTime32LastPlayedOnServer: uint32): cint {.stdcall, importcpp: "AddFavoriteGame", dynlib: dynlibsteam_api.}
proc RemoveFavoriteGame*(this: var ISteamMatchmaking; nAppID: AppId_t; nIP: uint32; nConnPort: uint16; nQueryPort: uint16; unFlags: uint32): bool {. stdcall, importcpp: "RemoveFavoriteGame", dynlib: dynlibsteam_api.}
proc RequestLobbyList*(this: var ISteamMatchmaking): SteamAPICall_t {.stdcall, importcpp: "RequestLobbyList", dynlib: dynlibsteam_api.}
proc AddRequestLobbyListStringFilter*(this: var ISteamMatchmaking; pchKeyToMatch: cstring; pchValueToMatch: cstring; eComparisonType: ELobbyComparison) {.stdcall, importcpp: "AddRequestLobbyListStringFilter", dynlib: dynlibsteam_api.}
proc AddRequestLobbyListNumericalFilter*(this: var ISteamMatchmaking; pchKeyToMatch: cstring; nValueToMatch: cint; eComparisonType: ELobbyComparison) {. stdcall, importcpp: "AddRequestLobbyListNumericalFilter", dynlib: dynlibsteam_api.}
proc AddRequestLobbyListNearValueFilter*(this: var ISteamMatchmaking; pchKeyToMatch: cstring; nValueToBeCloseTo: cint) {.stdcall, importcpp: "AddRequestLobbyListNearValueFilter", dynlib: dynlibsteam_api.}
proc AddRequestLobbyListFilterSlotsAvailable*(this: var ISteamMatchmaking; nSlotsAvailable: cint) {.stdcall, importcpp: "AddRequestLobbyListFilterSlotsAvailable", dynlib: dynlibsteam_api.}
proc AddRequestLobbyListDistanceFilter*(this: var ISteamMatchmaking; eLobbyDistanceFilter: ELobbyDistanceFilter) {.stdcall, importcpp: "AddRequestLobbyListDistanceFilter", dynlib: dynlibsteam_api.}
proc AddRequestLobbyListResultCountFilter*(this: var ISteamMatchmaking; cMaxResults: cint) {.stdcall, importcpp: "AddRequestLobbyListResultCountFilter", dynlib: dynlibsteam_api.}
proc AddRequestLobbyListCompatibleMembersFilter*(this: var ISteamMatchmaking; steamIDLobby: CSteamID) {.stdcall, importcpp: "AddRequestLobbyListCompatibleMembersFilter", dynlib: dynlibsteam_api.}
proc GetLobbyByIndex*(this: var ISteamMatchmaking; iLobby: cint): CSteamID {.stdcall, importcpp: "GetLobbyByIndex", dynlib: dynlibsteam_api.}
proc CreateLobby*(this: var ISteamMatchmaking; eLobbyType: ELobbyType; cMaxMembers: cint): SteamAPICall_t {.stdcall, importcpp: "CreateLobby", dynlib: dynlibsteam_api.}
proc JoinLobby*(this: var ISteamMatchmaking; steamIDLobby: CSteamID): SteamAPICall_t {. stdcall, importcpp: "JoinLobby", dynlib: dynlibsteam_api.}
proc LeaveLobby*(this: var ISteamMatchmaking; steamIDLobby: CSteamID) {.stdcall, importcpp: "LeaveLobby", dynlib: dynlibsteam_api.}
proc InviteUserToLobby*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; steamIDInvitee: CSteamID): bool {.stdcall, importcpp: "InviteUserToLobby", dynlib: dynlibsteam_api.}
proc GetNumLobbyMembers*(this: var ISteamMatchmaking; steamIDLobby: CSteamID): cint {. stdcall, importcpp: "GetNumLobbyMembers", dynlib: dynlibsteam_api.}
proc GetLobbyMemberByIndex*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; iMember: cint): CSteamID {.stdcall, importcpp: "GetLobbyMemberByIndex", dynlib: dynlibsteam_api.}
proc GetLobbyData*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; pchKey: cstring): cstring {.stdcall, importcpp: "GetLobbyData", dynlib: dynlibsteam_api.}
proc SetLobbyData*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; pchKey: cstring; pchValue: cstring): bool {.stdcall, importcpp: "SetLobbyData", dynlib: dynlibsteam_api.}
proc GetLobbyDataCount*(this: var ISteamMatchmaking; steamIDLobby: CSteamID): cint {. stdcall, importcpp: "GetLobbyDataCount", dynlib: dynlibsteam_api.}
proc GetLobbyDataByIndex*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; iLobbyData: cint; pchKey: cstring; cchKeyBufferSize: cint; pchValue: cstring; cchValueBufferSize: cint): bool {. stdcall, importcpp: "GetLobbyDataByIndex", dynlib: dynlibsteam_api.}
proc DeleteLobbyData*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; pchKey: cstring): bool {.stdcall, importcpp: "DeleteLobbyData", dynlib: dynlibsteam_api.}
proc GetLobbyMemberData*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; steamIDUser: CSteamID; pchKey: cstring): cstring {.stdcall, importcpp: "GetLobbyMemberData", dynlib: dynlibsteam_api.}
proc SetLobbyMemberData*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; pchKey: cstring; pchValue: cstring) {.stdcall, importcpp: "SetLobbyMemberData", dynlib: dynlibsteam_api.}
proc SendLobbyChatMsg*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; pvMsgBody: pointer; cubMsgBody: cint): bool {.stdcall, importcpp: "SendLobbyChatMsg", dynlib: dynlibsteam_api.}
proc GetLobbyChatEntry*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; iChatID: cint; pSteamIDUser: ptr CSteamID; pvData: pointer; cubData: cint; peChatEntryType: ptr EChatEntryType): cint {. stdcall, importcpp: "GetLobbyChatEntry", dynlib: dynlibsteam_api.}
proc RequestLobbyData*(this: var ISteamMatchmaking; steamIDLobby: CSteamID): bool {. stdcall, importcpp: "RequestLobbyData", dynlib: dynlibsteam_api.}
proc SetLobbyGameServer*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; unGameServerIP: uint32; unGameServerPort: uint16; steamIDGameServer: CSteamID) {.stdcall, importcpp: "SetLobbyGameServer", dynlib: dynlibsteam_api.}
proc GetLobbyGameServer*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; punGameServerIP: ptr uint32; punGameServerPort: ptr uint16; psteamIDGameServer: ptr CSteamID): bool {.stdcall, importcpp: "GetLobbyGameServer", dynlib: dynlibsteam_api.}
proc SetLobbyMemberLimit*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; cMaxMembers: cint): bool {.stdcall, importcpp: "SetLobbyMemberLimit", dynlib: dynlibsteam_api.}
proc GetLobbyMemberLimit*(this: var ISteamMatchmaking; steamIDLobby: CSteamID): cint {. stdcall, importcpp: "GetLobbyMemberLimit", dynlib: dynlibsteam_api.}
proc SetLobbyType*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; eLobbyType: ELobbyType): bool {.stdcall, importcpp: "SetLobbyType", dynlib: dynlibsteam_api.}
proc SetLobbyJoinable*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; bLobbyJoinable: bool): bool {.stdcall, importcpp: "SetLobbyJoinable", dynlib: dynlibsteam_api.}
proc GetLobbyOwner*(this: var ISteamMatchmaking; steamIDLobby: CSteamID): CSteamID {. stdcall, importcpp: "GetLobbyOwner", dynlib: dynlibsteam_api.}
proc SetLobbyOwner*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; steamIDNewOwner: CSteamID): bool {.stdcall, importcpp: "SetLobbyOwner", dynlib: dynlibsteam_api.}
proc SetLinkedLobby*(this: var ISteamMatchmaking; steamIDLobby: CSteamID; steamIDLobbyDependent: CSteamID): bool {.stdcall, importcpp: "SetLinkedLobby", dynlib: dynlibsteam_api.}
type
  HServerListRequest* = pointer
  ISteamMatchmakingServerListResponse* {.bycopy.} = object


proc ServerResponded*(this: var ISteamMatchmakingServerListResponse; hRequest: HServerListRequest; iServer: cint) {.stdcall, importcpp: "ServerResponded", dynlib: dynlibsteam_api.}
proc ServerFailedToRespond*(this: var ISteamMatchmakingServerListResponse; hRequest: HServerListRequest; iServer: cint) {.stdcall, importcpp: "ServerFailedToRespond", dynlib: dynlibsteam_api.}
proc RefreshComplete*(this: var ISteamMatchmakingServerListResponse; hRequest: HServerListRequest; response: EMatchMakingServerResponse) {.stdcall, importcpp: "RefreshComplete", dynlib: dynlibsteam_api.}
type
  ISteamMatchmakingPingResponse* {.bycopy.} = object


proc ServerResponded*(this: var ISteamMatchmakingPingResponse; server: var gameserveritem_t) {.stdcall, importcpp: "ServerResponded", dynlib: dynlibsteam_api.}
proc ServerFailedToRespond*(this: var ISteamMatchmakingPingResponse) {.stdcall, importcpp: "ServerFailedToRespond", dynlib: dynlibsteam_api.}
type
  ISteamMatchmakingPlayersResponse* {.bycopy.} = object


proc AddPlayerToList*(this: var ISteamMatchmakingPlayersResponse; pchName: cstring; nScore: cint; flTimePlayed: cfloat) {.stdcall, importcpp: "AddPlayerToList", dynlib: dynlibsteam_api.}
proc PlayersFailedToRespond*(this: var ISteamMatchmakingPlayersResponse) {.stdcall, importcpp: "PlayersFailedToRespond", dynlib: dynlibsteam_api.}
proc PlayersRefreshComplete*(this: var ISteamMatchmakingPlayersResponse) {.stdcall, importcpp: "PlayersRefreshComplete", dynlib: dynlibsteam_api.}
type
  ISteamMatchmakingRulesResponse* {.bycopy.} = object


proc RulesResponded*(this: var ISteamMatchmakingRulesResponse; pchRule: cstring; pchValue: cstring) {.stdcall, importcpp: "RulesResponded", dynlib: dynlibsteam_api.}
proc RulesFailedToRespond*(this: var ISteamMatchmakingRulesResponse) {.stdcall, importcpp: "RulesFailedToRespond", dynlib: dynlibsteam_api.}
proc RulesRefreshComplete*(this: var ISteamMatchmakingRulesResponse) {.stdcall, importcpp: "RulesRefreshComplete", dynlib: dynlibsteam_api.}
type
  HServerQuery* = cint

var HSERVERQUERY_INVALID* {.importcpp: "HSERVERQUERY_INVALID", dynlib: dynlibsteam_api.}: cint

type
  ISteamMatchmakingServers* {.bycopy.} = object


proc RequestInternetServerList*(this: var ISteamMatchmakingServers; iApp: AppId_t; ppchFilters: ptr ptr MatchMakingKeyValuePair_t; nFilters: uint32; pRequestServersResponse: ptr ISteamMatchmakingServerListResponse): HServerListRequest {. stdcall, importcpp: "RequestInternetServerList", dynlib: dynlibsteam_api.}
proc RequestLANServerList*(this: var ISteamMatchmakingServers; iApp: AppId_t; pRequestServersResponse: ptr ISteamMatchmakingServerListResponse): HServerListRequest {. stdcall, importcpp: "RequestLANServerList", dynlib: dynlibsteam_api.}
proc RequestFriendsServerList*(this: var ISteamMatchmakingServers; iApp: AppId_t; ppchFilters: ptr ptr MatchMakingKeyValuePair_t; nFilters: uint32; pRequestServersResponse: ptr ISteamMatchmakingServerListResponse): HServerListRequest {. stdcall, importcpp: "RequestFriendsServerList", dynlib: dynlibsteam_api.}
proc RequestFavoritesServerList*(this: var ISteamMatchmakingServers; iApp: AppId_t; ppchFilters: ptr ptr MatchMakingKeyValuePair_t; nFilters: uint32; pRequestServersResponse: ptr ISteamMatchmakingServerListResponse): HServerListRequest {. stdcall, importcpp: "RequestFavoritesServerList", dynlib: dynlibsteam_api.}
proc RequestHistoryServerList*(this: var ISteamMatchmakingServers; iApp: AppId_t; ppchFilters: ptr ptr MatchMakingKeyValuePair_t; nFilters: uint32; pRequestServersResponse: ptr ISteamMatchmakingServerListResponse): HServerListRequest {. stdcall, importcpp: "RequestHistoryServerList", dynlib: dynlibsteam_api.}
proc RequestSpectatorServerList*(this: var ISteamMatchmakingServers; iApp: AppId_t; ppchFilters: ptr ptr MatchMakingKeyValuePair_t; nFilters: uint32; pRequestServersResponse: ptr ISteamMatchmakingServerListResponse): HServerListRequest {. stdcall, importcpp: "RequestSpectatorServerList", dynlib: dynlibsteam_api.}
proc ReleaseRequest*(this: var ISteamMatchmakingServers; hServerListRequest: HServerListRequest) {.stdcall, importcpp: "ReleaseRequest", dynlib: dynlibsteam_api.}
proc GetServerDetails*(this: var ISteamMatchmakingServers; hRequest: HServerListRequest; iServer: cint): ptr gameserveritem_t {. stdcall, importcpp: "GetServerDetails", dynlib: dynlibsteam_api.}
proc CancelQuery*(this: var ISteamMatchmakingServers; hRequest: HServerListRequest) {. stdcall, importcpp: "CancelQuery", dynlib: dynlibsteam_api.}
proc RefreshQuery*(this: var ISteamMatchmakingServers; hRequest: HServerListRequest) {. stdcall, importcpp: "RefreshQuery", dynlib: dynlibsteam_api.}
proc IsRefreshing*(this: var ISteamMatchmakingServers; hRequest: HServerListRequest): bool {. stdcall, importcpp: "IsRefreshing", dynlib: dynlibsteam_api.}
proc GetServerCount*(this: var ISteamMatchmakingServers; hRequest: HServerListRequest): cint {.stdcall, importcpp: "GetServerCount", dynlib: dynlibsteam_api.}
proc RefreshServer*(this: var ISteamMatchmakingServers; hRequest: HServerListRequest; iServer: cint) {.stdcall, importcpp: "RefreshServer", dynlib: dynlibsteam_api.}
proc PingServer*(this: var ISteamMatchmakingServers; unIP: uint32; usPort: uint16; pRequestServersResponse: ptr ISteamMatchmakingPingResponse): HServerQuery {. stdcall, importcpp: "PingServer", dynlib: dynlibsteam_api.}
proc PlayerDetails*(this: var ISteamMatchmakingServers; unIP: uint32; usPort: uint16; pRequestServersResponse: ptr ISteamMatchmakingPlayersResponse): HServerQuery {. stdcall, importcpp: "PlayerDetails", dynlib: dynlibsteam_api.}
proc ServerRules*(this: var ISteamMatchmakingServers; unIP: uint32; usPort: uint16; pRequestServersResponse: ptr ISteamMatchmakingRulesResponse): HServerQuery {. stdcall, importcpp: "ServerRules", dynlib: dynlibsteam_api.}
proc CancelServerQuery*(this: var ISteamMatchmakingServers; hServerQuery: HServerQuery) {.stdcall, importcpp: "CancelServerQuery", dynlib: dynlibsteam_api.}
var k_unFavoriteFlagNone* {.importcpp: "k_unFavoriteFlagNone", dynlib: dynlibsteam_api.}: uint32

var k_unFavoriteFlagFavorite* {.importcpp: "k_unFavoriteFlagFavorite", dynlib: dynlibsteam_api.}: uint32

var k_unFavoriteFlagHistory* {.importcpp: "k_unFavoriteFlagHistory", dynlib: dynlibsteam_api.}: uint32

type
  EChatMemberStateChange* {.size: sizeof(cint).} = enum
    k_EChatMemberStateChangeEntered = 0x00000001, k_EChatMemberStateChangeLeft = 0x00000002, k_EChatMemberStateChangeDisconnected = 0x00000004, k_EChatMemberStateChangeKicked = 0x00000008, k_EChatMemberStateChangeBanned = 0x00000010


type
  FavoritesListChanged_t* {.bycopy.} = object
    m_nIP*: uint32
    m_nQueryPort*: uint32
    m_nConnPort*: uint32
    m_nAppID*: uint32
    m_nFlags*: uint32
    m_bAdd*: bool
    m_unAccountId*: AccountID_t


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 2

type
  LobbyInvite_t* {.bycopy.} = object
    m_ulSteamIDUser*: uint64
    m_ulSteamIDLobby*: uint64
    m_ulGameID*: uint64


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 3

type
  LobbyEnter_t* {.bycopy.} = object
    m_ulSteamIDLobby*: uint64
    m_rgfChatPermissions*: uint32
    m_bLocked*: bool
    m_EChatRoomEnterResponse*: uint32


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 4

type
  LobbyDataUpdate_t* {.bycopy.} = object
    m_ulSteamIDLobby*: uint64
    m_ulSteamIDMember*: uint64
    m_bSuccess*: uint8


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 5

type
  LobbyChatUpdate_t* {.bycopy.} = object
    m_ulSteamIDLobby*: uint64
    m_ulSteamIDUserChanged*: uint64
    m_ulSteamIDMakingChange*: uint64
    m_rgfChatMemberStateChange*: uint32


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 6

type
  LobbyChatMsg_t* {.bycopy.} = object
    m_ulSteamIDLobby*: uint64
    m_ulSteamIDUser*: uint64
    m_eChatEntryType*: uint8
    m_iChatID*: uint32


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 7

type
  LobbyGameCreated_t* {.bycopy.} = object
    m_ulSteamIDLobby*: uint64
    m_ulSteamIDGameServer*: uint64
    m_unIP*: uint32
    m_usPort*: uint16


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 9

type
  LobbyMatchList_t* {.bycopy.} = object
    m_nLobbiesMatching*: uint32


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 10

type
  LobbyKicked_t* {.bycopy.} = object
    m_ulSteamIDLobby*: uint64
    m_ulSteamIDAdmin*: uint64
    m_bKickedDueToDisconnect*: uint8


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 12

type
  LobbyCreated_t* {.bycopy.} = object
    m_eResult*: EResult
    m_ulSteamIDLobby*: uint64


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 13

type
  PSNGameBootInviteResult_t* {.bycopy.} = object
    m_bGameBootInviteExists*: bool
    m_steamIDLobby*: CSteamID


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 15

type
  FavoritesListAccountsUpdated_t* {.bycopy.} = object
    m_eResult*: EResult


const
  k_iCallback* = k_iSteamMatchmakingCallbacks + 16

var k_unMaxCloudFileChunkSize* {.importcpp: "k_unMaxCloudFileChunkSize", dynlib: dynlibsteam_api.}: uint32

type
  SteamParamStringArray_t* {.bycopy.} = object
    m_ppStrings*: cstringArray
    m_nNumStrings*: int32

  UGCHandle_t* = uint64
  PublishedFileUpdateHandle_t* = uint64
  PublishedFileId_t* = uint64

var k_PublishedFileIdInvalid* {.importcpp: "k_PublishedFileIdInvalid", dynlib: dynlibsteam_api.}: PublishedFileId_t

var k_UGCHandleInvalid* {.importcpp: "k_UGCHandleInvalid", dynlib: dynlibsteam_api.}: UGCHandle_t

var k_PublishedFileUpdateHandleInvalid* {.importcpp: "k_PublishedFileUpdateHandleInvalid", dynlib: dynlibsteam_api.}: PublishedFileUpdateHandle_t

type
  UGCFileWriteStreamHandle_t* = uint64

var k_UGCFileStreamHandleInvalid* {.importcpp: "k_UGCFileStreamHandleInvalid", dynlib: dynlibsteam_api.}: UGCFileWriteStreamHandle_t

var k_cchPublishedDocumentTitleMax* {.importcpp: "k_cchPublishedDocumentTitleMax", dynlib: dynlibsteam_api.}: uint32

var k_cchPublishedDocumentDescriptionMax* {. importcpp: "k_cchPublishedDocumentDescriptionMax", dynlib: dynlibsteam_api.}: uint32

var k_cchPublishedDocumentChangeDescriptionMax* {. importcpp: "k_cchPublishedDocumentChangeDescriptionMax", dynlib: dynlibsteam_api.}: uint32

var k_unEnumeratePublishedFilesMaxResults* {. importcpp: "k_unEnumeratePublishedFilesMaxResults", dynlib: dynlibsteam_api.}: uint32

var k_cchTagListMax* {.importcpp: "k_cchTagListMax", dynlib: dynlibsteam_api.}: uint32

var k_cchFilenameMax* {.importcpp: "k_cchFilenameMax", dynlib: dynlibsteam_api.}: uint32

var k_cchPublishedFileURLMax* {.importcpp: "k_cchPublishedFileURLMax", dynlib: dynlibsteam_api.}: uint32

type
  ERemoteStoragePlatform* {.size: sizeof(cint).} = enum
    k_ERemoteStoragePlatformNone = 0, k_ERemoteStoragePlatformWindows = (1 shl 0), k_ERemoteStoragePlatformOSX = (1 shl 1), k_ERemoteStoragePlatformPS3 = (1 shl 2), k_ERemoteStoragePlatformLinux = (1 shl 3), k_ERemoteStoragePlatformReserved2 = (1 shl 4), k_ERemoteStoragePlatformAll = 0xFFFFFFFF


type
  ERemoteStoragePublishedFileVisibility* {.size: sizeof(cint).} = enum
    k_ERemoteStoragePublishedFileVisibilityPublic = 0, k_ERemoteStoragePublishedFileVisibilityFriendsOnly = 1, k_ERemoteStoragePublishedFileVisibilityPrivate = 2


type
  EWorkshopFileType* {.size: sizeof(cint).} = enum
    k_EWorkshopFileTypeFirst = 0, k_EWorkshopFileTypeMicrotransaction = 1, k_EWorkshopFileTypeCollection = 2, k_EWorkshopFileTypeArt = 3, k_EWorkshopFileTypeVideo = 4, k_EWorkshopFileTypeScreenshot = 5, k_EWorkshopFileTypeGame = 6, k_EWorkshopFileTypeSoftware = 7, k_EWorkshopFileTypeConcept = 8, k_EWorkshopFileTypeWebGuide = 9, k_EWorkshopFileTypeIntegratedGuide = 10, k_EWorkshopFileTypeMerch = 11, k_EWorkshopFileTypeControllerBinding = 12, k_EWorkshopFileTypeSteamworksAccessInvite = 13, k_EWorkshopFileTypeSteamVideo = 14, k_EWorkshopFileTypeGameManagedItem = 15, k_EWorkshopFileTypeMax = 16

const
  k_EWorkshopFileTypeCommunity = k_EWorkshopFileTypeFirst

type
  EWorkshopVote* {.size: sizeof(cint).} = enum
    k_EWorkshopVoteUnvoted = 0, k_EWorkshopVoteFor = 1, k_EWorkshopVoteAgainst = 2, k_EWorkshopVoteLater = 3


type
  EWorkshopFileAction* {.size: sizeof(cint).} = enum
    k_EWorkshopFileActionPlayed = 0, k_EWorkshopFileActionCompleted = 1


type
  EWorkshopEnumerationType* {.size: sizeof(cint).} = enum
    k_EWorkshopEnumerationTypeRankedByVote = 0, k_EWorkshopEnumerationTypeRecent = 1, k_EWorkshopEnumerationTypeTrending = 2, k_EWorkshopEnumerationTypeFavoritesOfFriends = 3, k_EWorkshopEnumerationTypeVotedByFriends = 4, k_EWorkshopEnumerationTypeContentByFriends = 5, k_EWorkshopEnumerationTypeRecentFromFollowedUsers = 6


type
  EWorkshopVideoProvider* {.size: sizeof(cint).} = enum
    k_EWorkshopVideoProviderNone = 0, k_EWorkshopVideoProviderYoutube = 1


type
  EUGCReadAction* {.size: sizeof(cint).} = enum
    k_EUGCRead_ContinueReadingUntilFinished = 0, k_EUGCRead_ContinueReading = 1, k_EUGCRead_Close = 2


type
  ISteamRemoteStorage* {.bycopy.} = object


proc FileWrite*(this: var ISteamRemoteStorage; pchFile: cstring; pvData: pointer; cubData: int32): bool {.stdcall, importcpp: "FileWrite", dynlib: dynlibsteam_api.}
proc FileRead*(this: var ISteamRemoteStorage; pchFile: cstring; pvData: pointer; cubDataToRead: int32): int32 {.stdcall, importcpp: "FileRead", dynlib: dynlibsteam_api.}
proc FileWriteAsync*(this: var ISteamRemoteStorage; pchFile: cstring; pvData: pointer; cubData: uint32): SteamAPICall_t {.stdcall, importcpp: "FileWriteAsync", dynlib: dynlibsteam_api.}
proc FileReadAsync*(this: var ISteamRemoteStorage; pchFile: cstring; nOffset: uint32; cubToRead: uint32): SteamAPICall_t {.stdcall, importcpp: "FileReadAsync", dynlib: dynlibsteam_api.}
proc FileReadAsyncComplete*(this: var ISteamRemoteStorage; hReadCall: SteamAPICall_t; pvBuffer: pointer; cubToRead: uint32): bool {.stdcall, importcpp: "FileReadAsyncComplete", dynlib: dynlibsteam_api.}
proc FileForget*(this: var ISteamRemoteStorage; pchFile: cstring): bool {.stdcall, importcpp: "FileForget", dynlib: dynlibsteam_api.}
proc FileDelete*(this: var ISteamRemoteStorage; pchFile: cstring): bool {.stdcall, importcpp: "FileDelete", dynlib: dynlibsteam_api.}
proc FileShare*(this: var ISteamRemoteStorage; pchFile: cstring): SteamAPICall_t {. stdcall, importcpp: "FileShare", dynlib: dynlibsteam_api.}
proc SetSyncPlatforms*(this: var ISteamRemoteStorage; pchFile: cstring; eRemoteStoragePlatform: ERemoteStoragePlatform): bool {. stdcall, importcpp: "SetSyncPlatforms", dynlib: dynlibsteam_api.}
proc FileWriteStreamOpen*(this: var ISteamRemoteStorage; pchFile: cstring): UGCFileWriteStreamHandle_t {. stdcall, importcpp: "FileWriteStreamOpen", dynlib: dynlibsteam_api.}
proc FileWriteStreamWriteChunk*(this: var ISteamRemoteStorage; writeHandle: UGCFileWriteStreamHandle_t; pvData: pointer; cubData: int32): bool {.stdcall, importcpp: "FileWriteStreamWriteChunk", dynlib: dynlibsteam_api.}
proc FileWriteStreamClose*(this: var ISteamRemoteStorage; writeHandle: UGCFileWriteStreamHandle_t): bool {.stdcall, importcpp: "FileWriteStreamClose", dynlib: dynlibsteam_api.}
proc FileWriteStreamCancel*(this: var ISteamRemoteStorage; writeHandle: UGCFileWriteStreamHandle_t): bool {. stdcall, importcpp: "FileWriteStreamCancel", dynlib: dynlibsteam_api.}
proc FileExists*(this: var ISteamRemoteStorage; pchFile: cstring): bool {.stdcall, importcpp: "FileExists", dynlib: dynlibsteam_api.}
proc FilePersisted*(this: var ISteamRemoteStorage; pchFile: cstring): bool {.stdcall, importcpp: "FilePersisted", dynlib: dynlibsteam_api.}
proc GetFileSize*(this: var ISteamRemoteStorage; pchFile: cstring): int32 {.stdcall, importcpp: "GetFileSize", dynlib: dynlibsteam_api.}
proc GetFileTimestamp*(this: var ISteamRemoteStorage; pchFile: cstring): int64 {. stdcall, importcpp: "GetFileTimestamp", dynlib: dynlibsteam_api.}
proc GetSyncPlatforms*(this: var ISteamRemoteStorage; pchFile: cstring): ERemoteStoragePlatform {. stdcall, importcpp: "GetSyncPlatforms", dynlib: dynlibsteam_api.}
proc GetFileCount*(this: var ISteamRemoteStorage): int32 {.stdcall, importcpp: "GetFileCount", dynlib: dynlibsteam_api.}
proc GetFileNameAndSize*(this: var ISteamRemoteStorage; iFile: cint; pnFileSizeInBytes: ptr int32): cstring {.stdcall, importcpp: "GetFileNameAndSize", dynlib: dynlibsteam_api.}
proc GetQuota*(this: var ISteamRemoteStorage; pnTotalBytes: ptr uint64; puAvailableBytes: ptr uint64): bool {.stdcall, importcpp: "GetQuota", dynlib: dynlibsteam_api.}
proc IsCloudEnabledForAccount*(this: var ISteamRemoteStorage): bool {.stdcall, importcpp: "IsCloudEnabledForAccount", dynlib: dynlibsteam_api.}
proc IsCloudEnabledForApp*(this: var ISteamRemoteStorage): bool {.stdcall, importcpp: "IsCloudEnabledForApp", dynlib: dynlibsteam_api.}
proc SetCloudEnabledForApp*(this: var ISteamRemoteStorage; bEnabled: bool) {.stdcall, importcpp: "SetCloudEnabledForApp", dynlib: dynlibsteam_api.}
proc UGCDownload*(this: var ISteamRemoteStorage; hContent: UGCHandle_t; unPriority: uint32): SteamAPICall_t {.stdcall, importcpp: "UGCDownload", dynlib: dynlibsteam_api.}
proc GetUGCDownloadProgress*(this: var ISteamRemoteStorage; hContent: UGCHandle_t; pnBytesDownloaded: ptr int32; pnBytesExpected: ptr int32): bool {.stdcall, importcpp: "GetUGCDownloadProgress", dynlib: dynlibsteam_api.}
proc GetUGCDetails*(this: var ISteamRemoteStorage; hContent: UGCHandle_t; pnAppID: ptr AppId_t; ppchName: cstringArray; pnFileSizeInBytes: ptr int32; pSteamIDOwner: ptr CSteamID): bool {. stdcall, importcpp: "GetUGCDetails", dynlib: dynlibsteam_api.}
proc UGCRead*(this: var ISteamRemoteStorage; hContent: UGCHandle_t; pvData: pointer; cubDataToRead: int32; cOffset: uint32; eAction: EUGCReadAction): int32 {. stdcall, importcpp: "UGCRead", dynlib: dynlibsteam_api.}
proc GetCachedUGCCount*(this: var ISteamRemoteStorage): int32 {.stdcall, importcpp: "GetCachedUGCCount", dynlib: dynlibsteam_api.}
proc GetCachedUGCHandle*(this: var ISteamRemoteStorage; iCachedContent: int32): UGCHandle_t {. stdcall, importcpp: "GetCachedUGCHandle", dynlib: dynlibsteam_api.}
proc PublishWorkshopFile*(this: var ISteamRemoteStorage; pchFile: cstring; pchPreviewFile: cstring; nConsumerAppId: AppId_t; pchTitle: cstring; pchDescription: cstring; eVisibility: ERemoteStoragePublishedFileVisibility; pTags: ptr SteamParamStringArray_t; eWorkshopFileType: EWorkshopFileType): SteamAPICall_t {. stdcall, importcpp: "PublishWorkshopFile", dynlib: dynlibsteam_api.}
proc CreatePublishedFileUpdateRequest*(this: var ISteamRemoteStorage; unPublishedFileId: PublishedFileId_t): PublishedFileUpdateHandle_t {. stdcall, importcpp: "CreatePublishedFileUpdateRequest", dynlib: dynlibsteam_api.}
proc UpdatePublishedFileFile*(this: var ISteamRemoteStorage; updateHandle: PublishedFileUpdateHandle_t; pchFile: cstring): bool {.stdcall, importcpp: "UpdatePublishedFileFile", dynlib: dynlibsteam_api.}
proc UpdatePublishedFilePreviewFile*(this: var ISteamRemoteStorage; updateHandle: PublishedFileUpdateHandle_t; pchPreviewFile: cstring): bool {.stdcall, importcpp: "UpdatePublishedFilePreviewFile", dynlib: dynlibsteam_api.}
proc UpdatePublishedFileTitle*(this: var ISteamRemoteStorage; updateHandle: PublishedFileUpdateHandle_t; pchTitle: cstring): bool {.stdcall, importcpp: "UpdatePublishedFileTitle", dynlib: dynlibsteam_api.}
proc UpdatePublishedFileDescription*(this: var ISteamRemoteStorage; updateHandle: PublishedFileUpdateHandle_t; pchDescription: cstring): bool {.stdcall, importcpp: "UpdatePublishedFileDescription", dynlib: dynlibsteam_api.}
proc UpdatePublishedFileVisibility*(this: var ISteamRemoteStorage; updateHandle: PublishedFileUpdateHandle_t; eVisibility: ERemoteStoragePublishedFileVisibility): bool {.stdcall, importcpp: "UpdatePublishedFileVisibility", dynlib: dynlibsteam_api.}
proc UpdatePublishedFileTags*(this: var ISteamRemoteStorage; updateHandle: PublishedFileUpdateHandle_t; pTags: ptr SteamParamStringArray_t): bool {.stdcall, importcpp: "UpdatePublishedFileTags", dynlib: dynlibsteam_api.}
proc CommitPublishedFileUpdate*(this: var ISteamRemoteStorage; updateHandle: PublishedFileUpdateHandle_t): SteamAPICall_t {. stdcall, importcpp: "CommitPublishedFileUpdate", dynlib: dynlibsteam_api.}
proc GetPublishedFileDetails*(this: var ISteamRemoteStorage; unPublishedFileId: PublishedFileId_t; unMaxSecondsOld: uint32): SteamAPICall_t {.stdcall, importcpp: "GetPublishedFileDetails", dynlib: dynlibsteam_api.}
proc DeletePublishedFile*(this: var ISteamRemoteStorage; unPublishedFileId: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "DeletePublishedFile", dynlib: dynlibsteam_api.}
proc EnumerateUserPublishedFiles*(this: var ISteamRemoteStorage; unStartIndex: uint32): SteamAPICall_t {.stdcall, importcpp: "EnumerateUserPublishedFiles", dynlib: dynlibsteam_api.}
proc SubscribePublishedFile*(this: var ISteamRemoteStorage; unPublishedFileId: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "SubscribePublishedFile", dynlib: dynlibsteam_api.}
proc EnumerateUserSubscribedFiles*(this: var ISteamRemoteStorage; unStartIndex: uint32): SteamAPICall_t {.stdcall, importcpp: "EnumerateUserSubscribedFiles", dynlib: dynlibsteam_api.}
proc UnsubscribePublishedFile*(this: var ISteamRemoteStorage; unPublishedFileId: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "UnsubscribePublishedFile", dynlib: dynlibsteam_api.}
proc UpdatePublishedFileSetChangeDescription*(this: var ISteamRemoteStorage; updateHandle: PublishedFileUpdateHandle_t; pchChangeDescription: cstring): bool {. stdcall, importcpp: "UpdatePublishedFileSetChangeDescription", dynlib: dynlibsteam_api.}
proc GetPublishedItemVoteDetails*(this: var ISteamRemoteStorage; unPublishedFileId: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "GetPublishedItemVoteDetails", dynlib: dynlibsteam_api.}
proc UpdateUserPublishedItemVote*(this: var ISteamRemoteStorage; unPublishedFileId: PublishedFileId_t; bVoteUp: bool): SteamAPICall_t {.stdcall, importcpp: "UpdateUserPublishedItemVote", dynlib: dynlibsteam_api.}
proc GetUserPublishedItemVoteDetails*(this: var ISteamRemoteStorage; unPublishedFileId: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "GetUserPublishedItemVoteDetails", dynlib: dynlibsteam_api.}
proc EnumerateUserSharedWorkshopFiles*(this: var ISteamRemoteStorage; steamId: CSteamID; unStartIndex: uint32; pRequiredTags: ptr SteamParamStringArray_t; pExcludedTags: ptr SteamParamStringArray_t): SteamAPICall_t {. stdcall, importcpp: "EnumerateUserSharedWorkshopFiles", dynlib: dynlibsteam_api.}
proc PublishVideo*(this: var ISteamRemoteStorage; eVideoProvider: EWorkshopVideoProvider; pchVideoAccount: cstring; pchVideoIdentifier: cstring; pchPreviewFile: cstring; nConsumerAppId: AppId_t; pchTitle: cstring; pchDescription: cstring; eVisibility: ERemoteStoragePublishedFileVisibility; pTags: ptr SteamParamStringArray_t): SteamAPICall_t {.stdcall, importcpp: "PublishVideo", dynlib: dynlibsteam_api.}
proc SetUserPublishedFileAction*(this: var ISteamRemoteStorage; unPublishedFileId: PublishedFileId_t; eAction: EWorkshopFileAction): SteamAPICall_t {. stdcall, importcpp: "SetUserPublishedFileAction", dynlib: dynlibsteam_api.}
proc EnumeratePublishedFilesByUserAction*(this: var ISteamRemoteStorage; eAction: EWorkshopFileAction; unStartIndex: uint32): SteamAPICall_t {.stdcall, importcpp: "EnumeratePublishedFilesByUserAction", dynlib: dynlibsteam_api.}
proc EnumeratePublishedWorkshopFiles*(this: var ISteamRemoteStorage; eEnumerationType: EWorkshopEnumerationType; unStartIndex: uint32; unCount: uint32; unDays: uint32; pTags: ptr SteamParamStringArray_t; pUserTags: ptr SteamParamStringArray_t): SteamAPICall_t {. stdcall, importcpp: "EnumeratePublishedWorkshopFiles", dynlib: dynlibsteam_api.}
proc UGCDownloadToLocation*(this: var ISteamRemoteStorage; hContent: UGCHandle_t; pchLocation: cstring; unPriority: uint32): SteamAPICall_t {. stdcall, importcpp: "UGCDownloadToLocation", dynlib: dynlibsteam_api.}
type
  RemoteStorageAppSyncedClient_t* {.bycopy.} = object
    m_nAppID*: AppId_t
    m_eResult*: EResult
    m_unNumDownloads*: cint


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 1

type
  RemoteStorageAppSyncedServer_t* {.bycopy.} = object
    m_nAppID*: AppId_t
    m_eResult*: EResult
    m_unNumUploads*: cint


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 2

type
  RemoteStorageAppSyncProgress_t* {.bycopy.} = object
    m_rgchCurrentFile*: array[k_cchFilenameMax, char]
    m_nAppID*: AppId_t
    m_uBytesTransferredThisChunk*: uint32
    m_dAppPercentComplete*: cdouble
    m_bUploading*: bool


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 3

type
  RemoteStorageAppSyncStatusCheck_t* {.bycopy.} = object
    m_nAppID*: AppId_t
    m_eResult*: EResult


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 5

type
  RemoteStorageFileShareResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_hFile*: UGCHandle_t
    m_rgchFilename*: array[k_cchFilenameMax, char]


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 7

type
  RemoteStoragePublishFileResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_bUserNeedsToAcceptWorkshopLegalAgreement*: bool


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 9

type
  RemoteStorageDeletePublishedFileResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 11

type
  RemoteStorageEnumerateUserPublishedFilesResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nResultsReturned*: int32
    m_nTotalResultCount*: int32
    m_rgPublishedFileId*: array[k_unEnumeratePublishedFilesMaxResults, PublishedFileId_t]


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 12

type
  RemoteStorageSubscribePublishedFileResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 13

type
  RemoteStorageEnumerateUserSubscribedFilesResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nResultsReturned*: int32
    m_nTotalResultCount*: int32
    m_rgPublishedFileId*: array[k_unEnumeratePublishedFilesMaxResults, PublishedFileId_t]
    m_rgRTimeSubscribed*: array[k_unEnumeratePublishedFilesMaxResults, uint32]


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 14

type
  compile_time_assert_type* = array[if (sizeof(
      (constructRemoteStorageEnumerateUserSubscribedFilesResult_t)) ==
      (1 + 1 + 1 + 50 + 100) * 4): 1 else: -1, char]

nil
type
  RemoteStorageUnsubscribePublishedFileResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 15

type
  RemoteStorageUpdatePublishedFileResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_bUserNeedsToAcceptWorkshopLegalAgreement*: bool


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 16

type
  RemoteStorageDownloadUGCResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_hFile*: UGCHandle_t
    m_nAppID*: AppId_t
    m_nSizeInBytes*: int32
    m_pchFileName*: array[k_cchFilenameMax, char]
    m_ulSteamIDOwner*: uint64


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 17

type
  RemoteStorageGetPublishedFileDetailsResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_nCreatorAppID*: AppId_t
    m_nConsumerAppID*: AppId_t
    m_rgchTitle*: array[k_cchPublishedDocumentTitleMax, char]
    m_rgchDescription*: array[k_cchPublishedDocumentDescriptionMax, char]
    m_hFile*: UGCHandle_t
    m_hPreviewFile*: UGCHandle_t
    m_ulSteamIDOwner*: uint64
    m_rtimeCreated*: uint32
    m_rtimeUpdated*: uint32
    m_eVisibility*: ERemoteStoragePublishedFileVisibility
    m_bBanned*: bool
    m_rgchTags*: array[k_cchTagListMax, char]
    m_bTagsTruncated*: bool
    m_pchFileName*: array[k_cchFilenameMax, char]
    m_nFileSize*: int32
    m_nPreviewFileSize*: int32
    m_rgchURL*: array[k_cchPublishedFileURLMax, char]
    m_eFileType*: EWorkshopFileType
    m_bAcceptedForUse*: bool


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 18

type
  RemoteStorageEnumerateWorkshopFilesResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nResultsReturned*: int32
    m_nTotalResultCount*: int32
    m_rgPublishedFileId*: array[k_unEnumeratePublishedFilesMaxResults, PublishedFileId_t]
    m_rgScore*: array[k_unEnumeratePublishedFilesMaxResults, cfloat]
    m_nAppId*: AppId_t
    m_unStartIndex*: uint32


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 19

type
  RemoteStorageGetPublishedItemVoteDetailsResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_unPublishedFileId*: PublishedFileId_t
    m_nVotesFor*: int32
    m_nVotesAgainst*: int32
    m_nReports*: int32
    m_fScore*: cfloat


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 20

type
  RemoteStoragePublishedFileSubscribed_t* {.bycopy.} = object
    m_nPublishedFileId*: PublishedFileId_t
    m_nAppID*: AppId_t


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 21

type
  RemoteStoragePublishedFileUnsubscribed_t* {.bycopy.} = object
    m_nPublishedFileId*: PublishedFileId_t
    m_nAppID*: AppId_t


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 22

type
  RemoteStoragePublishedFileDeleted_t* {.bycopy.} = object
    m_nPublishedFileId*: PublishedFileId_t
    m_nAppID*: AppId_t


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 23

type
  RemoteStorageUpdateUserPublishedItemVoteResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 24

type
  RemoteStorageUserVoteDetails_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_eVote*: EWorkshopVote


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 25

type
  RemoteStorageEnumerateUserSharedWorkshopFilesResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nResultsReturned*: int32
    m_nTotalResultCount*: int32
    m_rgPublishedFileId*: array[k_unEnumeratePublishedFilesMaxResults, PublishedFileId_t]


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 26

type
  RemoteStorageSetUserPublishedFileActionResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_eAction*: EWorkshopFileAction


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 27

type
  RemoteStorageEnumeratePublishedFilesByUserActionResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_eAction*: EWorkshopFileAction
    m_nResultsReturned*: int32
    m_nTotalResultCount*: int32
    m_rgPublishedFileId*: array[k_unEnumeratePublishedFilesMaxResults, PublishedFileId_t]
    m_rgRTimeUpdated*: array[k_unEnumeratePublishedFilesMaxResults, uint32]


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 28

type
  RemoteStoragePublishFileProgress_t* {.bycopy.} = object
    m_dPercentFile*: cdouble
    m_bPreview*: bool


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 29

type
  RemoteStoragePublishedFileUpdated_t* {.bycopy.} = object
    m_nPublishedFileId*: PublishedFileId_t
    m_nAppID*: AppId_t
    m_ulUnused*: uint64


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 30

type
  RemoteStorageFileWriteAsyncComplete_t* {.bycopy.} = object
    m_eResult*: EResult


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 31

type
  RemoteStorageFileReadAsyncComplete_t* {.bycopy.} = object
    m_hFileReadAsync*: SteamAPICall_t
    m_eResult*: EResult
    m_nOffset*: uint32
    m_cubRead*: uint32


const
  k_iCallback* = k_iClientRemoteStorageCallbacks + 32

const
  k_cchStatNameMax* = 128

const
  k_cchLeaderboardNameMax* = 128

const
  k_cLeaderboardDetailsMax* = 64

type
  SteamLeaderboard_t* = uint64
  SteamLeaderboardEntries_t* = uint64
  ELeaderboardDataRequest* {.size: sizeof(cint).} = enum
    k_ELeaderboardDataRequestGlobal = 0, k_ELeaderboardDataRequestGlobalAroundUser = 1, k_ELeaderboardDataRequestFriends = 2, k_ELeaderboardDataRequestUsers = 3


type
  ELeaderboardSortMethod* {.size: sizeof(cint).} = enum
    k_ELeaderboardSortMethodNone = 0, k_ELeaderboardSortMethodAscending = 1, k_ELeaderboardSortMethodDescending = 2


type
  ELeaderboardDisplayType* {.size: sizeof(cint).} = enum
    k_ELeaderboardDisplayTypeNone = 0, k_ELeaderboardDisplayTypeNumeric = 1, k_ELeaderboardDisplayTypeTimeSeconds = 2, k_ELeaderboardDisplayTypeTimeMilliSeconds = 3


type
  ELeaderboardUploadScoreMethod* {.size: sizeof(cint).} = enum
    k_ELeaderboardUploadScoreMethodNone = 0, k_ELeaderboardUploadScoreMethodKeepBest = 1, k_ELeaderboardUploadScoreMethodForceUpdate = 2


type
  LeaderboardEntry_t* {.bycopy.} = object
    m_steamIDUser*: CSteamID
    m_nGlobalRank*: int32
    m_nScore*: int32
    m_cDetails*: int32
    m_hUGC*: UGCHandle_t

  ISteamUserStats* {.bycopy.} = object


proc RequestCurrentStats*(this: var ISteamUserStats): bool {.stdcall, importcpp: "RequestCurrentStats", dynlib: dynlibsteam_api.}
proc GetStat*(this: var ISteamUserStats; pchName: cstring; pData: ptr int32): bool {. stdcall, importcpp: "GetStat", dynlib: dynlibsteam_api.}
proc GetStat*(this: var ISteamUserStats; pchName: cstring; pData: ptr cfloat): bool {. stdcall, importcpp: "GetStat", dynlib: dynlibsteam_api.}
proc SetStat*(this: var ISteamUserStats; pchName: cstring; nData: int32): bool {.stdcall, importcpp: "SetStat", dynlib: dynlibsteam_api.}
proc SetStat*(this: var ISteamUserStats; pchName: cstring; fData: cfloat): bool {. stdcall, importcpp: "SetStat", dynlib: dynlibsteam_api.}
proc UpdateAvgRateStat*(this: var ISteamUserStats; pchName: cstring; flCountThisSession: cfloat; dSessionLength: cdouble): bool {. stdcall, importcpp: "UpdateAvgRateStat", dynlib: dynlibsteam_api.}
proc GetAchievement*(this: var ISteamUserStats; pchName: cstring; pbAchieved: ptr bool): bool {. stdcall, importcpp: "GetAchievement", dynlib: dynlibsteam_api.}
proc SetAchievement*(this: var ISteamUserStats; pchName: cstring): bool {.stdcall, importcpp: "SetAchievement", dynlib: dynlibsteam_api.}
proc ClearAchievement*(this: var ISteamUserStats; pchName: cstring): bool {.stdcall, importcpp: "ClearAchievement", dynlib: dynlibsteam_api.}
proc GetAchievementAndUnlockTime*(this: var ISteamUserStats; pchName: cstring; pbAchieved: ptr bool; punUnlockTime: ptr uint32): bool {. stdcall, importcpp: "GetAchievementAndUnlockTime", dynlib: dynlibsteam_api.}
proc StoreStats*(this: var ISteamUserStats): bool {.stdcall, importcpp: "StoreStats", dynlib: dynlibsteam_api.}
proc GetAchievementIcon*(this: var ISteamUserStats; pchName: cstring): cint {.stdcall, importcpp: "GetAchievementIcon", dynlib: dynlibsteam_api.}
proc GetAchievementDisplayAttribute*(this: var ISteamUserStats; pchName: cstring; pchKey: cstring): cstring {.stdcall, importcpp: "GetAchievementDisplayAttribute", dynlib: dynlibsteam_api.}
proc IndicateAchievementProgress*(this: var ISteamUserStats; pchName: cstring; nCurProgress: uint32; nMaxProgress: uint32): bool {. stdcall, importcpp: "IndicateAchievementProgress", dynlib: dynlibsteam_api.}
proc GetNumAchievements*(this: var ISteamUserStats): uint32 {.stdcall, importcpp: "GetNumAchievements", dynlib: dynlibsteam_api.}
proc GetAchievementName*(this: var ISteamUserStats; iAchievement: uint32): cstring {. stdcall, importcpp: "GetAchievementName", dynlib: dynlibsteam_api.}
proc RequestUserStats*(this: var ISteamUserStats; steamIDUser: CSteamID): SteamAPICall_t {. stdcall, importcpp: "RequestUserStats", dynlib: dynlibsteam_api.}
proc GetUserStat*(this: var ISteamUserStats; steamIDUser: CSteamID; pchName: cstring; pData: ptr int32): bool {.stdcall, importcpp: "GetUserStat", dynlib: dynlibsteam_api.}
proc GetUserStat*(this: var ISteamUserStats; steamIDUser: CSteamID; pchName: cstring; pData: ptr cfloat): bool {.stdcall, importcpp: "GetUserStat", dynlib: dynlibsteam_api.}
proc GetUserAchievement*(this: var ISteamUserStats; steamIDUser: CSteamID; pchName: cstring; pbAchieved: ptr bool): bool {.stdcall, importcpp: "GetUserAchievement", dynlib: dynlibsteam_api.}
proc GetUserAchievementAndUnlockTime*(this: var ISteamUserStats; steamIDUser: CSteamID; pchName: cstring; pbAchieved: ptr bool; punUnlockTime: ptr uint32): bool {.stdcall, importcpp: "GetUserAchievementAndUnlockTime", dynlib: dynlibsteam_api.}
proc ResetAllStats*(this: var ISteamUserStats; bAchievementsToo: bool): bool {.stdcall, importcpp: "ResetAllStats", dynlib: dynlibsteam_api.}
proc FindOrCreateLeaderboard*(this: var ISteamUserStats; pchLeaderboardName: cstring; eLeaderboardSortMethod: ELeaderboardSortMethod; eLeaderboardDisplayType: ELeaderboardDisplayType): SteamAPICall_t {. stdcall, importcpp: "FindOrCreateLeaderboard", dynlib: dynlibsteam_api.}
proc FindLeaderboard*(this: var ISteamUserStats; pchLeaderboardName: cstring): SteamAPICall_t {. stdcall, importcpp: "FindLeaderboard", dynlib: dynlibsteam_api.}
proc GetLeaderboardName*(this: var ISteamUserStats; hSteamLeaderboard: SteamLeaderboard_t): cstring {.stdcall, importcpp: "GetLeaderboardName", dynlib: dynlibsteam_api.}
proc GetLeaderboardEntryCount*(this: var ISteamUserStats; hSteamLeaderboard: SteamLeaderboard_t): cint {. stdcall, importcpp: "GetLeaderboardEntryCount", dynlib: dynlibsteam_api.}
proc GetLeaderboardSortMethod*(this: var ISteamUserStats; hSteamLeaderboard: SteamLeaderboard_t): ELeaderboardSortMethod {. stdcall, importcpp: "GetLeaderboardSortMethod", dynlib: dynlibsteam_api.}
proc GetLeaderboardDisplayType*(this: var ISteamUserStats; hSteamLeaderboard: SteamLeaderboard_t): ELeaderboardDisplayType {. stdcall, importcpp: "GetLeaderboardDisplayType", dynlib: dynlibsteam_api.}
proc DownloadLeaderboardEntries*(this: var ISteamUserStats; hSteamLeaderboard: SteamLeaderboard_t; eLeaderboardDataRequest: ELeaderboardDataRequest; nRangeStart: cint; nRangeEnd: cint): SteamAPICall_t {.stdcall, importcpp: "DownloadLeaderboardEntries", dynlib: dynlibsteam_api.}
proc DownloadLeaderboardEntriesForUsers*(this: var ISteamUserStats; hSteamLeaderboard: SteamLeaderboard_t; prgUsers: ptr CSteamID; cUsers: cint): SteamAPICall_t {. stdcall, importcpp: "DownloadLeaderboardEntriesForUsers", dynlib: dynlibsteam_api.}
proc GetDownloadedLeaderboardEntry*(this: var ISteamUserStats; hSteamLeaderboardEntries: SteamLeaderboardEntries_t; index: cint; pLeaderboardEntry: ptr LeaderboardEntry_t; pDetails: ptr int32; cDetailsMax: cint): bool {. stdcall, importcpp: "GetDownloadedLeaderboardEntry", dynlib: dynlibsteam_api.}
proc UploadLeaderboardScore*(this: var ISteamUserStats; hSteamLeaderboard: SteamLeaderboard_t; eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod; nScore: int32; pScoreDetails: ptr int32; cScoreDetailsCount: cint): SteamAPICall_t {. stdcall, importcpp: "UploadLeaderboardScore", dynlib: dynlibsteam_api.}
proc AttachLeaderboardUGC*(this: var ISteamUserStats; hSteamLeaderboard: SteamLeaderboard_t; hUGC: UGCHandle_t): SteamAPICall_t {. stdcall, importcpp: "AttachLeaderboardUGC", dynlib: dynlibsteam_api.}
proc GetNumberOfCurrentPlayers*(this: var ISteamUserStats): SteamAPICall_t {.stdcall, importcpp: "GetNumberOfCurrentPlayers", dynlib: dynlibsteam_api.}
proc RequestGlobalAchievementPercentages*(this: var ISteamUserStats): SteamAPICall_t {. stdcall, importcpp: "RequestGlobalAchievementPercentages", dynlib: dynlibsteam_api.}
proc GetMostAchievedAchievementInfo*(this: var ISteamUserStats; pchName: cstring; unNameBufLen: uint32; pflPercent: ptr cfloat; pbAchieved: ptr bool): cint {.stdcall, importcpp: "GetMostAchievedAchievementInfo", dynlib: dynlibsteam_api.}
proc GetNextMostAchievedAchievementInfo*(this: var ISteamUserStats; iIteratorPrevious: cint; pchName: cstring; unNameBufLen: uint32; pflPercent: ptr cfloat; pbAchieved: ptr bool): cint {.stdcall, importcpp: "GetNextMostAchievedAchievementInfo", dynlib: dynlibsteam_api.}
proc GetAchievementAchievedPercent*(this: var ISteamUserStats; pchName: cstring; pflPercent: ptr cfloat): bool {.stdcall, importcpp: "GetAchievementAchievedPercent", dynlib: dynlibsteam_api.}
proc RequestGlobalStats*(this: var ISteamUserStats; nHistoryDays: cint): SteamAPICall_t {. stdcall, importcpp: "RequestGlobalStats", dynlib: dynlibsteam_api.}
proc GetGlobalStat*(this: var ISteamUserStats; pchStatName: cstring; pData: ptr int64): bool {. stdcall, importcpp: "GetGlobalStat", dynlib: dynlibsteam_api.}
proc GetGlobalStat*(this: var ISteamUserStats; pchStatName: cstring; pData: ptr cdouble): bool {.stdcall, importcpp: "GetGlobalStat", dynlib: dynlibsteam_api.}
proc GetGlobalStatHistory*(this: var ISteamUserStats; pchStatName: cstring; pData: ptr int64; cubData: uint32): int32 {.stdcall, importcpp: "GetGlobalStatHistory", dynlib: dynlibsteam_api.}
proc GetGlobalStatHistory*(this: var ISteamUserStats; pchStatName: cstring; pData: ptr cdouble; cubData: uint32): int32 {.stdcall, importcpp: "GetGlobalStatHistory", dynlib: dynlibsteam_api.}
type
  UserStatsReceived_t* {.bycopy.} = object
    m_nGameID*: uint64
    m_eResult*: EResult
    m_steamIDUser*: CSteamID


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 1

type
  UserStatsStored_t* {.bycopy.} = object
    m_nGameID*: uint64
    m_eResult*: EResult


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 2

type
  UserAchievementStored_t* {.bycopy.} = object
    m_nGameID*: uint64
    m_bGroupAchievement*: bool
    m_rgchAchievementName*: array[k_cchStatNameMax, char]
    m_nCurProgress*: uint32
    m_nMaxProgress*: uint32


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 3

type
  LeaderboardFindResult_t* {.bycopy.} = object
    m_hSteamLeaderboard*: SteamLeaderboard_t
    m_bLeaderboardFound*: uint8


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 4

type
  LeaderboardScoresDownloaded_t* {.bycopy.} = object
    m_hSteamLeaderboard*: SteamLeaderboard_t
    m_hSteamLeaderboardEntries*: SteamLeaderboardEntries_t
    m_cEntryCount*: cint


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 5

type
  LeaderboardScoreUploaded_t* {.bycopy.} = object
    m_bSuccess*: uint8
    m_hSteamLeaderboard*: SteamLeaderboard_t
    m_nScore*: int32
    m_bScoreChanged*: uint8
    m_nGlobalRankNew*: cint
    m_nGlobalRankPrevious*: cint


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 6

type
  NumberOfCurrentPlayers_t* {.bycopy.} = object
    m_bSuccess*: uint8
    m_cPlayers*: int32


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 7

type
  UserStatsUnloaded_t* {.bycopy.} = object
    m_steamIDUser*: CSteamID


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 8

type
  UserAchievementIconFetched_t* {.bycopy.} = object
    m_nGameID*: CGameID
    m_rgchAchievementName*: array[k_cchStatNameMax, char]
    m_bAchieved*: bool
    m_nIconHandle*: cint


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 9

type
  GlobalAchievementPercentagesReady_t* {.bycopy.} = object
    m_nGameID*: uint64
    m_eResult*: EResult


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 10

type
  LeaderboardUGCSet_t* {.bycopy.} = object
    m_eResult*: EResult
    m_hSteamLeaderboard*: SteamLeaderboard_t


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 11

type
  PS3TrophiesInstalled_t* {.bycopy.} = object
    m_nGameID*: uint64
    m_eResult*: EResult
    m_ulRequiredDiskSpace*: uint64


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 12

type
  GlobalStatsReceived_t* {.bycopy.} = object
    m_nGameID*: uint64
    m_eResult*: EResult


const
  k_iCallback* = k_iSteamUserStatsCallbacks + 12

var k_cubAppProofOfPurchaseKeyMax* {.importcpp: "k_cubAppProofOfPurchaseKeyMax", dynlib: dynlibsteam_api.}: cint

type
  ISteamApps* {.bycopy.} = object


proc BIsSubscribed*(this: var ISteamApps): bool {.stdcall, importcpp: "BIsSubscribed", dynlib: dynlibsteam_api.}
proc BIsLowViolence*(this: var ISteamApps): bool {.stdcall, importcpp: "BIsLowViolence", dynlib: dynlibsteam_api.}
proc BIsCybercafe*(this: var ISteamApps): bool {.stdcall, importcpp: "BIsCybercafe", dynlib: dynlibsteam_api.}
proc BIsVACBanned*(this: var ISteamApps): bool {.stdcall, importcpp: "BIsVACBanned", dynlib: dynlibsteam_api.}
proc GetCurrentGameLanguage*(this: var ISteamApps): cstring {.stdcall, importcpp: "GetCurrentGameLanguage", dynlib: dynlibsteam_api.}
proc GetAvailableGameLanguages*(this: var ISteamApps): cstring {.stdcall, importcpp: "GetAvailableGameLanguages", dynlib: dynlibsteam_api.}
proc BIsSubscribedApp*(this: var ISteamApps; appID: AppId_t): bool {.stdcall, importcpp: "BIsSubscribedApp", dynlib: dynlibsteam_api.}
proc BIsDlcInstalled*(this: var ISteamApps; appID: AppId_t): bool {.stdcall, importcpp: "BIsDlcInstalled", dynlib: dynlibsteam_api.}
proc GetEarliestPurchaseUnixTime*(this: var ISteamApps; nAppID: AppId_t): uint32 {. stdcall, importcpp: "GetEarliestPurchaseUnixTime", dynlib: dynlibsteam_api.}
proc BIsSubscribedFromFreeWeekend*(this: var ISteamApps): bool {.stdcall, importcpp: "BIsSubscribedFromFreeWeekend", dynlib: dynlibsteam_api.}
proc GetDLCCount*(this: var ISteamApps): cint {.stdcall, importcpp: "GetDLCCount", dynlib: dynlibsteam_api.}
proc BGetDLCDataByIndex*(this: var ISteamApps; iDLC: cint; pAppID: ptr AppId_t; pbAvailable: ptr bool; pchName: cstring; cchNameBufferSize: cint): bool {.stdcall, importcpp: "BGetDLCDataByIndex", dynlib: dynlibsteam_api.}
proc InstallDLC*(this: var ISteamApps; nAppID: AppId_t) {.stdcall, importcpp: "InstallDLC", dynlib: dynlibsteam_api.}
proc UninstallDLC*(this: var ISteamApps; nAppID: AppId_t) {.stdcall, importcpp: "UninstallDLC", dynlib: dynlibsteam_api.}
proc RequestAppProofOfPurchaseKey*(this: var ISteamApps; nAppID: AppId_t) {.stdcall, importcpp: "RequestAppProofOfPurchaseKey", dynlib: dynlibsteam_api.}
proc GetCurrentBetaName*(this: var ISteamApps; pchName: cstring; cchNameBufferSize: cint): bool {.stdcall, importcpp: "GetCurrentBetaName", dynlib: dynlibsteam_api.}
proc MarkContentCorrupt*(this: var ISteamApps; bMissingFilesOnly: bool): bool {. stdcall, importcpp: "MarkContentCorrupt", dynlib: dynlibsteam_api.}
proc GetInstalledDepots*(this: var ISteamApps; appID: AppId_t; pvecDepots: ptr DepotId_t; cMaxDepots: uint32): uint32 {. stdcall, importcpp: "GetInstalledDepots", dynlib: dynlibsteam_api.}
proc GetAppInstallDir*(this: var ISteamApps; appID: AppId_t; pchFolder: cstring; cchFolderBufferSize: uint32): uint32 {.stdcall, importcpp: "GetAppInstallDir", dynlib: dynlibsteam_api.}
proc BIsAppInstalled*(this: var ISteamApps; appID: AppId_t): bool {.stdcall, importcpp: "BIsAppInstalled", dynlib: dynlibsteam_api.}
proc GetAppOwner*(this: var ISteamApps): CSteamID {.stdcall, importcpp: "GetAppOwner", dynlib: dynlibsteam_api.}
proc GetLaunchQueryParam*(this: var ISteamApps; pchKey: cstring): cstring {.stdcall, importcpp: "GetLaunchQueryParam", dynlib: dynlibsteam_api.}
proc GetDlcDownloadProgress*(this: var ISteamApps; nAppID: AppId_t; punBytesDownloaded: ptr uint64; punBytesTotal: ptr uint64): bool {.stdcall, importcpp: "GetDlcDownloadProgress", dynlib: dynlibsteam_api.}
proc GetAppBuildId*(this: var ISteamApps): cint {.stdcall, importcpp: "GetAppBuildId", dynlib: dynlibsteam_api.}
proc RequestAllProofOfPurchaseKeys*(this: var ISteamApps) {.stdcall, importcpp: "RequestAllProofOfPurchaseKeys", dynlib: dynlibsteam_api.}
proc GetFileDetails*(this: var ISteamApps; pszFileName: cstring): SteamAPICall_t {. stdcall, importcpp: "GetFileDetails", dynlib: dynlibsteam_api.}
type
  DlcInstalled_t* {.bycopy.} = object
    m_nAppID*: AppId_t


const
  k_iCallback* = k_iSteamAppsCallbacks + 5

type
  ERegisterActivationCodeResult* {.size: sizeof(cint).} = enum
    k_ERegisterActivationCodeResultOK = 0, k_ERegisterActivationCodeResultFail = 1, k_ERegisterActivationCodeResultAlreadyRegistered = 2, k_ERegisterActivationCodeResultTimeout = 3, k_ERegisterActivationCodeAlreadyOwned = 4


type
  RegisterActivationCodeResponse_t* {.bycopy.} = object
    m_eResult*: ERegisterActivationCodeResult
    m_unPackageRegistered*: uint32


const
  k_iCallback* = k_iSteamAppsCallbacks + 8

type
  NewLaunchQueryParameters_t* {.bycopy.} = object


const
  k_iCallback* = k_iSteamAppsCallbacks + 14

type
  AppProofOfPurchaseKeyResponse_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nAppID*: uint32
    m_cchKeyLength*: uint32
    m_rgchKey*: array[k_cubAppProofOfPurchaseKeyMax, char]


const
  k_iCallback* = k_iSteamAppsCallbacks + 21

type
  FileDetailsResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_ulFileSize*: uint64
    m_FileSHA*: array[20, uint8]
    m_unFlags*: uint32


const
  k_iCallback* = k_iSteamAppsCallbacks + 23

type
  EP2PSessionError* {.size: sizeof(cint).} = enum
    k_EP2PSessionErrorNone = 0, k_EP2PSessionErrorNotRunningApp = 1, k_EP2PSessionErrorNoRightsToApp = 2, k_EP2PSessionErrorDestinationNotLoggedIn = 3, k_EP2PSessionErrorTimeout = 4, k_EP2PSessionErrorMax = 5


type
  EP2PSend* {.size: sizeof(cint).} = enum
    k_EP2PSendUnreliable = 0, k_EP2PSendUnreliableNoDelay = 1, k_EP2PSendReliable = 2, k_EP2PSendReliableWithBuffering = 3


type
  P2PSessionState_t* {.bycopy.} = object
    m_bConnectionActive*: uint8
    m_bConnecting*: uint8
    m_eP2PSessionError*: uint8
    m_bUsingRelay*: uint8
    m_nBytesQueuedForSend*: int32
    m_nPacketsQueuedForSend*: int32
    m_nRemoteIP*: uint32
    m_nRemotePort*: uint16

  SNetSocket_t* = uint32
  SNetListenSocket_t* = uint32
  ESNetSocketState* {.size: sizeof(cint).} = enum
    k_ESNetSocketStateInvalid = 0, k_ESNetSocketStateConnected = 1, k_ESNetSocketStateInitiated = 10, k_ESNetSocketStateLocalCandidatesFound = 11, k_ESNetSocketStateReceivedRemoteCandidates = 12, k_ESNetSocketStateChallengeHandshake = 15, k_ESNetSocketStateDisconnecting = 21, k_ESNetSocketStateLocalDisconnect = 22, k_ESNetSocketStateTimeoutDuringConnect = 23, k_ESNetSocketStateRemoteEndDisconnected = 24, k_ESNetSocketStateConnectionBroken = 25


type
  ESNetSocketConnectionType* {.size: sizeof(cint).} = enum
    k_ESNetSocketConnectionTypeNotConnected = 0, k_ESNetSocketConnectionTypeUDP = 1, k_ESNetSocketConnectionTypeUDPRelay = 2


type
  ISteamNetworking* {.bycopy.} = object


proc SendP2PPacket*(this: var ISteamNetworking; steamIDRemote: CSteamID; pubData: pointer; cubData: uint32; eP2PSendType: EP2PSend; nChannel: cint = 0): bool {.stdcall, importcpp: "SendP2PPacket", dynlib: dynlibsteam_api.}
proc IsP2PPacketAvailable*(this: var ISteamNetworking; pcubMsgSize: ptr uint32; nChannel: cint = 0): bool {.stdcall, importcpp: "IsP2PPacketAvailable", dynlib: dynlibsteam_api.}
proc ReadP2PPacket*(this: var ISteamNetworking; pubDest: pointer; cubDest: uint32; pcubMsgSize: ptr uint32; psteamIDRemote: ptr CSteamID; nChannel: cint = 0): bool {.stdcall, importcpp: "ReadP2PPacket", dynlib: dynlibsteam_api.}
proc AcceptP2PSessionWithUser*(this: var ISteamNetworking; steamIDRemote: CSteamID): bool {. stdcall, importcpp: "AcceptP2PSessionWithUser", dynlib: dynlibsteam_api.}
proc CloseP2PSessionWithUser*(this: var ISteamNetworking; steamIDRemote: CSteamID): bool {. stdcall, importcpp: "CloseP2PSessionWithUser", dynlib: dynlibsteam_api.}
proc CloseP2PChannelWithUser*(this: var ISteamNetworking; steamIDRemote: CSteamID; nChannel: cint): bool {.stdcall, importcpp: "CloseP2PChannelWithUser", dynlib: dynlibsteam_api.}
proc GetP2PSessionState*(this: var ISteamNetworking; steamIDRemote: CSteamID; pConnectionState: ptr P2PSessionState_t): bool {.stdcall, importcpp: "GetP2PSessionState", dynlib: dynlibsteam_api.}
proc AllowP2PPacketRelay*(this: var ISteamNetworking; bAllow: bool): bool {.stdcall, importcpp: "AllowP2PPacketRelay", dynlib: dynlibsteam_api.}
proc CreateListenSocket*(this: var ISteamNetworking; nVirtualP2PPort: cint; nIP: uint32; nPort: uint16; bAllowUseOfPacketRelay: bool): SNetListenSocket_t {. stdcall, importcpp: "CreateListenSocket", dynlib: dynlibsteam_api.}
proc CreateP2PConnectionSocket*(this: var ISteamNetworking; steamIDTarget: CSteamID; nVirtualPort: cint; nTimeoutSec: cint; bAllowUseOfPacketRelay: bool): SNetSocket_t {. stdcall, importcpp: "CreateP2PConnectionSocket", dynlib: dynlibsteam_api.}
proc CreateConnectionSocket*(this: var ISteamNetworking; nIP: uint32; nPort: uint16; nTimeoutSec: cint): SNetSocket_t {.stdcall, importcpp: "CreateConnectionSocket", dynlib: dynlibsteam_api.}
proc DestroySocket*(this: var ISteamNetworking; hSocket: SNetSocket_t; bNotifyRemoteEnd: bool): bool {.stdcall, importcpp: "DestroySocket", dynlib: dynlibsteam_api.}
proc DestroyListenSocket*(this: var ISteamNetworking; hSocket: SNetListenSocket_t; bNotifyRemoteEnd: bool): bool {.stdcall, importcpp: "DestroyListenSocket", dynlib: dynlibsteam_api.}
proc SendDataOnSocket*(this: var ISteamNetworking; hSocket: SNetSocket_t; pubData: pointer; cubData: uint32; bReliable: bool): bool {. stdcall, importcpp: "SendDataOnSocket", dynlib: dynlibsteam_api.}
proc IsDataAvailableOnSocket*(this: var ISteamNetworking; hSocket: SNetSocket_t; pcubMsgSize: ptr uint32): bool {.stdcall, importcpp: "IsDataAvailableOnSocket", dynlib: dynlibsteam_api.}
proc RetrieveDataFromSocket*(this: var ISteamNetworking; hSocket: SNetSocket_t; pubDest: pointer; cubDest: uint32; pcubMsgSize: ptr uint32): bool {.stdcall, importcpp: "RetrieveDataFromSocket", dynlib: dynlibsteam_api.}
proc IsDataAvailable*(this: var ISteamNetworking; hListenSocket: SNetListenSocket_t; pcubMsgSize: ptr uint32; phSocket: ptr SNetSocket_t): bool {. stdcall, importcpp: "IsDataAvailable", dynlib: dynlibsteam_api.}
proc RetrieveData*(this: var ISteamNetworking; hListenSocket: SNetListenSocket_t; pubDest: pointer; cubDest: uint32; pcubMsgSize: ptr uint32; phSocket: ptr SNetSocket_t): bool {.stdcall, importcpp: "RetrieveData", dynlib: dynlibsteam_api.}
proc GetSocketInfo*(this: var ISteamNetworking; hSocket: SNetSocket_t; pSteamIDRemote: ptr CSteamID; peSocketStatus: ptr cint; punIPRemote: ptr uint32; punPortRemote: ptr uint16): bool {.stdcall, importcpp: "GetSocketInfo", dynlib: dynlibsteam_api.}
proc GetListenSocketInfo*(this: var ISteamNetworking; hListenSocket: SNetListenSocket_t; pnIP: ptr uint32; pnPort: ptr uint16): bool {.stdcall, importcpp: "GetListenSocketInfo", dynlib: dynlibsteam_api.}
proc GetSocketConnectionType*(this: var ISteamNetworking; hSocket: SNetSocket_t): ESNetSocketConnectionType {. stdcall, importcpp: "GetSocketConnectionType", dynlib: dynlibsteam_api.}
proc GetMaxPacketSize*(this: var ISteamNetworking; hSocket: SNetSocket_t): cint {. stdcall, importcpp: "GetMaxPacketSize", dynlib: dynlibsteam_api.}
type
  P2PSessionRequest_t* {.bycopy.} = object
    m_steamIDRemote*: CSteamID


const
  k_iCallback* = k_iSteamNetworkingCallbacks + 2

type
  P2PSessionConnectFail_t* {.bycopy.} = object
    m_steamIDRemote*: CSteamID
    m_eP2PSessionError*: uint8


const
  k_iCallback* = k_iSteamNetworkingCallbacks + 3

type
  SocketStatusCallback_t* {.bycopy.} = object
    m_hSocket*: SNetSocket_t
    m_hListenSocket*: SNetListenSocket_t
    m_steamIDRemote*: CSteamID
    m_eSNetSocketState*: cint


const
  k_iCallback* = k_iSteamNetworkingCallbacks + 1

var k_nScreenshotMaxTaggedUsers* {.importcpp: "k_nScreenshotMaxTaggedUsers", dynlib: dynlibsteam_api.}: uint32

var k_nScreenshotMaxTaggedPublishedFiles* {. importcpp: "k_nScreenshotMaxTaggedPublishedFiles", dynlib: dynlibsteam_api.}: uint32

var k_cubUFSTagTypeMax* {.importcpp: "k_cubUFSTagTypeMax", dynlib: dynlibsteam_api.}: cint

var k_cubUFSTagValueMax* {.importcpp: "k_cubUFSTagValueMax", dynlib: dynlibsteam_api.}: cint

var k_ScreenshotThumbWidth* {.importcpp: "k_ScreenshotThumbWidth", dynlib: dynlibsteam_api.}: cint

type
  ScreenshotHandle* = uint32
  EVRScreenshotType* {.size: sizeof(cint).} = enum
    k_EVRScreenshotType_None = 0, k_EVRScreenshotType_Mono = 1, k_EVRScreenshotType_Stereo = 2, k_EVRScreenshotType_MonoCubemap = 3, k_EVRScreenshotType_MonoPanorama = 4, k_EVRScreenshotType_StereoPanorama = 5


type
  ISteamScreenshots* {.bycopy.} = object


proc WriteScreenshot*(this: var ISteamScreenshots; pubRGB: pointer; cubRGB: uint32; nWidth: cint; nHeight: cint): ScreenshotHandle {.stdcall, importcpp: "WriteScreenshot", dynlib: dynlibsteam_api.}
proc AddScreenshotToLibrary*(this: var ISteamScreenshots; pchFilename: cstring; pchThumbnailFilename: cstring; nWidth: cint; nHeight: cint): ScreenshotHandle {.stdcall, importcpp: "AddScreenshotToLibrary", dynlib: dynlibsteam_api.}
proc TriggerScreenshot*(this: var ISteamScreenshots) {.stdcall, importcpp: "TriggerScreenshot", dynlib: dynlibsteam_api.}
proc HookScreenshots*(this: var ISteamScreenshots; bHook: bool) {.stdcall, importcpp: "HookScreenshots", dynlib: dynlibsteam_api.}
proc SetLocation*(this: var ISteamScreenshots; hScreenshot: ScreenshotHandle; pchLocation: cstring): bool {.stdcall, importcpp: "SetLocation", dynlib: dynlibsteam_api.}
proc TagUser*(this: var ISteamScreenshots; hScreenshot: ScreenshotHandle; steamID: CSteamID): bool {.stdcall, importcpp: "TagUser", dynlib: dynlibsteam_api.}
proc TagPublishedFile*(this: var ISteamScreenshots; hScreenshot: ScreenshotHandle; unPublishedFileID: PublishedFileId_t): bool {.stdcall, importcpp: "TagPublishedFile", dynlib: dynlibsteam_api.}
proc IsScreenshotsHooked*(this: var ISteamScreenshots): bool {.stdcall, importcpp: "IsScreenshotsHooked", dynlib: dynlibsteam_api.}
proc AddVRScreenshotToLibrary*(this: var ISteamScreenshots; eType: EVRScreenshotType; pchFilename: cstring; pchVRFilename: cstring): ScreenshotHandle {.stdcall, importcpp: "AddVRScreenshotToLibrary", dynlib: dynlibsteam_api.}
type
  ScreenshotReady_t* {.bycopy.} = object
    m_hLocal*: ScreenshotHandle
    m_eResult*: EResult


const
  k_iCallback* = k_iSteamScreenshotsCallbacks + 1

type
  ScreenshotRequested_t* {.bycopy.} = object


const
  k_iCallback* = k_iSteamScreenshotsCallbacks + 2

type
  AudioPlayback_Status* {.size: sizeof(cint).} = enum
    AudioPlayback_Undefined = 0, AudioPlayback_Playing = 1, AudioPlayback_Paused = 2, AudioPlayback_Idle = 3


type
  ISteamMusic* {.bycopy.} = object


proc BIsEnabled*(this: var ISteamMusic): bool {.stdcall, importcpp: "BIsEnabled", dynlib: dynlibsteam_api.}
proc BIsPlaying*(this: var ISteamMusic): bool {.stdcall, importcpp: "BIsPlaying", dynlib: dynlibsteam_api.}
proc GetPlaybackStatus*(this: var ISteamMusic): AudioPlayback_Status {.stdcall, importcpp: "GetPlaybackStatus", dynlib: dynlibsteam_api.}
proc Play*(this: var ISteamMusic) {.stdcall, importcpp: "Play", dynlib: dynlibsteam_api.}
proc Pause*(this: var ISteamMusic) {.stdcall, importcpp: "Pause", dynlib: dynlibsteam_api.}
proc PlayPrevious*(this: var ISteamMusic) {.stdcall, importcpp: "PlayPrevious", dynlib: dynlibsteam_api.}
proc PlayNext*(this: var ISteamMusic) {.stdcall, importcpp: "PlayNext", dynlib: dynlibsteam_api.}
proc SetVolume*(this: var ISteamMusic; flVolume: cfloat) {.stdcall, importcpp: "SetVolume", dynlib: dynlibsteam_api.}
proc GetVolume*(this: var ISteamMusic): cfloat {.stdcall, importcpp: "GetVolume", dynlib: dynlibsteam_api.}
type
  PlaybackStatusHasChanged_t* {.bycopy.} = object

  SteamCallback_t* = PlaybackStatusHasChanged_t

const
  k_iCallback* = k_iSteamMusicCallbacks + 1

type
  VolumeHasChanged_t* {.bycopy.} = object
    m_flNewVolume*: cfloat

  SteamCallback_t* = VolumeHasChanged_t

const
  k_iCallback* = k_iSteamMusicCallbacks + 2

type
  ISteamMusicRemote* {.bycopy.} = object


proc RegisterSteamMusicRemote*(this: var ISteamMusicRemote; pchName: cstring): bool {. stdcall, importcpp: "RegisterSteamMusicRemote", dynlib: dynlibsteam_api.}
proc DeregisterSteamMusicRemote*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "DeregisterSteamMusicRemote", dynlib: dynlibsteam_api.}
proc BIsCurrentMusicRemote*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "BIsCurrentMusicRemote", dynlib: dynlibsteam_api.}
proc BActivationSuccess*(this: var ISteamMusicRemote; bValue: bool): bool {.stdcall, importcpp: "BActivationSuccess", dynlib: dynlibsteam_api.}
proc SetDisplayName*(this: var ISteamMusicRemote; pchDisplayName: cstring): bool {. stdcall, importcpp: "SetDisplayName", dynlib: dynlibsteam_api.}
proc SetPNGIcon_64x64*(this: var ISteamMusicRemote; pvBuffer: pointer; cbBufferLength: uint32): bool {.stdcall, importcpp: "SetPNGIcon_64x64", dynlib: dynlibsteam_api.}
proc EnablePlayPrevious*(this: var ISteamMusicRemote; bValue: bool): bool {.stdcall, importcpp: "EnablePlayPrevious", dynlib: dynlibsteam_api.}
proc EnablePlayNext*(this: var ISteamMusicRemote; bValue: bool): bool {.stdcall, importcpp: "EnablePlayNext", dynlib: dynlibsteam_api.}
proc EnableShuffled*(this: var ISteamMusicRemote; bValue: bool): bool {.stdcall, importcpp: "EnableShuffled", dynlib: dynlibsteam_api.}
proc EnableLooped*(this: var ISteamMusicRemote; bValue: bool): bool {.stdcall, importcpp: "EnableLooped", dynlib: dynlibsteam_api.}
proc EnableQueue*(this: var ISteamMusicRemote; bValue: bool): bool {.stdcall, importcpp: "EnableQueue", dynlib: dynlibsteam_api.}
proc EnablePlaylists*(this: var ISteamMusicRemote; bValue: bool): bool {.stdcall, importcpp: "EnablePlaylists", dynlib: dynlibsteam_api.}
proc UpdatePlaybackStatus*(this: var ISteamMusicRemote; nStatus: AudioPlayback_Status): bool {.stdcall, importcpp: "UpdatePlaybackStatus", dynlib: dynlibsteam_api.}
proc UpdateShuffled*(this: var ISteamMusicRemote; bValue: bool): bool {.stdcall, importcpp: "UpdateShuffled", dynlib: dynlibsteam_api.}
proc UpdateLooped*(this: var ISteamMusicRemote; bValue: bool): bool {.stdcall, importcpp: "UpdateLooped", dynlib: dynlibsteam_api.}
proc UpdateVolume*(this: var ISteamMusicRemote; flValue: cfloat): bool {.stdcall, importcpp: "UpdateVolume", dynlib: dynlibsteam_api.}
proc CurrentEntryWillChange*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "CurrentEntryWillChange", dynlib: dynlibsteam_api.}
proc CurrentEntryIsAvailable*(this: var ISteamMusicRemote; bAvailable: bool): bool {. stdcall, importcpp: "CurrentEntryIsAvailable", dynlib: dynlibsteam_api.}
proc UpdateCurrentEntryText*(this: var ISteamMusicRemote; pchText: cstring): bool {. stdcall, importcpp: "UpdateCurrentEntryText", dynlib: dynlibsteam_api.}
proc UpdateCurrentEntryElapsedSeconds*(this: var ISteamMusicRemote; nValue: cint): bool {. stdcall, importcpp: "UpdateCurrentEntryElapsedSeconds", dynlib: dynlibsteam_api.}
proc UpdateCurrentEntryCoverArt*(this: var ISteamMusicRemote; pvBuffer: pointer; cbBufferLength: uint32): bool {.stdcall, importcpp: "UpdateCurrentEntryCoverArt", dynlib: dynlibsteam_api.}
proc CurrentEntryDidChange*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "CurrentEntryDidChange", dynlib: dynlibsteam_api.}
proc QueueWillChange*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "QueueWillChange", dynlib: dynlibsteam_api.}
proc ResetQueueEntries*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "ResetQueueEntries", dynlib: dynlibsteam_api.}
proc SetQueueEntry*(this: var ISteamMusicRemote; nID: cint; nPosition: cint; pchEntryText: cstring): bool {.stdcall, importcpp: "SetQueueEntry", dynlib: dynlibsteam_api.}
proc SetCurrentQueueEntry*(this: var ISteamMusicRemote; nID: cint): bool {.stdcall, importcpp: "SetCurrentQueueEntry", dynlib: dynlibsteam_api.}
proc QueueDidChange*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "QueueDidChange", dynlib: dynlibsteam_api.}
proc PlaylistWillChange*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "PlaylistWillChange", dynlib: dynlibsteam_api.}
proc ResetPlaylistEntries*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "ResetPlaylistEntries", dynlib: dynlibsteam_api.}
proc SetPlaylistEntry*(this: var ISteamMusicRemote; nID: cint; nPosition: cint; pchEntryText: cstring): bool {.stdcall, importcpp: "SetPlaylistEntry", dynlib: dynlibsteam_api.}
proc SetCurrentPlaylistEntry*(this: var ISteamMusicRemote; nID: cint): bool {.stdcall, importcpp: "SetCurrentPlaylistEntry", dynlib: dynlibsteam_api.}
proc PlaylistDidChange*(this: var ISteamMusicRemote): bool {.stdcall, importcpp: "PlaylistDidChange", dynlib: dynlibsteam_api.}
type
  MusicPlayerRemoteWillActivate_t* {.bycopy.} = object

  SteamCallback_t* = MusicPlayerRemoteWillActivate_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 1

type
  MusicPlayerRemoteWillDeactivate_t* {.bycopy.} = object

  SteamCallback_t* = MusicPlayerRemoteWillDeactivate_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 2

type
  MusicPlayerRemoteToFront_t* {.bycopy.} = object

  SteamCallback_t* = MusicPlayerRemoteToFront_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 3

type
  MusicPlayerWillQuit_t* {.bycopy.} = object

  SteamCallback_t* = MusicPlayerWillQuit_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 4

type
  MusicPlayerWantsPlay_t* {.bycopy.} = object

  SteamCallback_t* = MusicPlayerWantsPlay_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 5

type
  MusicPlayerWantsPause_t* {.bycopy.} = object

  SteamCallback_t* = MusicPlayerWantsPause_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 6

type
  MusicPlayerWantsPlayPrevious_t* {.bycopy.} = object

  SteamCallback_t* = MusicPlayerWantsPlayPrevious_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 7

type
  MusicPlayerWantsPlayNext_t* {.bycopy.} = object

  SteamCallback_t* = MusicPlayerWantsPlayNext_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 8

type
  MusicPlayerWantsShuffled_t* {.bycopy.} = object
    m_bShuffled*: bool

  SteamCallback_t* = MusicPlayerWantsShuffled_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 9

type
  MusicPlayerWantsLooped_t* {.bycopy.} = object
    m_bLooped*: bool

  SteamCallback_t* = MusicPlayerWantsLooped_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 10

type
  MusicPlayerWantsVolume_t* {.bycopy.} = object
    m_flNewVolume*: cfloat

  SteamCallback_t* = MusicPlayerWantsVolume_t

const
  k_iCallback* = k_iSteamMusicCallbacks + 11

type
  MusicPlayerSelectsQueueEntry_t* {.bycopy.} = object
    nID*: cint

  SteamCallback_t* = MusicPlayerSelectsQueueEntry_t

const
  k_iCallback* = k_iSteamMusicCallbacks + 12

type
  MusicPlayerSelectsPlaylistEntry_t* {.bycopy.} = object
    nID*: cint

  SteamCallback_t* = MusicPlayerSelectsPlaylistEntry_t

const
  k_iCallback* = k_iSteamMusicCallbacks + 13

type
  MusicPlayerWantsPlayingRepeatStatus_t* {.bycopy.} = object
    m_nPlayingRepeatStatus*: cint

  SteamCallback_t* = MusicPlayerWantsPlayingRepeatStatus_t

const
  k_iCallback* = k_iSteamMusicRemoteCallbacks + 14

type
  EHTTPMethod* {.size: sizeof(cint).} = enum
    k_EHTTPMethodInvalid = 0, k_EHTTPMethodGET, k_EHTTPMethodHEAD, k_EHTTPMethodPOST, k_EHTTPMethodPUT, k_EHTTPMethodDELETE, k_EHTTPMethodOPTIONS, k_EHTTPMethodPATCH


type
  EHTTPStatusCode* {.size: sizeof(cint).} = enum
    k_EHTTPStatusCodeInvalid = 0, k_EHTTPStatusCode100Continue = 100, k_EHTTPStatusCode101SwitchingProtocols = 101, k_EHTTPStatusCode200OK = 200, k_EHTTPStatusCode201Created = 201, k_EHTTPStatusCode202Accepted = 202, k_EHTTPStatusCode203NonAuthoritative = 203, k_EHTTPStatusCode204NoContent = 204, k_EHTTPStatusCode205ResetContent = 205, k_EHTTPStatusCode206PartialContent = 206, k_EHTTPStatusCode300MultipleChoices = 300, k_EHTTPStatusCode301MovedPermanently = 301, k_EHTTPStatusCode302Found = 302, k_EHTTPStatusCode303SeeOther = 303, k_EHTTPStatusCode304NotModified = 304, k_EHTTPStatusCode305UseProxy = 305, k_EHTTPStatusCode307TemporaryRedirect = 307, k_EHTTPStatusCode400BadRequest = 400, k_EHTTPStatusCode401Unauthorized = 401, k_EHTTPStatusCode402PaymentRequired = 402, k_EHTTPStatusCode403Forbidden = 403, k_EHTTPStatusCode404NotFound = 404, k_EHTTPStatusCode405MethodNotAllowed = 405, k_EHTTPStatusCode406NotAcceptable = 406, k_EHTTPStatusCode407ProxyAuthRequired = 407, k_EHTTPStatusCode408RequestTimeout = 408, k_EHTTPStatusCode409Conflict = 409, k_EHTTPStatusCode410Gone = 410, k_EHTTPStatusCode411LengthRequired = 411, k_EHTTPStatusCode412PreconditionFailed = 412, k_EHTTPStatusCode413RequestEntityTooLarge = 413, k_EHTTPStatusCode414RequestURITooLong = 414, k_EHTTPStatusCode415UnsupportedMediaType = 415, k_EHTTPStatusCode416RequestedRangeNotSatisfiable = 416, k_EHTTPStatusCode417ExpectationFailed = 417, k_EHTTPStatusCode4xxUnknown = 418, k_EHTTPStatusCode429TooManyRequests = 429, k_EHTTPStatusCode500InternalServerError = 500, k_EHTTPStatusCode501NotImplemented = 501, k_EHTTPStatusCode502BadGateway = 502, k_EHTTPStatusCode503ServiceUnavailable = 503, k_EHTTPStatusCode504GatewayTimeout = 504, k_EHTTPStatusCode505HTTPVersionNotSupported = 505, k_EHTTPStatusCode5xxUnknown = 599


type
  HTTPRequestHandle* = uint32
  HTTPCookieContainerHandle* = uint32
  ISteamHTTP* {.bycopy.} = object


proc CreateHTTPRequest*(this: var ISteamHTTP; eHTTPRequestMethod: EHTTPMethod; pchAbsoluteURL: cstring): HTTPRequestHandle {.stdcall, importcpp: "CreateHTTPRequest", dynlib: dynlibsteam_api.}
proc SetHTTPRequestContextValue*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; ulContextValue: uint64): bool {.stdcall, importcpp: "SetHTTPRequestContextValue", dynlib: dynlibsteam_api.}
proc SetHTTPRequestNetworkActivityTimeout*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; unTimeoutSeconds: uint32): bool {.stdcall, importcpp: "SetHTTPRequestNetworkActivityTimeout", dynlib: dynlibsteam_api.}
proc SetHTTPRequestHeaderValue*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pchHeaderName: cstring; pchHeaderValue: cstring): bool {. stdcall, importcpp: "SetHTTPRequestHeaderValue", dynlib: dynlibsteam_api.}
proc SetHTTPRequestGetOrPostParameter*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pchParamName: cstring; pchParamValue: cstring): bool {.stdcall, importcpp: "SetHTTPRequestGetOrPostParameter", dynlib: dynlibsteam_api.}
proc SendHTTPRequest*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pCallHandle: ptr SteamAPICall_t): bool {.stdcall, importcpp: "SendHTTPRequest", dynlib: dynlibsteam_api.}
proc SendHTTPRequestAndStreamResponse*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pCallHandle: ptr SteamAPICall_t): bool {. stdcall, importcpp: "SendHTTPRequestAndStreamResponse", dynlib: dynlibsteam_api.}
proc DeferHTTPRequest*(this: var ISteamHTTP; hRequest: HTTPRequestHandle): bool {. stdcall, importcpp: "DeferHTTPRequest", dynlib: dynlibsteam_api.}
proc PrioritizeHTTPRequest*(this: var ISteamHTTP; hRequest: HTTPRequestHandle): bool {. stdcall, importcpp: "PrioritizeHTTPRequest", dynlib: dynlibsteam_api.}
proc GetHTTPResponseHeaderSize*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pchHeaderName: cstring; unResponseHeaderSize: ptr uint32): bool {.stdcall, importcpp: "GetHTTPResponseHeaderSize", dynlib: dynlibsteam_api.}
proc GetHTTPResponseHeaderValue*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pchHeaderName: cstring; pHeaderValueBuffer: ptr uint8; unBufferSize: uint32): bool {. stdcall, importcpp: "GetHTTPResponseHeaderValue", dynlib: dynlibsteam_api.}
proc GetHTTPResponseBodySize*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; unBodySize: ptr uint32): bool {.stdcall, importcpp: "GetHTTPResponseBodySize", dynlib: dynlibsteam_api.}
proc GetHTTPResponseBodyData*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pBodyDataBuffer: ptr uint8; unBufferSize: uint32): bool {. stdcall, importcpp: "GetHTTPResponseBodyData", dynlib: dynlibsteam_api.}
proc GetHTTPStreamingResponseBodyData*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; cOffset: uint32; pBodyDataBuffer: ptr uint8; unBufferSize: uint32): bool {.stdcall, importcpp: "GetHTTPStreamingResponseBodyData", dynlib: dynlibsteam_api.}
proc ReleaseHTTPRequest*(this: var ISteamHTTP; hRequest: HTTPRequestHandle): bool {. stdcall, importcpp: "ReleaseHTTPRequest", dynlib: dynlibsteam_api.}
proc GetHTTPDownloadProgressPct*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pflPercentOut: ptr cfloat): bool {.stdcall, importcpp: "GetHTTPDownloadProgressPct", dynlib: dynlibsteam_api.}
proc SetHTTPRequestRawPostBody*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pchContentType: cstring; pubBody: ptr uint8; unBodyLen: uint32): bool {.stdcall, importcpp: "SetHTTPRequestRawPostBody", dynlib: dynlibsteam_api.}
proc CreateCookieContainer*(this: var ISteamHTTP; bAllowResponsesToModify: bool): HTTPCookieContainerHandle {. stdcall, importcpp: "CreateCookieContainer", dynlib: dynlibsteam_api.}
proc ReleaseCookieContainer*(this: var ISteamHTTP; hCookieContainer: HTTPCookieContainerHandle): bool {. stdcall, importcpp: "ReleaseCookieContainer", dynlib: dynlibsteam_api.}
proc SetCookie*(this: var ISteamHTTP; hCookieContainer: HTTPCookieContainerHandle; pchHost: cstring; pchUrl: cstring; pchCookie: cstring): bool {.stdcall, importcpp: "SetCookie", dynlib: dynlibsteam_api.}
proc SetHTTPRequestCookieContainer*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; hCookieContainer: HTTPCookieContainerHandle): bool {. stdcall, importcpp: "SetHTTPRequestCookieContainer", dynlib: dynlibsteam_api.}
proc SetHTTPRequestUserAgentInfo*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pchUserAgentInfo: cstring): bool {.stdcall, importcpp: "SetHTTPRequestUserAgentInfo", dynlib: dynlibsteam_api.}
proc SetHTTPRequestRequiresVerifiedCertificate*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; bRequireVerifiedCertificate: bool): bool {.stdcall, importcpp: "SetHTTPRequestRequiresVerifiedCertificate", dynlib: dynlibsteam_api.}
proc SetHTTPRequestAbsoluteTimeoutMS*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; unMilliseconds: uint32): bool {.stdcall, importcpp: "SetHTTPRequestAbsoluteTimeoutMS", dynlib: dynlibsteam_api.}
proc GetHTTPRequestWasTimedOut*(this: var ISteamHTTP; hRequest: HTTPRequestHandle; pbWasTimedOut: ptr bool): bool {.stdcall, importcpp: "GetHTTPRequestWasTimedOut", dynlib: dynlibsteam_api.}
type
  HTTPRequestCompleted_t* {.bycopy.} = object
    m_hRequest*: HTTPRequestHandle
    m_ulContextValue*: uint64
    m_bRequestSuccessful*: bool
    m_eStatusCode*: EHTTPStatusCode
    m_unBodySize*: uint32


const
  k_iCallback* = k_iClientHTTPCallbacks + 1

type
  HTTPRequestHeadersReceived_t* {.bycopy.} = object
    m_hRequest*: HTTPRequestHandle
    m_ulContextValue*: uint64


const
  k_iCallback* = k_iClientHTTPCallbacks + 2

type
  HTTPRequestDataReceived_t* {.bycopy.} = object
    m_hRequest*: HTTPRequestHandle
    m_ulContextValue*: uint64
    m_cOffset*: uint32
    m_cBytesReceived*: uint32


const
  k_iCallback* = k_iClientHTTPCallbacks + 3

type
  ESteamControllerPad* {.size: sizeof(cint).} = enum
    k_ESteamControllerPad_Left, k_ESteamControllerPad_Right


type
  EControllerSource* {.size: sizeof(cint).} = enum
    k_EControllerSource_None, k_EControllerSource_LeftTrackpad, k_EControllerSource_RightTrackpad, k_EControllerSource_Joystick, k_EControllerSource_ABXY, k_EControllerSource_Switch, k_EControllerSource_LeftTrigger, k_EControllerSource_RightTrigger, k_EControllerSource_Gyro, k_EControllerSource_CenterTrackpad, k_EControllerSource_RightJoystick, k_EControllerSource_DPad, k_EControllerSource_Key, k_EControllerSource_Mouse, k_EControllerSource_Count


type
  EControllerSourceMode* {.size: sizeof(cint).} = enum
    k_EControllerSourceMode_None, k_EControllerSourceMode_Dpad, k_EControllerSourceMode_Buttons, k_EControllerSourceMode_FourButtons, k_EControllerSourceMode_AbsoluteMouse, k_EControllerSourceMode_RelativeMouse, k_EControllerSourceMode_JoystickMove, k_EControllerSourceMode_JoystickMouse, k_EControllerSourceMode_JoystickCamera, k_EControllerSourceMode_ScrollWheel, k_EControllerSourceMode_Trigger, k_EControllerSourceMode_TouchMenu, k_EControllerSourceMode_MouseJoystick, k_EControllerSourceMode_MouseRegion, k_EControllerSourceMode_RadialMenu, k_EControllerSourceMode_SingleButton, k_EControllerSourceMode_Switches


type
  EControllerActionOrigin* {.size: sizeof(cint).} = enum
    k_EControllerActionOrigin_None, k_EControllerActionOrigin_A, k_EControllerActionOrigin_B, k_EControllerActionOrigin_X, k_EControllerActionOrigin_Y, k_EControllerActionOrigin_LeftBumper, k_EControllerActionOrigin_RightBumper, k_EControllerActionOrigin_LeftGrip, k_EControllerActionOrigin_RightGrip, k_EControllerActionOrigin_Start, k_EControllerActionOrigin_Back, k_EControllerActionOrigin_LeftPad_Touch, k_EControllerActionOrigin_LeftPad_Swipe, k_EControllerActionOrigin_LeftPad_Click, k_EControllerActionOrigin_LeftPad_DPadNorth, k_EControllerActionOrigin_LeftPad_DPadSouth, k_EControllerActionOrigin_LeftPad_DPadWest, k_EControllerActionOrigin_LeftPad_DPadEast, k_EControllerActionOrigin_RightPad_Touch, k_EControllerActionOrigin_RightPad_Swipe, k_EControllerActionOrigin_RightPad_Click, k_EControllerActionOrigin_RightPad_DPadNorth, k_EControllerActionOrigin_RightPad_DPadSouth, k_EControllerActionOrigin_RightPad_DPadWest, k_EControllerActionOrigin_RightPad_DPadEast, k_EControllerActionOrigin_LeftTrigger_Pull, k_EControllerActionOrigin_LeftTrigger_Click, k_EControllerActionOrigin_RightTrigger_Pull, k_EControllerActionOrigin_RightTrigger_Click, k_EControllerActionOrigin_LeftStick_Move, k_EControllerActionOrigin_LeftStick_Click, k_EControllerActionOrigin_LeftStick_DPadNorth, k_EControllerActionOrigin_LeftStick_DPadSouth, k_EControllerActionOrigin_LeftStick_DPadWest, k_EControllerActionOrigin_LeftStick_DPadEast, k_EControllerActionOrigin_Gyro_Move, k_EControllerActionOrigin_Gyro_Pitch, k_EControllerActionOrigin_Gyro_Yaw, k_EControllerActionOrigin_Gyro_Roll, k_EControllerActionOrigin_PS4_X, k_EControllerActionOrigin_PS4_Circle, k_EControllerActionOrigin_PS4_Triangle, k_EControllerActionOrigin_PS4_Square, k_EControllerActionOrigin_PS4_LeftBumper, k_EControllerActionOrigin_PS4_RightBumper, k_EControllerActionOrigin_PS4_Options, k_EControllerActionOrigin_PS4_Share, k_EControllerActionOrigin_PS4_LeftPad_Touch, k_EControllerActionOrigin_PS4_LeftPad_Swipe, k_EControllerActionOrigin_PS4_LeftPad_Click, k_EControllerActionOrigin_PS4_LeftPad_DPadNorth, k_EControllerActionOrigin_PS4_LeftPad_DPadSouth, k_EControllerActionOrigin_PS4_LeftPad_DPadWest, k_EControllerActionOrigin_PS4_LeftPad_DPadEast, k_EControllerActionOrigin_PS4_RightPad_Touch, k_EControllerActionOrigin_PS4_RightPad_Swipe, k_EControllerActionOrigin_PS4_RightPad_Click, k_EControllerActionOrigin_PS4_RightPad_DPadNorth, k_EControllerActionOrigin_PS4_RightPad_DPadSouth, k_EControllerActionOrigin_PS4_RightPad_DPadWest, k_EControllerActionOrigin_PS4_RightPad_DPadEast, k_EControllerActionOrigin_PS4_CenterPad_Touch, k_EControllerActionOrigin_PS4_CenterPad_Swipe, k_EControllerActionOrigin_PS4_CenterPad_Click, k_EControllerActionOrigin_PS4_CenterPad_DPadNorth, k_EControllerActionOrigin_PS4_CenterPad_DPadSouth, k_EControllerActionOrigin_PS4_CenterPad_DPadWest, k_EControllerActionOrigin_PS4_CenterPad_DPadEast, k_EControllerActionOrigin_PS4_LeftTrigger_Pull, k_EControllerActionOrigin_PS4_LeftTrigger_Click, k_EControllerActionOrigin_PS4_RightTrigger_Pull, k_EControllerActionOrigin_PS4_RightTrigger_Click, k_EControllerActionOrigin_PS4_LeftStick_Move, k_EControllerActionOrigin_PS4_LeftStick_Click, k_EControllerActionOrigin_PS4_LeftStick_DPadNorth, k_EControllerActionOrigin_PS4_LeftStick_DPadSouth, k_EControllerActionOrigin_PS4_LeftStick_DPadWest, k_EControllerActionOrigin_PS4_LeftStick_DPadEast, k_EControllerActionOrigin_PS4_RightStick_Move, k_EControllerActionOrigin_PS4_RightStick_Click, k_EControllerActionOrigin_PS4_RightStick_DPadNorth, k_EControllerActionOrigin_PS4_RightStick_DPadSouth, k_EControllerActionOrigin_PS4_RightStick_DPadWest, k_EControllerActionOrigin_PS4_RightStick_DPadEast, k_EControllerActionOrigin_PS4_DPad_North, k_EControllerActionOrigin_PS4_DPad_South, k_EControllerActionOrigin_PS4_DPad_West, k_EControllerActionOrigin_PS4_DPad_East, k_EControllerActionOrigin_PS4_Gyro_Move, k_EControllerActionOrigin_PS4_Gyro_Pitch, k_EControllerActionOrigin_PS4_Gyro_Yaw, k_EControllerActionOrigin_PS4_Gyro_Roll, k_EControllerActionOrigin_XBoxOne_A, k_EControllerActionOrigin_XBoxOne_B, k_EControllerActionOrigin_XBoxOne_X, k_EControllerActionOrigin_XBoxOne_Y, k_EControllerActionOrigin_XBoxOne_LeftBumper, k_EControllerActionOrigin_XBoxOne_RightBumper, k_EControllerActionOrigin_XBoxOne_Menu, k_EControllerActionOrigin_XBoxOne_View, k_EControllerActionOrigin_XBoxOne_LeftTrigger_Pull, k_EControllerActionOrigin_XBoxOne_LeftTrigger_Click, k_EControllerActionOrigin_XBoxOne_RightTrigger_Pull, k_EControllerActionOrigin_XBoxOne_RightTrigger_Click, k_EControllerActionOrigin_XBoxOne_LeftStick_Move, k_EControllerActionOrigin_XBoxOne_LeftStick_Click, k_EControllerActionOrigin_XBoxOne_LeftStick_DPadNorth, k_EControllerActionOrigin_XBoxOne_LeftStick_DPadSouth, k_EControllerActionOrigin_XBoxOne_LeftStick_DPadWest, k_EControllerActionOrigin_XBoxOne_LeftStick_DPadEast, k_EControllerActionOrigin_XBoxOne_RightStick_Move, k_EControllerActionOrigin_XBoxOne_RightStick_Click, k_EControllerActionOrigin_XBoxOne_RightStick_DPadNorth, k_EControllerActionOrigin_XBoxOne_RightStick_DPadSouth, k_EControllerActionOrigin_XBoxOne_RightStick_DPadWest, k_EControllerActionOrigin_XBoxOne_RightStick_DPadEast, k_EControllerActionOrigin_XBoxOne_DPad_North, k_EControllerActionOrigin_XBoxOne_DPad_South, k_EControllerActionOrigin_XBoxOne_DPad_West, k_EControllerActionOrigin_XBoxOne_DPad_East, k_EControllerActionOrigin_XBox360_A, k_EControllerActionOrigin_XBox360_B, k_EControllerActionOrigin_XBox360_X, k_EControllerActionOrigin_XBox360_Y, k_EControllerActionOrigin_XBox360_LeftBumper, k_EControllerActionOrigin_XBox360_RightBumper, k_EControllerActionOrigin_XBox360_Start, k_EControllerActionOrigin_XBox360_Back, k_EControllerActionOrigin_XBox360_LeftTrigger_Pull, k_EControllerActionOrigin_XBox360_LeftTrigger_Click, k_EControllerActionOrigin_XBox360_RightTrigger_Pull, k_EControllerActionOrigin_XBox360_RightTrigger_Click, k_EControllerActionOrigin_XBox360_LeftStick_Move, k_EControllerActionOrigin_XBox360_LeftStick_Click, k_EControllerActionOrigin_XBox360_LeftStick_DPadNorth, k_EControllerActionOrigin_XBox360_LeftStick_DPadSouth, k_EControllerActionOrigin_XBox360_LeftStick_DPadWest, k_EControllerActionOrigin_XBox360_LeftStick_DPadEast, k_EControllerActionOrigin_XBox360_RightStick_Move, k_EControllerActionOrigin_XBox360_RightStick_Click, k_EControllerActionOrigin_XBox360_RightStick_DPadNorth, k_EControllerActionOrigin_XBox360_RightStick_DPadSouth, k_EControllerActionOrigin_XBox360_RightStick_DPadWest, k_EControllerActionOrigin_XBox360_RightStick_DPadEast, k_EControllerActionOrigin_XBox360_DPad_North, k_EControllerActionOrigin_XBox360_DPad_South, k_EControllerActionOrigin_XBox360_DPad_West, k_EControllerActionOrigin_XBox360_DPad_East, k_EControllerActionOrigin_SteamV2_A, k_EControllerActionOrigin_SteamV2_B, k_EControllerActionOrigin_SteamV2_X, k_EControllerActionOrigin_SteamV2_Y, k_EControllerActionOrigin_SteamV2_LeftBumper, k_EControllerActionOrigin_SteamV2_RightBumper, k_EControllerActionOrigin_SteamV2_LeftGrip, k_EControllerActionOrigin_SteamV2_RightGrip, k_EControllerActionOrigin_SteamV2_LeftGrip_Upper, k_EControllerActionOrigin_SteamV2_RightGrip_Upper, k_EControllerActionOrigin_SteamV2_LeftBumper_Pressure, k_EControllerActionOrigin_SteamV2_RightBumper_Pressure, k_EControllerActionOrigin_SteamV2_LeftGrip_Pressure, k_EControllerActionOrigin_SteamV2_RightGrip_Pressure, k_EControllerActionOrigin_SteamV2_LeftGrip_Upper_Pressure, k_EControllerActionOrigin_SteamV2_RightGrip_Upper_Pressure, k_EControllerActionOrigin_SteamV2_Start, k_EControllerActionOrigin_SteamV2_Back, k_EControllerActionOrigin_SteamV2_LeftPad_Touch, k_EControllerActionOrigin_SteamV2_LeftPad_Swipe, k_EControllerActionOrigin_SteamV2_LeftPad_Click, k_EControllerActionOrigin_SteamV2_LeftPad_Pressure, k_EControllerActionOrigin_SteamV2_LeftPad_DPadNorth, k_EControllerActionOrigin_SteamV2_LeftPad_DPadSouth, k_EControllerActionOrigin_SteamV2_LeftPad_DPadWest, k_EControllerActionOrigin_SteamV2_LeftPad_DPadEast, k_EControllerActionOrigin_SteamV2_RightPad_Touch, k_EControllerActionOrigin_SteamV2_RightPad_Swipe, k_EControllerActionOrigin_SteamV2_RightPad_Click, k_EControllerActionOrigin_SteamV2_RightPad_Pressure, k_EControllerActionOrigin_SteamV2_RightPad_DPadNorth, k_EControllerActionOrigin_SteamV2_RightPad_DPadSouth, k_EControllerActionOrigin_SteamV2_RightPad_DPadWest, k_EControllerActionOrigin_SteamV2_RightPad_DPadEast, k_EControllerActionOrigin_SteamV2_LeftTrigger_Pull, k_EControllerActionOrigin_SteamV2_LeftTrigger_Click, k_EControllerActionOrigin_SteamV2_RightTrigger_Pull, k_EControllerActionOrigin_SteamV2_RightTrigger_Click, k_EControllerActionOrigin_SteamV2_LeftStick_Move, k_EControllerActionOrigin_SteamV2_LeftStick_Click, k_EControllerActionOrigin_SteamV2_LeftStick_DPadNorth, k_EControllerActionOrigin_SteamV2_LeftStick_DPadSouth, k_EControllerActionOrigin_SteamV2_LeftStick_DPadWest, k_EControllerActionOrigin_SteamV2_LeftStick_DPadEast, k_EControllerActionOrigin_SteamV2_Gyro_Move, k_EControllerActionOrigin_SteamV2_Gyro_Pitch, k_EControllerActionOrigin_SteamV2_Gyro_Yaw, k_EControllerActionOrigin_SteamV2_Gyro_Roll, k_EControllerActionOrigin_Count


type
  ESteamControllerLEDFlag* {.size: sizeof(cint).} = enum
    k_ESteamControllerLEDFlag_SetColor, k_ESteamControllerLEDFlag_RestoreUserDefault


type
  ESteamInputType* {.size: sizeof(cint).} = enum
    k_ESteamInputType_Unknown, k_ESteamInputType_SteamController, k_ESteamInputType_XBox360Controller, k_ESteamInputType_XBoxOneController, k_ESteamInputType_GenericXInput, k_ESteamInputType_PS4Controller


type
  ControllerHandle_t* = uint64
  ControllerActionSetHandle_t* = uint64
  ControllerDigitalActionHandle_t* = uint64
  ControllerAnalogActionHandle_t* = uint64
  ControllerAnalogActionData_t* {.bycopy.} = object
    eMode*: EControllerSourceMode
    x*: cfloat
    y*: cfloat
    bActive*: bool

  ControllerDigitalActionData_t* {.bycopy.} = object
    bState*: bool
    bActive*: bool

  ControllerMotionData_t* {.bycopy.} = object
    rotQuatX*: cfloat
    rotQuatY*: cfloat
    rotQuatZ*: cfloat
    rotQuatW*: cfloat
    posAccelX*: cfloat
    posAccelY*: cfloat
    posAccelZ*: cfloat
    rotVelX*: cfloat
    rotVelY*: cfloat
    rotVelZ*: cfloat

  ISteamController* {.bycopy.} = object


proc Init*(this: var ISteamController): bool {.stdcall, importcpp: "Init", dynlib: dynlibsteam_api.}
proc Shutdown*(this: var ISteamController): bool {.stdcall, importcpp: "Shutdown", dynlib: dynlibsteam_api.}
proc RunFrame*(this: var ISteamController) {.stdcall, importcpp: "RunFrame", dynlib: dynlibsteam_api.}
proc GetConnectedControllers*(this: var ISteamController; handlesOut: ptr ControllerHandle_t): cint {.stdcall, importcpp: "GetConnectedControllers", dynlib: dynlibsteam_api.}
proc ShowBindingPanel*(this: var ISteamController; controllerHandle: ControllerHandle_t): bool {.stdcall, importcpp: "ShowBindingPanel", dynlib: dynlibsteam_api.}
proc GetActionSetHandle*(this: var ISteamController; pszActionSetName: cstring): ControllerActionSetHandle_t {. stdcall, importcpp: "GetActionSetHandle", dynlib: dynlibsteam_api.}
proc ActivateActionSet*(this: var ISteamController; controllerHandle: ControllerHandle_t; actionSetHandle: ControllerActionSetHandle_t) {.stdcall, importcpp: "ActivateActionSet", dynlib: dynlibsteam_api.}
proc GetCurrentActionSet*(this: var ISteamController; controllerHandle: ControllerHandle_t): ControllerActionSetHandle_t {. stdcall, importcpp: "GetCurrentActionSet", dynlib: dynlibsteam_api.}
proc ActivateActionSetLayer*(this: var ISteamController; controllerHandle: ControllerHandle_t; actionSetLayerHandle: ControllerActionSetHandle_t) {. stdcall, importcpp: "ActivateActionSetLayer", dynlib: dynlibsteam_api.}
proc DeactivateActionSetLayer*(this: var ISteamController; controllerHandle: ControllerHandle_t; actionSetLayerHandle: ControllerActionSetHandle_t) {. stdcall, importcpp: "DeactivateActionSetLayer", dynlib: dynlibsteam_api.}
proc DeactivateAllActionSetLayers*(this: var ISteamController; controllerHandle: ControllerHandle_t) {.stdcall, importcpp: "DeactivateAllActionSetLayers", dynlib: dynlibsteam_api.}
proc GetActiveActionSetLayers*(this: var ISteamController; controllerHandle: ControllerHandle_t; handlesOut: ptr ControllerActionSetHandle_t): cint {. stdcall, importcpp: "GetActiveActionSetLayers", dynlib: dynlibsteam_api.}
proc GetDigitalActionHandle*(this: var ISteamController; pszActionName: cstring): ControllerDigitalActionHandle_t {. stdcall, importcpp: "GetDigitalActionHandle", dynlib: dynlibsteam_api.}
proc GetDigitalActionData*(this: var ISteamController; controllerHandle: ControllerHandle_t; digitalActionHandle: ControllerDigitalActionHandle_t): ControllerDigitalActionData_t {. stdcall, importcpp: "GetDigitalActionData", dynlib: dynlibsteam_api.}
proc GetDigitalActionOrigins*(this: var ISteamController; controllerHandle: ControllerHandle_t; actionSetHandle: ControllerActionSetHandle_t; digitalActionHandle: ControllerDigitalActionHandle_t; originsOut: ptr EControllerActionOrigin): cint {. stdcall, importcpp: "GetDigitalActionOrigins", dynlib: dynlibsteam_api.}
proc GetAnalogActionHandle*(this: var ISteamController; pszActionName: cstring): ControllerAnalogActionHandle_t {. stdcall, importcpp: "GetAnalogActionHandle", dynlib: dynlibsteam_api.}
proc GetAnalogActionData*(this: var ISteamController; controllerHandle: ControllerHandle_t; analogActionHandle: ControllerAnalogActionHandle_t): ControllerAnalogActionData_t {. stdcall, importcpp: "GetAnalogActionData", dynlib: dynlibsteam_api.}
proc GetAnalogActionOrigins*(this: var ISteamController; controllerHandle: ControllerHandle_t; actionSetHandle: ControllerActionSetHandle_t; analogActionHandle: ControllerAnalogActionHandle_t; originsOut: ptr EControllerActionOrigin): cint {. stdcall, importcpp: "GetAnalogActionOrigins", dynlib: dynlibsteam_api.}
proc StopAnalogActionMomentum*(this: var ISteamController; controllerHandle: ControllerHandle_t; eAction: ControllerAnalogActionHandle_t) {.stdcall, importcpp: "StopAnalogActionMomentum", dynlib: dynlibsteam_api.}
proc TriggerHapticPulse*(this: var ISteamController; controllerHandle: ControllerHandle_t; eTargetPad: ESteamControllerPad; usDurationMicroSec: cushort) {.stdcall, importcpp: "TriggerHapticPulse", dynlib: dynlibsteam_api.}
proc TriggerRepeatedHapticPulse*(this: var ISteamController; controllerHandle: ControllerHandle_t; eTargetPad: ESteamControllerPad; usDurationMicroSec: cushort; usOffMicroSec: cushort; unRepeat: cushort; nFlags: cuint) {.stdcall, importcpp: "TriggerRepeatedHapticPulse", dynlib: dynlibsteam_api.}
proc TriggerVibration*(this: var ISteamController; controllerHandle: ControllerHandle_t; usLeftSpeed: cushort; usRightSpeed: cushort) {.stdcall, importcpp: "TriggerVibration", dynlib: dynlibsteam_api.}
proc SetLEDColor*(this: var ISteamController; controllerHandle: ControllerHandle_t; nColorR: uint8; nColorG: uint8; nColorB: uint8; nFlags: cuint) {. stdcall, importcpp: "SetLEDColor", dynlib: dynlibsteam_api.}
proc GetGamepadIndexForController*(this: var ISteamController; ulControllerHandle: ControllerHandle_t): cint {. stdcall, importcpp: "GetGamepadIndexForController", dynlib: dynlibsteam_api.}
proc GetControllerForGamepadIndex*(this: var ISteamController; nIndex: cint): ControllerHandle_t {. stdcall, importcpp: "GetControllerForGamepadIndex", dynlib: dynlibsteam_api.}
proc GetMotionData*(this: var ISteamController; controllerHandle: ControllerHandle_t): ControllerMotionData_t {. stdcall, importcpp: "GetMotionData", dynlib: dynlibsteam_api.}
proc ShowDigitalActionOrigins*(this: var ISteamController; controllerHandle: ControllerHandle_t; digitalActionHandle: ControllerDigitalActionHandle_t; flScale: cfloat; flXPosition: cfloat; flYPosition: cfloat): bool {. stdcall, importcpp: "ShowDigitalActionOrigins", dynlib: dynlibsteam_api.}
proc ShowAnalogActionOrigins*(this: var ISteamController; controllerHandle: ControllerHandle_t; analogActionHandle: ControllerAnalogActionHandle_t; flScale: cfloat; flXPosition: cfloat; flYPosition: cfloat): bool {. stdcall, importcpp: "ShowAnalogActionOrigins", dynlib: dynlibsteam_api.}
proc GetStringForActionOrigin*(this: var ISteamController; eOrigin: EControllerActionOrigin): cstring {.stdcall, importcpp: "GetStringForActionOrigin", dynlib: dynlibsteam_api.}
proc GetGlyphForActionOrigin*(this: var ISteamController; eOrigin: EControllerActionOrigin): cstring {.stdcall, importcpp: "GetGlyphForActionOrigin", dynlib: dynlibsteam_api.}
proc GetInputTypeForHandle*(this: var ISteamController; controllerHandle: ControllerHandle_t): ESteamInputType {. stdcall, importcpp: "GetInputTypeForHandle", dynlib: dynlibsteam_api.}
type
  UGCQueryHandle_t* = uint64
  UGCUpdateHandle_t* = uint64

var k_UGCQueryHandleInvalid* {.importcpp: "k_UGCQueryHandleInvalid", dynlib: dynlibsteam_api.}: UGCQueryHandle_t

var k_UGCUpdateHandleInvalid* {.importcpp: "k_UGCUpdateHandleInvalid", dynlib: dynlibsteam_api.}: UGCUpdateHandle_t

type
  EUGCMatchingUGCType* {.size: sizeof(cint).} = enum
    k_EUGCMatchingUGCType_Items = 0, k_EUGCMatchingUGCType_Items_Mtx = 1, k_EUGCMatchingUGCType_Items_ReadyToUse = 2, k_EUGCMatchingUGCType_Collections = 3, k_EUGCMatchingUGCType_Artwork = 4, k_EUGCMatchingUGCType_Videos = 5, k_EUGCMatchingUGCType_Screenshots = 6, k_EUGCMatchingUGCType_AllGuides = 7, k_EUGCMatchingUGCType_WebGuides = 8, k_EUGCMatchingUGCType_IntegratedGuides = 9, k_EUGCMatchingUGCType_UsableInGame = 10, k_EUGCMatchingUGCType_ControllerBindings = 11, k_EUGCMatchingUGCType_GameManagedItems = 12, k_EUGCMatchingUGCType_All = not 0


type
  EUserUGCList* {.size: sizeof(cint).} = enum
    k_EUserUGCList_Published, k_EUserUGCList_VotedOn, k_EUserUGCList_VotedUp, k_EUserUGCList_VotedDown, k_EUserUGCList_WillVoteLater, k_EUserUGCList_Favorited, k_EUserUGCList_Subscribed, k_EUserUGCList_UsedOrPlayed, k_EUserUGCList_Followed


type
  EUserUGCListSortOrder* {.size: sizeof(cint).} = enum
    k_EUserUGCListSortOrder_CreationOrderDesc, k_EUserUGCListSortOrder_CreationOrderAsc, k_EUserUGCListSortOrder_TitleAsc, k_EUserUGCListSortOrder_LastUpdatedDesc, k_EUserUGCListSortOrder_SubscriptionDateDesc, k_EUserUGCListSortOrder_VoteScoreDesc, k_EUserUGCListSortOrder_ForModeration


type
  EUGCQuery* {.size: sizeof(cint).} = enum
    k_EUGCQuery_RankedByVote = 0, k_EUGCQuery_RankedByPublicationDate = 1, k_EUGCQuery_AcceptedForGameRankedByAcceptanceDate = 2, k_EUGCQuery_RankedByTrend = 3, k_EUGCQuery_FavoritedByFriendsRankedByPublicationDate = 4, k_EUGCQuery_CreatedByFriendsRankedByPublicationDate = 5, k_EUGCQuery_RankedByNumTimesReported = 6, k_EUGCQuery_CreatedByFollowedUsersRankedByPublicationDate = 7, k_EUGCQuery_NotYetRated = 8, k_EUGCQuery_RankedByTotalVotesAsc = 9, k_EUGCQuery_RankedByVotesUp = 10, k_EUGCQuery_RankedByTextSearch = 11, k_EUGCQuery_RankedByTotalUniqueSubscriptions = 12, k_EUGCQuery_RankedByPlaytimeTrend = 13, k_EUGCQuery_RankedByTotalPlaytime = 14, k_EUGCQuery_RankedByAveragePlaytimeTrend = 15, k_EUGCQuery_RankedByLifetimeAveragePlaytime = 16, k_EUGCQuery_RankedByPlaytimeSessionsTrend = 17, k_EUGCQuery_RankedByLifetimePlaytimeSessions = 18


type
  EItemUpdateStatus* {.size: sizeof(cint).} = enum
    k_EItemUpdateStatusInvalid = 0, k_EItemUpdateStatusPreparingConfig = 1, k_EItemUpdateStatusPreparingContent = 2, k_EItemUpdateStatusUploadingContent = 3, k_EItemUpdateStatusUploadingPreviewFile = 4, k_EItemUpdateStatusCommittingChanges = 5


type
  EItemState* {.size: sizeof(cint).} = enum
    k_EItemStateNone = 0, k_EItemStateSubscribed = 1, k_EItemStateLegacyItem = 2, k_EItemStateInstalled = 4, k_EItemStateNeedsUpdate = 8, k_EItemStateDownloading = 16, k_EItemStateDownloadPending = 32


type
  EItemStatistic* {.size: sizeof(cint).} = enum
    k_EItemStatistic_NumSubscriptions = 0, k_EItemStatistic_NumFavorites = 1, k_EItemStatistic_NumFollowers = 2, k_EItemStatistic_NumUniqueSubscriptions = 3, k_EItemStatistic_NumUniqueFavorites = 4, k_EItemStatistic_NumUniqueFollowers = 5, k_EItemStatistic_NumUniqueWebsiteViews = 6, k_EItemStatistic_ReportScore = 7, k_EItemStatistic_NumSecondsPlayed = 8, k_EItemStatistic_NumPlaytimeSessions = 9, k_EItemStatistic_NumComments = 10, k_EItemStatistic_NumSecondsPlayedDuringTimePeriod = 11, k_EItemStatistic_NumPlaytimeSessionsDuringTimePeriod = 12


type
  EItemPreviewType* {.size: sizeof(cint).} = enum
    k_EItemPreviewType_Image = 0, k_EItemPreviewType_YouTubeVideo = 1, k_EItemPreviewType_Sketchfab = 2, k_EItemPreviewType_EnvironmentMap_HorizontalCross = 3, k_EItemPreviewType_EnvironmentMap_LatLong = 4, k_EItemPreviewType_ReservedMax = 255


var kNumUGCResultsPerPage* {.importcpp: "kNumUGCResultsPerPage", dynlib: dynlibsteam_api.}: uint32

var k_cchDeveloperMetadataMax* {.importcpp: "k_cchDeveloperMetadataMax", dynlib: dynlibsteam_api.}: uint32

type
  SteamUGCDetails_t* {.bycopy.} = object
    m_nPublishedFileId*: PublishedFileId_t
    m_eResult*: EResult
    m_eFileType*: EWorkshopFileType
    m_nCreatorAppID*: AppId_t
    m_nConsumerAppID*: AppId_t
    m_rgchTitle*: array[k_cchPublishedDocumentTitleMax, char]
    m_rgchDescription*: array[k_cchPublishedDocumentDescriptionMax, char]
    m_ulSteamIDOwner*: uint64
    m_rtimeCreated*: uint32
    m_rtimeUpdated*: uint32
    m_rtimeAddedToUserList*: uint32
    m_eVisibility*: ERemoteStoragePublishedFileVisibility
    m_bBanned*: bool
    m_bAcceptedForUse*: bool
    m_bTagsTruncated*: bool
    m_rgchTags*: array[k_cchTagListMax, char]
    m_hFile*: UGCHandle_t
    m_hPreviewFile*: UGCHandle_t
    m_pchFileName*: array[k_cchFilenameMax, char]
    m_nFileSize*: int32
    m_nPreviewFileSize*: int32
    m_rgchURL*: array[k_cchPublishedFileURLMax, char]
    m_unVotesUp*: uint32
    m_unVotesDown*: uint32
    m_flScore*: cfloat
    m_unNumChildren*: uint32

  ISteamUGC* {.bycopy.} = object


proc CreateQueryUserUGCRequest*(this: var ISteamUGC; unAccountID: AccountID_t; eListType: EUserUGCList; eMatchingUGCType: EUGCMatchingUGCType; eSortOrder: EUserUGCListSortOrder; nCreatorAppID: AppId_t; nConsumerAppID: AppId_t; unPage: uint32): UGCQueryHandle_t {.stdcall, importcpp: "CreateQueryUserUGCRequest", dynlib: dynlibsteam_api.}
proc CreateQueryAllUGCRequest*(this: var ISteamUGC; eQueryType: EUGCQuery; eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType; nCreatorAppID: AppId_t; nConsumerAppID: AppId_t; unPage: uint32): UGCQueryHandle_t {.stdcall, importcpp: "CreateQueryAllUGCRequest", dynlib: dynlibsteam_api.}
proc CreateQueryUGCDetailsRequest*(this: var ISteamUGC; pvecPublishedFileID: ptr PublishedFileId_t; unNumPublishedFileIDs: uint32): UGCQueryHandle_t {. stdcall, importcpp: "CreateQueryUGCDetailsRequest", dynlib: dynlibsteam_api.}
proc SendQueryUGCRequest*(this: var ISteamUGC; handle: UGCQueryHandle_t): SteamAPICall_t {. stdcall, importcpp: "SendQueryUGCRequest", dynlib: dynlibsteam_api.}
proc GetQueryUGCResult*(this: var ISteamUGC; handle: UGCQueryHandle_t; index: uint32; pDetails: ptr SteamUGCDetails_t): bool {.stdcall, importcpp: "GetQueryUGCResult", dynlib: dynlibsteam_api.}
proc GetQueryUGCPreviewURL*(this: var ISteamUGC; handle: UGCQueryHandle_t; index: uint32; pchURL: cstring; cchURLSize: uint32): bool {. stdcall, importcpp: "GetQueryUGCPreviewURL", dynlib: dynlibsteam_api.}
proc GetQueryUGCMetadata*(this: var ISteamUGC; handle: UGCQueryHandle_t; index: uint32; pchMetadata: cstring; cchMetadatasize: uint32): bool {.stdcall, importcpp: "GetQueryUGCMetadata", dynlib: dynlibsteam_api.}
proc GetQueryUGCChildren*(this: var ISteamUGC; handle: UGCQueryHandle_t; index: uint32; pvecPublishedFileID: ptr PublishedFileId_t; cMaxEntries: uint32): bool {.stdcall, importcpp: "GetQueryUGCChildren", dynlib: dynlibsteam_api.}
proc GetQueryUGCStatistic*(this: var ISteamUGC; handle: UGCQueryHandle_t; index: uint32; eStatType: EItemStatistic; pStatValue: ptr uint64): bool {.stdcall, importcpp: "GetQueryUGCStatistic", dynlib: dynlibsteam_api.}
proc GetQueryUGCNumAdditionalPreviews*(this: var ISteamUGC; handle: UGCQueryHandle_t; index: uint32): uint32 {. stdcall, importcpp: "GetQueryUGCNumAdditionalPreviews", dynlib: dynlibsteam_api.}
proc GetQueryUGCAdditionalPreview*(this: var ISteamUGC; handle: UGCQueryHandle_t; index: uint32; previewIndex: uint32; pchURLOrVideoID: cstring; cchURLSize: uint32; pchOriginalFileName: cstring; cchOriginalFileNameSize: uint32; pPreviewType: ptr EItemPreviewType): bool {. stdcall, importcpp: "GetQueryUGCAdditionalPreview", dynlib: dynlibsteam_api.}
proc GetQueryUGCNumKeyValueTags*(this: var ISteamUGC; handle: UGCQueryHandle_t; index: uint32): uint32 {.stdcall, importcpp: "GetQueryUGCNumKeyValueTags", dynlib: dynlibsteam_api.}
proc GetQueryUGCKeyValueTag*(this: var ISteamUGC; handle: UGCQueryHandle_t; index: uint32; keyValueTagIndex: uint32; pchKey: cstring; cchKeySize: uint32; pchValue: cstring; cchValueSize: uint32): bool {.stdcall, importcpp: "GetQueryUGCKeyValueTag", dynlib: dynlibsteam_api.}
proc ReleaseQueryUGCRequest*(this: var ISteamUGC; handle: UGCQueryHandle_t): bool {. stdcall, importcpp: "ReleaseQueryUGCRequest", dynlib: dynlibsteam_api.}
proc AddRequiredTag*(this: var ISteamUGC; handle: UGCQueryHandle_t; pTagName: cstring): bool {. stdcall, importcpp: "AddRequiredTag", dynlib: dynlibsteam_api.}
proc AddExcludedTag*(this: var ISteamUGC; handle: UGCQueryHandle_t; pTagName: cstring): bool {. stdcall, importcpp: "AddExcludedTag", dynlib: dynlibsteam_api.}
proc SetReturnOnlyIDs*(this: var ISteamUGC; handle: UGCQueryHandle_t; bReturnOnlyIDs: bool): bool {.stdcall, importcpp: "SetReturnOnlyIDs", dynlib: dynlibsteam_api.}
proc SetReturnKeyValueTags*(this: var ISteamUGC; handle: UGCQueryHandle_t; bReturnKeyValueTags: bool): bool {.stdcall, importcpp: "SetReturnKeyValueTags", dynlib: dynlibsteam_api.}
proc SetReturnLongDescription*(this: var ISteamUGC; handle: UGCQueryHandle_t; bReturnLongDescription: bool): bool {.stdcall, importcpp: "SetReturnLongDescription", dynlib: dynlibsteam_api.}
proc SetReturnMetadata*(this: var ISteamUGC; handle: UGCQueryHandle_t; bReturnMetadata: bool): bool {.stdcall, importcpp: "SetReturnMetadata", dynlib: dynlibsteam_api.}
proc SetReturnChildren*(this: var ISteamUGC; handle: UGCQueryHandle_t; bReturnChildren: bool): bool {.stdcall, importcpp: "SetReturnChildren", dynlib: dynlibsteam_api.}
proc SetReturnAdditionalPreviews*(this: var ISteamUGC; handle: UGCQueryHandle_t; bReturnAdditionalPreviews: bool): bool {.stdcall, importcpp: "SetReturnAdditionalPreviews", dynlib: dynlibsteam_api.}
proc SetReturnTotalOnly*(this: var ISteamUGC; handle: UGCQueryHandle_t; bReturnTotalOnly: bool): bool {.stdcall, importcpp: "SetReturnTotalOnly", dynlib: dynlibsteam_api.}
proc SetReturnPlaytimeStats*(this: var ISteamUGC; handle: UGCQueryHandle_t; unDays: uint32): bool {.stdcall, importcpp: "SetReturnPlaytimeStats", dynlib: dynlibsteam_api.}
proc SetLanguage*(this: var ISteamUGC; handle: UGCQueryHandle_t; pchLanguage: cstring): bool {. stdcall, importcpp: "SetLanguage", dynlib: dynlibsteam_api.}
proc SetAllowCachedResponse*(this: var ISteamUGC; handle: UGCQueryHandle_t; unMaxAgeSeconds: uint32): bool {.stdcall, importcpp: "SetAllowCachedResponse", dynlib: dynlibsteam_api.}
proc SetCloudFileNameFilter*(this: var ISteamUGC; handle: UGCQueryHandle_t; pMatchCloudFileName: cstring): bool {.stdcall, importcpp: "SetCloudFileNameFilter", dynlib: dynlibsteam_api.}
proc SetMatchAnyTag*(this: var ISteamUGC; handle: UGCQueryHandle_t; bMatchAnyTag: bool): bool {. stdcall, importcpp: "SetMatchAnyTag", dynlib: dynlibsteam_api.}
proc SetSearchText*(this: var ISteamUGC; handle: UGCQueryHandle_t; pSearchText: cstring): bool {.stdcall, importcpp: "SetSearchText", dynlib: dynlibsteam_api.}
proc SetRankedByTrendDays*(this: var ISteamUGC; handle: UGCQueryHandle_t; unDays: uint32): bool {.stdcall, importcpp: "SetRankedByTrendDays", dynlib: dynlibsteam_api.}
proc AddRequiredKeyValueTag*(this: var ISteamUGC; handle: UGCQueryHandle_t; pKey: cstring; pValue: cstring): bool {.stdcall, importcpp: "AddRequiredKeyValueTag", dynlib: dynlibsteam_api.}
proc RequestUGCDetails*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t; unMaxAgeSeconds: uint32): SteamAPICall_t {.stdcall, importcpp: "RequestUGCDetails", dynlib: dynlibsteam_api.}
proc CreateItem*(this: var ISteamUGC; nConsumerAppId: AppId_t; eFileType: EWorkshopFileType): SteamAPICall_t {.stdcall, importcpp: "CreateItem", dynlib: dynlibsteam_api.}
proc StartItemUpdate*(this: var ISteamUGC; nConsumerAppId: AppId_t; nPublishedFileID: PublishedFileId_t): UGCUpdateHandle_t {. stdcall, importcpp: "StartItemUpdate", dynlib: dynlibsteam_api.}
proc SetItemTitle*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pchTitle: cstring): bool {. stdcall, importcpp: "SetItemTitle", dynlib: dynlibsteam_api.}
proc SetItemDescription*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pchDescription: cstring): bool {.stdcall, importcpp: "SetItemDescription", dynlib: dynlibsteam_api.}
proc SetItemUpdateLanguage*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pchLanguage: cstring): bool {.stdcall, importcpp: "SetItemUpdateLanguage", dynlib: dynlibsteam_api.}
proc SetItemMetadata*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pchMetaData: cstring): bool {.stdcall, importcpp: "SetItemMetadata", dynlib: dynlibsteam_api.}
proc SetItemVisibility*(this: var ISteamUGC; handle: UGCUpdateHandle_t; eVisibility: ERemoteStoragePublishedFileVisibility): bool {. stdcall, importcpp: "SetItemVisibility", dynlib: dynlibsteam_api.}
proc SetItemTags*(this: var ISteamUGC; updateHandle: UGCUpdateHandle_t; pTags: ptr SteamParamStringArray_t): bool {.stdcall, importcpp: "SetItemTags", dynlib: dynlibsteam_api.}
proc SetItemContent*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pszContentFolder: cstring): bool {.stdcall, importcpp: "SetItemContent", dynlib: dynlibsteam_api.}
proc SetItemPreview*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pszPreviewFile: cstring): bool {.stdcall, importcpp: "SetItemPreview", dynlib: dynlibsteam_api.}
proc RemoveItemKeyValueTags*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pchKey: cstring): bool {.stdcall, importcpp: "RemoveItemKeyValueTags", dynlib: dynlibsteam_api.}
proc AddItemKeyValueTag*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pchKey: cstring; pchValue: cstring): bool {.stdcall, importcpp: "AddItemKeyValueTag", dynlib: dynlibsteam_api.}
proc AddItemPreviewFile*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pszPreviewFile: cstring; `type`: EItemPreviewType): bool {. stdcall, importcpp: "AddItemPreviewFile", dynlib: dynlibsteam_api.}
proc AddItemPreviewVideo*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pszVideoID: cstring): bool {.stdcall, importcpp: "AddItemPreviewVideo", dynlib: dynlibsteam_api.}
proc UpdateItemPreviewFile*(this: var ISteamUGC; handle: UGCUpdateHandle_t; index: uint32; pszPreviewFile: cstring): bool {.stdcall, importcpp: "UpdateItemPreviewFile", dynlib: dynlibsteam_api.}
proc UpdateItemPreviewVideo*(this: var ISteamUGC; handle: UGCUpdateHandle_t; index: uint32; pszVideoID: cstring): bool {.stdcall, importcpp: "UpdateItemPreviewVideo", dynlib: dynlibsteam_api.}
proc RemoveItemPreview*(this: var ISteamUGC; handle: UGCUpdateHandle_t; index: uint32): bool {. stdcall, importcpp: "RemoveItemPreview", dynlib: dynlibsteam_api.}
proc SubmitItemUpdate*(this: var ISteamUGC; handle: UGCUpdateHandle_t; pchChangeNote: cstring): SteamAPICall_t {.stdcall, importcpp: "SubmitItemUpdate", dynlib: dynlibsteam_api.}
proc GetItemUpdateProgress*(this: var ISteamUGC; handle: UGCUpdateHandle_t; punBytesProcessed: ptr uint64; punBytesTotal: ptr uint64): EItemUpdateStatus {. stdcall, importcpp: "GetItemUpdateProgress", dynlib: dynlibsteam_api.}
proc SetUserItemVote*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t; bVoteUp: bool): SteamAPICall_t {.stdcall, importcpp: "SetUserItemVote", dynlib: dynlibsteam_api.}
proc GetUserItemVote*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "GetUserItemVote", dynlib: dynlibsteam_api.}
proc AddItemToFavorites*(this: var ISteamUGC; nAppId: AppId_t; nPublishedFileID: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "AddItemToFavorites", dynlib: dynlibsteam_api.}
proc RemoveItemFromFavorites*(this: var ISteamUGC; nAppId: AppId_t; nPublishedFileID: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "RemoveItemFromFavorites", dynlib: dynlibsteam_api.}
proc SubscribeItem*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "SubscribeItem", dynlib: dynlibsteam_api.}
proc UnsubscribeItem*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "UnsubscribeItem", dynlib: dynlibsteam_api.}
proc GetNumSubscribedItems*(this: var ISteamUGC): uint32 {.stdcall, importcpp: "GetNumSubscribedItems", dynlib: dynlibsteam_api.}
proc GetSubscribedItems*(this: var ISteamUGC; pvecPublishedFileID: ptr PublishedFileId_t; cMaxEntries: uint32): uint32 {.stdcall, importcpp: "GetSubscribedItems", dynlib: dynlibsteam_api.}
proc GetItemState*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t): uint32 {. stdcall, importcpp: "GetItemState", dynlib: dynlibsteam_api.}
proc GetItemInstallInfo*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t; punSizeOnDisk: ptr uint64; pchFolder: cstring; cchFolderSize: uint32; punTimeStamp: ptr uint32): bool {. stdcall, importcpp: "GetItemInstallInfo", dynlib: dynlibsteam_api.}
proc GetItemDownloadInfo*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t; punBytesDownloaded: ptr uint64; punBytesTotal: ptr uint64): bool {. stdcall, importcpp: "GetItemDownloadInfo", dynlib: dynlibsteam_api.}
proc DownloadItem*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t; bHighPriority: bool): bool {.stdcall, importcpp: "DownloadItem", dynlib: dynlibsteam_api.}
proc BInitWorkshopForGameServer*(this: var ISteamUGC; unWorkshopDepotID: DepotId_t; pszFolder: cstring): bool {.stdcall, importcpp: "BInitWorkshopForGameServer", dynlib: dynlibsteam_api.}
proc SuspendDownloads*(this: var ISteamUGC; bSuspend: bool) {.stdcall, importcpp: "SuspendDownloads", dynlib: dynlibsteam_api.}
proc StartPlaytimeTracking*(this: var ISteamUGC; pvecPublishedFileID: ptr PublishedFileId_t; unNumPublishedFileIDs: uint32): SteamAPICall_t {. stdcall, importcpp: "StartPlaytimeTracking", dynlib: dynlibsteam_api.}
proc StopPlaytimeTracking*(this: var ISteamUGC; pvecPublishedFileID: ptr PublishedFileId_t; unNumPublishedFileIDs: uint32): SteamAPICall_t {.stdcall, importcpp: "StopPlaytimeTracking", dynlib: dynlibsteam_api.}
proc StopPlaytimeTrackingForAllItems*(this: var ISteamUGC): SteamAPICall_t {.stdcall, importcpp: "StopPlaytimeTrackingForAllItems", dynlib: dynlibsteam_api.}
proc AddDependency*(this: var ISteamUGC; nParentPublishedFileID: PublishedFileId_t; nChildPublishedFileID: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "AddDependency", dynlib: dynlibsteam_api.}
proc RemoveDependency*(this: var ISteamUGC; nParentPublishedFileID: PublishedFileId_t; nChildPublishedFileID: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "RemoveDependency", dynlib: dynlibsteam_api.}
proc AddAppDependency*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t; nAppID: AppId_t): SteamAPICall_t {.stdcall, importcpp: "AddAppDependency", dynlib: dynlibsteam_api.}
proc RemoveAppDependency*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t; nAppID: AppId_t): SteamAPICall_t {.stdcall, importcpp: "RemoveAppDependency", dynlib: dynlibsteam_api.}
proc GetAppDependencies*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "GetAppDependencies", dynlib: dynlibsteam_api.}
proc DeleteItem*(this: var ISteamUGC; nPublishedFileID: PublishedFileId_t): SteamAPICall_t {. stdcall, importcpp: "DeleteItem", dynlib: dynlibsteam_api.}
type
  SteamUGCQueryCompleted_t* {.bycopy.} = object
    m_handle*: UGCQueryHandle_t
    m_eResult*: EResult
    m_unNumResultsReturned*: uint32
    m_unTotalMatchingResults*: uint32
    m_bCachedData*: bool


const
  k_iCallback* = k_iClientUGCCallbacks + 1

type
  SteamUGCRequestUGCDetailsResult_t* {.bycopy.} = object
    m_details*: SteamUGCDetails_t
    m_bCachedData*: bool


const
  k_iCallback* = k_iClientUGCCallbacks + 2

type
  CreateItemResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_bUserNeedsToAcceptWorkshopLegalAgreement*: bool


const
  k_iCallback* = k_iClientUGCCallbacks + 3

type
  SubmitItemUpdateResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_bUserNeedsToAcceptWorkshopLegalAgreement*: bool
    m_nPublishedFileId*: PublishedFileId_t


const
  k_iCallback* = k_iClientUGCCallbacks + 4

type
  ItemInstalled_t* {.bycopy.} = object
    m_unAppID*: AppId_t
    m_nPublishedFileId*: PublishedFileId_t


const
  k_iCallback* = k_iClientUGCCallbacks + 5

type
  DownloadItemResult_t* {.bycopy.} = object
    m_unAppID*: AppId_t
    m_nPublishedFileId*: PublishedFileId_t
    m_eResult*: EResult


const
  k_iCallback* = k_iClientUGCCallbacks + 6

type
  UserFavoriteItemsListChanged_t* {.bycopy.} = object
    m_nPublishedFileId*: PublishedFileId_t
    m_eResult*: EResult
    m_bWasAddRequest*: bool


const
  k_iCallback* = k_iClientUGCCallbacks + 7

type
  SetUserItemVoteResult_t* {.bycopy.} = object
    m_nPublishedFileId*: PublishedFileId_t
    m_eResult*: EResult
    m_bVoteUp*: bool


const
  k_iCallback* = k_iClientUGCCallbacks + 8

type
  GetUserItemVoteResult_t* {.bycopy.} = object
    m_nPublishedFileId*: PublishedFileId_t
    m_eResult*: EResult
    m_bVotedUp*: bool
    m_bVotedDown*: bool
    m_bVoteSkipped*: bool


const
  k_iCallback* = k_iClientUGCCallbacks + 9

type
  StartPlaytimeTrackingResult_t* {.bycopy.} = object
    m_eResult*: EResult


const
  k_iCallback* = k_iClientUGCCallbacks + 10

type
  StopPlaytimeTrackingResult_t* {.bycopy.} = object
    m_eResult*: EResult


const
  k_iCallback* = k_iClientUGCCallbacks + 11

type
  AddUGCDependencyResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_nChildPublishedFileId*: PublishedFileId_t


const
  k_iCallback* = k_iClientUGCCallbacks + 12

type
  RemoveUGCDependencyResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_nChildPublishedFileId*: PublishedFileId_t


const
  k_iCallback* = k_iClientUGCCallbacks + 13

type
  AddAppDependencyResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_nAppID*: AppId_t


const
  k_iCallback* = k_iClientUGCCallbacks + 14

type
  RemoveAppDependencyResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_nAppID*: AppId_t


const
  k_iCallback* = k_iClientUGCCallbacks + 15

type
  GetAppDependenciesResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t
    m_rgAppIDs*: array[32, AppId_t]
    m_nNumAppDependencies*: uint32
    m_nTotalNumAppDependencies*: uint32


const
  k_iCallback* = k_iClientUGCCallbacks + 16

type
  DeleteItemResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId_t


const
  k_iCallback* = k_iClientUGCCallbacks + 17

type
  ISteamAppList* {.bycopy.} = object


proc GetNumInstalledApps*(this: var ISteamAppList): uint32 {.stdcall, importcpp: "GetNumInstalledApps", dynlib: dynlibsteam_api.}
proc GetInstalledApps*(this: var ISteamAppList; pvecAppID: ptr AppId_t; unMaxAppIDs: uint32): uint32 {.stdcall, importcpp: "GetInstalledApps", dynlib: dynlibsteam_api.}
proc GetAppName*(this: var ISteamAppList; nAppID: AppId_t; pchName: cstring; cchNameMax: cint): cint {.stdcall, importcpp: "GetAppName", dynlib: dynlibsteam_api.}
proc GetAppInstallDir*(this: var ISteamAppList; nAppID: AppId_t; pchDirectory: cstring; cchNameMax: cint): cint {.stdcall, importcpp: "GetAppInstallDir", dynlib: dynlibsteam_api.}
proc GetAppBuildId*(this: var ISteamAppList; nAppID: AppId_t): cint {.stdcall, importcpp: "GetAppBuildId", dynlib: dynlibsteam_api.}
type
  SteamAppInstalled_t* {.bycopy.} = object
    m_nAppID*: AppId_t

  SteamCallback_t* = SteamAppInstalled_t

const
  k_iCallback* = k_iSteamAppListCallbacks + 1

type
  SteamAppUninstalled_t* {.bycopy.} = object
    m_nAppID*: AppId_t

  SteamCallback_t* = SteamAppUninstalled_t

const
  k_iCallback* = k_iSteamAppListCallbacks + 2

type
  HHTMLBrowser* = uint32

var INVALID_HTMLBROWSER* {.importcpp: "INVALID_HTMLBROWSER", dynlib: dynlibsteam_api.}: uint32

type
  ISteamHTMLSurface* {.bycopy.} = object


proc destroyISteamHTMLSurface*(this: var ISteamHTMLSurface) {.stdcall, importcpp: "#.~ISteamHTMLSurface()", dynlib: dynlibsteam_api.}
proc Init*(this: var ISteamHTMLSurface): bool {.stdcall, importcpp: "Init", dynlib: dynlibsteam_api.}
proc Shutdown*(this: var ISteamHTMLSurface): bool {.stdcall, importcpp: "Shutdown", dynlib: dynlibsteam_api.}
proc CreateBrowser*(this: var ISteamHTMLSurface; pchUserAgent: cstring; pchUserCSS: cstring): SteamAPICall_t {.stdcall, importcpp: "CreateBrowser", dynlib: dynlibsteam_api.}
proc RemoveBrowser*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser) {. stdcall, importcpp: "RemoveBrowser", dynlib: dynlibsteam_api.}
proc LoadURL*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; pchURL: cstring; pchPostData: cstring) {.stdcall, importcpp: "LoadURL", dynlib: dynlibsteam_api.}
proc SetSize*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; unWidth: uint32; unHeight: uint32) {.stdcall, importcpp: "SetSize", dynlib: dynlibsteam_api.}
proc StopLoad*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser) {.stdcall, importcpp: "StopLoad", dynlib: dynlibsteam_api.}
proc Reload*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser) {.stdcall, importcpp: "Reload", dynlib: dynlibsteam_api.}
proc GoBack*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser) {.stdcall, importcpp: "GoBack", dynlib: dynlibsteam_api.}
proc GoForward*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser) {.stdcall, importcpp: "GoForward", dynlib: dynlibsteam_api.}
proc AddHeader*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; pchKey: cstring; pchValue: cstring) {.stdcall, importcpp: "AddHeader", dynlib: dynlibsteam_api.}
proc ExecuteJavascript*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; pchScript: cstring) {.stdcall, importcpp: "ExecuteJavascript", dynlib: dynlibsteam_api.}
type
  EHTMLMouseButton* {.size: sizeof(cint).} = enum
    eHTMLMouseButton_Left = 0, eHTMLMouseButton_Right = 1, eHTMLMouseButton_Middle = 2


proc MouseUp*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; eMouseButton: EHTMLMouseButton) {.stdcall, importcpp: "MouseUp", dynlib: dynlibsteam_api.}
proc MouseDown*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; eMouseButton: EHTMLMouseButton) {.stdcall, importcpp: "MouseDown", dynlib: dynlibsteam_api.}
proc MouseDoubleClick*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; eMouseButton: EHTMLMouseButton) {.stdcall, importcpp: "MouseDoubleClick", dynlib: dynlibsteam_api.}
proc MouseMove*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; x: cint; y: cint) {.stdcall, importcpp: "MouseMove", dynlib: dynlibsteam_api.}
proc MouseWheel*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; nDelta: int32) {.stdcall, importcpp: "MouseWheel", dynlib: dynlibsteam_api.}
type
  EMouseCursor* {.size: sizeof(cint).} = enum
    dc_user = 0, dc_none, dc_arrow, dc_ibeam, dc_hourglass, dc_waitarrow, dc_crosshair, dc_up, dc_sizenw, dc_sizese, dc_sizene, dc_sizesw, dc_sizew, dc_sizee, dc_sizen, dc_sizes, dc_sizewe, dc_sizens, dc_sizeall, dc_no, dc_hand, dc_blank, dc_middle_pan, dc_north_pan, dc_north_east_pan, dc_east_pan, dc_south_east_pan, dc_south_pan, dc_south_west_pan, dc_west_pan, dc_north_west_pan, dc_alias, dc_cell, dc_colresize, dc_copycur, dc_verticaltext, dc_rowresize, dc_zoomin, dc_zoomout, dc_help, dc_custom, dc_last


type
  EHTMLKeyModifiers* {.size: sizeof(cint).} = enum
    k_eHTMLKeyModifier_None = 0, k_eHTMLKeyModifier_AltDown = 1 shl 0, k_eHTMLKeyModifier_CtrlDown = 1 shl 1, k_eHTMLKeyModifier_ShiftDown = 1 shl 2


proc KeyDown*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; nNativeKeyCode: uint32; eHTMLKeyModifiers: EHTMLKeyModifiers) {. stdcall, importcpp: "KeyDown", dynlib: dynlibsteam_api.}
proc KeyUp*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; nNativeKeyCode: uint32; eHTMLKeyModifiers: EHTMLKeyModifiers) {.stdcall, importcpp: "KeyUp", dynlib: dynlibsteam_api.}
proc KeyChar*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; cUnicodeChar: uint32; eHTMLKeyModifiers: EHTMLKeyModifiers) {.stdcall, importcpp: "KeyChar", dynlib: dynlibsteam_api.}
proc SetHorizontalScroll*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; nAbsolutePixelScroll: uint32) {.stdcall, importcpp: "SetHorizontalScroll", dynlib: dynlibsteam_api.}
proc SetVerticalScroll*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; nAbsolutePixelScroll: uint32) {.stdcall, importcpp: "SetVerticalScroll", dynlib: dynlibsteam_api.}
proc SetKeyFocus*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; bHasKeyFocus: bool) {.stdcall, importcpp: "SetKeyFocus", dynlib: dynlibsteam_api.}
proc ViewSource*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser) {. stdcall, importcpp: "ViewSource", dynlib: dynlibsteam_api.}
proc CopyToClipboard*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser) {. stdcall, importcpp: "CopyToClipboard", dynlib: dynlibsteam_api.}
proc PasteFromClipboard*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser) {. stdcall, importcpp: "PasteFromClipboard", dynlib: dynlibsteam_api.}
proc Find*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; pchSearchStr: cstring; bCurrentlyInFind: bool; bReverse: bool) {.stdcall, importcpp: "Find", dynlib: dynlibsteam_api.}
proc StopFind*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser) {.stdcall, importcpp: "StopFind", dynlib: dynlibsteam_api.}
proc GetLinkAtPosition*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; x: cint; y: cint) {.stdcall, importcpp: "GetLinkAtPosition", dynlib: dynlibsteam_api.}
proc SetCookie*(this: var ISteamHTMLSurface; pchHostname: cstring; pchKey: cstring; pchValue: cstring; pchPath: cstring = "/"; nExpires: RTime32 = 0; bSecure: bool = false; bHTTPOnly: bool = false) {.stdcall, importcpp: "SetCookie", dynlib: dynlibsteam_api.}
proc SetPageScaleFactor*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; flZoom: cfloat; nPointX: cint; nPointY: cint) {.stdcall, importcpp: "SetPageScaleFactor", dynlib: dynlibsteam_api.}
proc SetBackgroundMode*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; bBackgroundMode: bool) {.stdcall, importcpp: "SetBackgroundMode", dynlib: dynlibsteam_api.}
proc SetDPIScalingFactor*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; flDPIScaling: cfloat) {. stdcall, importcpp: "SetDPIScalingFactor", dynlib: dynlibsteam_api.}
proc AllowStartRequest*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; bAllowed: bool) {.stdcall, importcpp: "AllowStartRequest", dynlib: dynlibsteam_api.}
proc JSDialogResponse*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; bResult: bool) {.stdcall, importcpp: "JSDialogResponse", dynlib: dynlibsteam_api.}
proc FileLoadDialogResponse*(this: var ISteamHTMLSurface; unBrowserHandle: HHTMLBrowser; pchSelectedFiles: cstringArray) {.stdcall, importcpp: "FileLoadDialogResponse", dynlib: dynlibsteam_api.}
type
  HTML_BrowserReady_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser

  SteamCallback_t* = HTML_BrowserReady_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 1

type
  HTML_NeedsPaint_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pBGRA*: cstring
    unWide*: uint32
    unTall*: uint32
    unUpdateX*: uint32
    unUpdateY*: uint32
    unUpdateWide*: uint32
    unUpdateTall*: uint32
    unScrollX*: uint32
    unScrollY*: uint32
    flPageScale*: cfloat
    unPageSerial*: uint32

  SteamCallback_t* = HTML_NeedsPaint_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 2

type
  HTML_StartRequest_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchURL*: cstring
    pchTarget*: cstring
    pchPostData*: cstring
    bIsRedirect*: bool

  SteamCallback_t* = HTML_StartRequest_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 3

type
  HTML_CloseBrowser_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser

  SteamCallback_t* = HTML_CloseBrowser_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 4

type
  HTML_URLChanged_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchURL*: cstring
    pchPostData*: cstring
    bIsRedirect*: bool
    pchPageTitle*: cstring
    bNewNavigation*: bool

  SteamCallback_t* = HTML_URLChanged_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 5

type
  HTML_FinishedRequest_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchURL*: cstring
    pchPageTitle*: cstring

  SteamCallback_t* = HTML_FinishedRequest_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 6

type
  HTML_OpenLinkInNewTab_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchURL*: cstring

  SteamCallback_t* = HTML_OpenLinkInNewTab_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 7

type
  HTML_ChangedTitle_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchTitle*: cstring

  SteamCallback_t* = HTML_ChangedTitle_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 8

type
  HTML_SearchResults_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    unResults*: uint32
    unCurrentMatch*: uint32

  SteamCallback_t* = HTML_SearchResults_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 9

type
  HTML_CanGoBackAndForward_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    bCanGoBack*: bool
    bCanGoForward*: bool

  SteamCallback_t* = HTML_CanGoBackAndForward_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 10

type
  HTML_HorizontalScroll_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    unScrollMax*: uint32
    unScrollCurrent*: uint32
    flPageScale*: cfloat
    bVisible*: bool
    unPageSize*: uint32

  SteamCallback_t* = HTML_HorizontalScroll_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 11

type
  HTML_VerticalScroll_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    unScrollMax*: uint32
    unScrollCurrent*: uint32
    flPageScale*: cfloat
    bVisible*: bool
    unPageSize*: uint32

  SteamCallback_t* = HTML_VerticalScroll_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 12

type
  HTML_LinkAtPosition_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    x*: uint32
    y*: uint32
    pchURL*: cstring
    bInput*: bool
    bLiveLink*: bool

  SteamCallback_t* = HTML_LinkAtPosition_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 13

type
  HTML_JSAlert_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchMessage*: cstring

  SteamCallback_t* = HTML_JSAlert_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 14

type
  HTML_JSConfirm_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchMessage*: cstring

  SteamCallback_t* = HTML_JSConfirm_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 15

type
  HTML_FileOpenDialog_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchTitle*: cstring
    pchInitialFile*: cstring

  SteamCallback_t* = HTML_FileOpenDialog_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 16

type
  HTML_NewWindow_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchURL*: cstring
    unX*: uint32
    unY*: uint32
    unWide*: uint32
    unTall*: uint32
    unNewWindow_BrowserHandle*: HHTMLBrowser

  SteamCallback_t* = HTML_NewWindow_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 21

type
  HTML_SetCursor_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    eMouseCursor*: uint32

  SteamCallback_t* = HTML_SetCursor_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 22

type
  HTML_StatusText_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchMsg*: cstring

  SteamCallback_t* = HTML_StatusText_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 23

type
  HTML_ShowToolTip_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchMsg*: cstring

  SteamCallback_t* = HTML_ShowToolTip_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 24

type
  HTML_UpdateToolTip_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    pchMsg*: cstring

  SteamCallback_t* = HTML_UpdateToolTip_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 25

type
  HTML_HideToolTip_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser

  SteamCallback_t* = HTML_HideToolTip_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 26

type
  HTML_BrowserRestarted_t* {.bycopy.} = object
    unBrowserHandle*: HHTMLBrowser
    unOldBrowserHandle*: HHTMLBrowser

  SteamCallback_t* = HTML_BrowserRestarted_t

const
  k_iCallback* = k_iSteamHTMLSurfaceCallbacks + 27

type
  SteamItemInstanceID_t* = uint64

var k_SteamItemInstanceIDInvalid* {.importcpp: "k_SteamItemInstanceIDInvalid", dynlib: dynlibsteam_api.}: SteamItemInstanceID_t

type
  SteamItemDef_t* = int32
  ESteamItemFlags* {.size: sizeof(cint).} = enum
    k_ESteamItemNoTrade = 1 shl 0, k_ESteamItemRemoved = 1 shl 8, k_ESteamItemConsumed = 1 shl 9


type
  SteamItemDetails_t* {.bycopy.} = object
    m_itemId*: SteamItemInstanceID_t
    m_iDefinition*: SteamItemDef_t
    m_unQuantity*: uint16
    m_unFlags*: uint16

  SteamInventoryResult_t* = int32

var k_SteamInventoryResultInvalid* {.importcpp: "k_SteamInventoryResultInvalid", dynlib: dynlibsteam_api.}: SteamInventoryResult_t

type
  SteamInventoryUpdateHandle_t* = uint64

var k_SteamInventoryUpdateHandleInvalid* {. importcpp: "k_SteamInventoryUpdateHandleInvalid", dynlib: dynlibsteam_api.}: SteamInventoryUpdateHandle_t

type
  ISteamInventory* {.bycopy.} = object


proc GetResultStatus*(this: var ISteamInventory; resultHandle: SteamInventoryResult_t): EResult {.stdcall, importcpp: "GetResultStatus", dynlib: dynlibsteam_api.}
proc GetResultItems*(this: var ISteamInventory; resultHandle: SteamInventoryResult_t; pOutItemsArray: ptr SteamItemDetails_t; punOutItemsArraySize: ptr uint32): bool {.stdcall, importcpp: "GetResultItems", dynlib: dynlibsteam_api.}
proc GetResultItemProperty*(this: var ISteamInventory; resultHandle: SteamInventoryResult_t; unItemIndex: uint32; pchPropertyName: cstring; pchValueBuffer: cstring; punValueBufferSizeOut: ptr uint32): bool {.stdcall, importcpp: "GetResultItemProperty", dynlib: dynlibsteam_api.}
proc GetResultTimestamp*(this: var ISteamInventory; resultHandle: SteamInventoryResult_t): uint32 {.stdcall, importcpp: "GetResultTimestamp", dynlib: dynlibsteam_api.}
proc CheckResultSteamID*(this: var ISteamInventory; resultHandle: SteamInventoryResult_t; steamIDExpected: CSteamID): bool {.stdcall, importcpp: "CheckResultSteamID", dynlib: dynlibsteam_api.}
proc DestroyResult*(this: var ISteamInventory; resultHandle: SteamInventoryResult_t) {. stdcall, importcpp: "DestroyResult", dynlib: dynlibsteam_api.}
proc GetAllItems*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t): bool {.stdcall, importcpp: "GetAllItems", dynlib: dynlibsteam_api.}
proc GetItemsByID*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t; pInstanceIDs: ptr SteamItemInstanceID_t; unCountInstanceIDs: uint32): bool {.stdcall, importcpp: "GetItemsByID", dynlib: dynlibsteam_api.}
proc SerializeResult*(this: var ISteamInventory; resultHandle: SteamInventoryResult_t; pOutBuffer: pointer; punOutBufferSize: ptr uint32): bool {.stdcall, importcpp: "SerializeResult", dynlib: dynlibsteam_api.}
proc DeserializeResult*(this: var ISteamInventory; pOutResultHandle: ptr SteamInventoryResult_t; pBuffer: pointer; unBufferSize: uint32; bRESERVED_MUST_BE_FALSE: bool = false): bool {.stdcall, importcpp: "DeserializeResult", dynlib: dynlibsteam_api.}
proc GenerateItems*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t; pArrayItemDefs: ptr SteamItemDef_t; punArrayQuantity: ptr uint32; unArrayLength: uint32): bool {. stdcall, importcpp: "GenerateItems", dynlib: dynlibsteam_api.}
proc GrantPromoItems*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t): bool {.stdcall, importcpp: "GrantPromoItems", dynlib: dynlibsteam_api.}
proc AddPromoItem*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t; itemDef: SteamItemDef_t): bool {.stdcall, importcpp: "AddPromoItem", dynlib: dynlibsteam_api.}
proc AddPromoItems*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t; pArrayItemDefs: ptr SteamItemDef_t; unArrayLength: uint32): bool {. stdcall, importcpp: "AddPromoItems", dynlib: dynlibsteam_api.}
proc ConsumeItem*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t; itemConsume: SteamItemInstanceID_t; unQuantity: uint32): bool {. stdcall, importcpp: "ConsumeItem", dynlib: dynlibsteam_api.}
proc ExchangeItems*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t; pArrayGenerate: ptr SteamItemDef_t; punArrayGenerateQuantity: ptr uint32; unArrayGenerateLength: uint32; pArrayDestroy: ptr SteamItemInstanceID_t; punArrayDestroyQuantity: ptr uint32; unArrayDestroyLength: uint32): bool {.stdcall, importcpp: "ExchangeItems", dynlib: dynlibsteam_api.}
proc TransferItemQuantity*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t; itemIdSource: SteamItemInstanceID_t; unQuantity: uint32; itemIdDest: SteamItemInstanceID_t): bool {.stdcall, importcpp: "TransferItemQuantity", dynlib: dynlibsteam_api.}
proc SendItemDropHeartbeat*(this: var ISteamInventory) {.stdcall, importcpp: "SendItemDropHeartbeat", dynlib: dynlibsteam_api.}
proc TriggerItemDrop*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t; dropListDefinition: SteamItemDef_t): bool {.stdcall, importcpp: "TriggerItemDrop", dynlib: dynlibsteam_api.}
proc TradeItems*(this: var ISteamInventory; pResultHandle: ptr SteamInventoryResult_t; steamIDTradePartner: CSteamID; pArrayGive: ptr SteamItemInstanceID_t; pArrayGiveQuantity: ptr uint32; nArrayGiveLength: uint32; pArrayGet: ptr SteamItemInstanceID_t; pArrayGetQuantity: ptr uint32; nArrayGetLength: uint32): bool {. stdcall, importcpp: "TradeItems", dynlib: dynlibsteam_api.}
proc LoadItemDefinitions*(this: var ISteamInventory): bool {.stdcall, importcpp: "LoadItemDefinitions", dynlib: dynlibsteam_api.}
proc GetItemDefinitionIDs*(this: var ISteamInventory; pItemDefIDs: ptr SteamItemDef_t; punItemDefIDsArraySize: ptr uint32): bool {.stdcall, importcpp: "GetItemDefinitionIDs", dynlib: dynlibsteam_api.}
proc GetItemDefinitionProperty*(this: var ISteamInventory; iDefinition: SteamItemDef_t; pchPropertyName: cstring; pchValueBuffer: cstring; punValueBufferSizeOut: ptr uint32): bool {.stdcall, importcpp: "GetItemDefinitionProperty", dynlib: dynlibsteam_api.}
proc RequestEligiblePromoItemDefinitionsIDs*(this: var ISteamInventory; steamID: CSteamID): SteamAPICall_t {.stdcall, importcpp: "RequestEligiblePromoItemDefinitionsIDs", dynlib: dynlibsteam_api.}
proc GetEligiblePromoItemDefinitionIDs*(this: var ISteamInventory; steamID: CSteamID; pItemDefIDs: ptr SteamItemDef_t; punItemDefIDsArraySize: ptr uint32): bool {. stdcall, importcpp: "GetEligiblePromoItemDefinitionIDs", dynlib: dynlibsteam_api.}
proc StartPurchase*(this: var ISteamInventory; pArrayItemDefs: ptr SteamItemDef_t; punArrayQuantity: ptr uint32; unArrayLength: uint32): SteamAPICall_t {. stdcall, importcpp: "StartPurchase", dynlib: dynlibsteam_api.}
proc RequestPrices*(this: var ISteamInventory): SteamAPICall_t {.stdcall, importcpp: "RequestPrices", dynlib: dynlibsteam_api.}
proc GetNumItemsWithPrices*(this: var ISteamInventory): uint32 {.stdcall, importcpp: "GetNumItemsWithPrices", dynlib: dynlibsteam_api.}
proc GetItemsWithPrices*(this: var ISteamInventory; pArrayItemDefs: ptr SteamItemDef_t; pPrices: ptr uint64; unArrayLength: uint32): bool {.stdcall, importcpp: "GetItemsWithPrices", dynlib: dynlibsteam_api.}
proc GetItemPrice*(this: var ISteamInventory; iDefinition: SteamItemDef_t; pPrice: ptr uint64): bool {.stdcall, importcpp: "GetItemPrice", dynlib: dynlibsteam_api.}
proc StartUpdateProperties*(this: var ISteamInventory): SteamInventoryUpdateHandle_t {. stdcall, importcpp: "StartUpdateProperties", dynlib: dynlibsteam_api.}
proc RemoveProperty*(this: var ISteamInventory; handle: SteamInventoryUpdateHandle_t; nItemID: SteamItemInstanceID_t; pchPropertyName: cstring): bool {. stdcall, importcpp: "RemoveProperty", dynlib: dynlibsteam_api.}
proc SetProperty*(this: var ISteamInventory; handle: SteamInventoryUpdateHandle_t; nItemID: SteamItemInstanceID_t; pchPropertyName: cstring; pchPropertyValue: cstring): bool {.stdcall, importcpp: "SetProperty", dynlib: dynlibsteam_api.}
proc SetProperty*(this: var ISteamInventory; handle: SteamInventoryUpdateHandle_t; nItemID: SteamItemInstanceID_t; pchPropertyName: cstring; bValue: bool): bool {.stdcall, importcpp: "SetProperty", dynlib: dynlibsteam_api.}
proc SetProperty*(this: var ISteamInventory; handle: SteamInventoryUpdateHandle_t; nItemID: SteamItemInstanceID_t; pchPropertyName: cstring; nValue: int64): bool {.stdcall, importcpp: "SetProperty", dynlib: dynlibsteam_api.}
proc SetProperty*(this: var ISteamInventory; handle: SteamInventoryUpdateHandle_t; nItemID: SteamItemInstanceID_t; pchPropertyName: cstring; flValue: cfloat): bool {.stdcall, importcpp: "SetProperty", dynlib: dynlibsteam_api.}
proc SubmitUpdateProperties*(this: var ISteamInventory; handle: SteamInventoryUpdateHandle_t; pResultHandle: ptr SteamInventoryResult_t): bool {. stdcall, importcpp: "SubmitUpdateProperties", dynlib: dynlibsteam_api.}
type
  SteamInventoryResultReady_t* {.bycopy.} = object
    m_handle*: SteamInventoryResult_t
    m_result*: EResult


const
  k_iCallback* = k_iClientInventoryCallbacks + 0

type
  SteamInventoryFullUpdate_t* {.bycopy.} = object
    m_handle*: SteamInventoryResult_t


const
  k_iCallback* = k_iClientInventoryCallbacks + 1

type
  SteamInventoryDefinitionUpdate_t* {.bycopy.} = object


const
  k_iCallback* = k_iClientInventoryCallbacks + 2

type
  SteamInventoryEligiblePromoItemDefIDs_t* {.bycopy.} = object
    m_result*: EResult
    m_steamID*: CSteamID
    m_numEligiblePromoItemDefs*: cint
    m_bCachedData*: bool


const
  k_iCallback* = k_iClientInventoryCallbacks + 3

type
  SteamInventoryStartPurchaseResult_t* {.bycopy.} = object
    m_result*: EResult
    m_ulOrderID*: uint64
    m_ulTransID*: uint64


const
  k_iCallback* = k_iClientInventoryCallbacks + 4

type
  SteamInventoryRequestPricesResult_t* {.bycopy.} = object
    m_result*: EResult
    m_rgchCurrency*: array[4, char]


const
  k_iCallback* = k_iClientInventoryCallbacks + 5

type
  ISteamVideo* {.bycopy.} = object


proc GetVideoURL*(this: var ISteamVideo; unVideoAppID: AppId_t) {.stdcall, importcpp: "GetVideoURL", dynlib: dynlibsteam_api.}
proc IsBroadcasting*(this: var ISteamVideo; pnNumViewers: ptr cint): bool {.stdcall, importcpp: "IsBroadcasting", dynlib: dynlibsteam_api.}
proc GetOPFSettings*(this: var ISteamVideo; unVideoAppID: AppId_t) {.stdcall, importcpp: "GetOPFSettings", dynlib: dynlibsteam_api.}
proc GetOPFStringForApp*(this: var ISteamVideo; unVideoAppID: AppId_t; pchBuffer: cstring; pnBufferSize: ptr int32): bool {.stdcall, importcpp: "GetOPFStringForApp", dynlib: dynlibsteam_api.}
type
  BroadcastUploadStart_t* {.bycopy.} = object

  SteamCallback_t* = BroadcastUploadStart_t

const
  k_iCallback* = k_iClientVideoCallbacks + 4

type
  BroadcastUploadStop_t* {.bycopy.} = object
    m_eResult*: EBroadcastUploadResult

  SteamCallback_t* = BroadcastUploadStop_t

const
  k_iCallback* = k_iClientVideoCallbacks + 5

type
  GetVideoURLResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_unVideoAppID*: AppId_t
    m_rgchURL*: array[256, char]

  SteamCallback_t* = GetVideoURLResult_t

const
  k_iCallback* = k_iClientVideoCallbacks + 11

type
  GetOPFSettingsResult_t* {.bycopy.} = object
    m_eResult*: EResult
    m_unVideoAppID*: AppId_t

  SteamCallback_t* = GetOPFSettingsResult_t

const
  k_iCallback* = k_iClientVideoCallbacks + 24

type
  EParentalFeature* {.size: sizeof(cint).} = enum
    k_EFeatureInvalid = 0, k_EFeatureStore = 1, k_EFeatureCommunity = 2, k_EFeatureProfile = 3, k_EFeatureFriends = 4, k_EFeatureNews = 5, k_EFeatureTrading = 6, k_EFeatureSettings = 7, k_EFeatureConsole = 8, k_EFeatureBrowser = 9, k_EFeatureParentalSetup = 10, k_EFeatureLibrary = 11, k_EFeatureTest = 12, k_EFeatureMax


type
  ISteamParentalSettings* {.bycopy.} = object


proc BIsParentalLockEnabled*(this: var ISteamParentalSettings): bool {.stdcall, importcpp: "BIsParentalLockEnabled", dynlib: dynlibsteam_api.}
proc BIsParentalLockLocked*(this: var ISteamParentalSettings): bool {.stdcall, importcpp: "BIsParentalLockLocked", dynlib: dynlibsteam_api.}
proc BIsAppBlocked*(this: var ISteamParentalSettings; nAppID: AppId_t): bool {.stdcall, importcpp: "BIsAppBlocked", dynlib: dynlibsteam_api.}
proc BIsAppInBlockList*(this: var ISteamParentalSettings; nAppID: AppId_t): bool {. stdcall, importcpp: "BIsAppInBlockList", dynlib: dynlibsteam_api.}
proc BIsFeatureBlocked*(this: var ISteamParentalSettings; eFeature: EParentalFeature): bool {. stdcall, importcpp: "BIsFeatureBlocked", dynlib: dynlibsteam_api.}
proc BIsFeatureInBlockList*(this: var ISteamParentalSettings; eFeature: EParentalFeature): bool {.stdcall, importcpp: "BIsFeatureInBlockList", dynlib: dynlibsteam_api.}
type
  SteamParentalSettingsChanged_t* {.bycopy.} = object


const
  k_iCallback* = k_ISteamParentalSettingsCallbacks + 1

proc SteamAPI_Init*(): bool {.stdcall, importcpp: "SteamAPI_Init(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_Shutdown*() {.stdcall, importcpp: "SteamAPI_Shutdown(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_RestartAppIfNecessary*(unOwnAppID: uint32): bool {.stdcall, importcpp: "SteamAPI_RestartAppIfNecessary(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_ReleaseCurrentThreadMemory*() {.stdcall, importcpp: "SteamAPI_ReleaseCurrentThreadMemory(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_WriteMiniDump*(uStructuredExceptionCode: uint32; pvExceptionInfo: pointer; uBuildID: uint32) {.stdcall, importcpp: "SteamAPI_WriteMiniDump(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_SetMiniDumpComment*(pchMsg: cstring) {.stdcall, importcpp: "SteamAPI_SetMiniDumpComment(@)", dynlib: dynlibsteam_api.}
proc SteamClient*(): ptr ISteamClient {.stdcall, importcpp: "SteamClient(@)", dynlib: dynlibsteam_api.}
proc SteamUser*(): ptr ISteamUser {.stdcall, importcpp: "SteamUser(@)", dynlib: dynlibsteam_api.}
proc SteamFriends*(): ptr ISteamFriends {.stdcall, importcpp: "SteamFriends(@)", dynlib: dynlibsteam_api.}
proc SteamUtils*(): ptr ISteamUtils {.stdcall, importcpp: "SteamUtils(@)", dynlib: dynlibsteam_api.}
proc SteamMatchmaking*(): ptr ISteamMatchmaking {.stdcall, importcpp: "SteamMatchmaking(@)", dynlib: dynlibsteam_api.}
proc SteamUserStats*(): ptr ISteamUserStats {.stdcall, importcpp: "SteamUserStats(@)", dynlib: dynlibsteam_api.}
proc SteamApps*(): ptr ISteamApps {.stdcall, importcpp: "SteamApps(@)", dynlib: dynlibsteam_api.}
proc SteamNetworking*(): ptr ISteamNetworking {.stdcall, importcpp: "SteamNetworking(@)", dynlib: dynlibsteam_api.}
proc SteamMatchmakingServers*(): ptr ISteamMatchmakingServers {.stdcall, importcpp: "SteamMatchmakingServers(@)", dynlib: dynlibsteam_api.}
proc SteamRemoteStorage*(): ptr ISteamRemoteStorage {.stdcall, importcpp: "SteamRemoteStorage(@)", dynlib: dynlibsteam_api.}
proc SteamScreenshots*(): ptr ISteamScreenshots {.stdcall, importcpp: "SteamScreenshots(@)", dynlib: dynlibsteam_api.}
proc SteamHTTP*(): ptr ISteamHTTP {.stdcall, importcpp: "SteamHTTP(@)", dynlib: dynlibsteam_api.}
proc SteamController*(): ptr ISteamController {.stdcall, importcpp: "SteamController(@)", dynlib: dynlibsteam_api.}
proc SteamUGC*(): ptr ISteamUGC {.stdcall, importcpp: "SteamUGC(@)", dynlib: dynlibsteam_api.}
proc SteamAppList*(): ptr ISteamAppList {.stdcall, importcpp: "SteamAppList(@)", dynlib: dynlibsteam_api.}
proc SteamMusic*(): ptr ISteamMusic {.stdcall, importcpp: "SteamMusic(@)", dynlib: dynlibsteam_api.}
proc SteamMusicRemote*(): ptr ISteamMusicRemote {.stdcall, importcpp: "SteamMusicRemote(@)", dynlib: dynlibsteam_api.}
proc SteamHTMLSurface*(): ptr ISteamHTMLSurface {.stdcall, importcpp: "SteamHTMLSurface(@)", dynlib: dynlibsteam_api.}
proc SteamInventory*(): ptr ISteamInventory {.stdcall, importcpp: "SteamInventory(@)", dynlib: dynlibsteam_api.}
proc SteamVideo*(): ptr ISteamVideo {.stdcall, importcpp: "SteamVideo(@)", dynlib: dynlibsteam_api.}
proc SteamParentalSettings*(): ptr ISteamParentalSettings {.stdcall, importcpp: "SteamParentalSettings(@)", dynlib: dynlibsteam_api.}
type
  CSteamAPIContext* {.bycopy.} = object


proc constructCSteamAPIContext*(): CSteamAPIContext {.stdcall, constructor, importcpp: "CSteamAPIContext(@)", dynlib: dynlibsteam_api.}
proc Clear*(this: var CSteamAPIContext) {.stdcall, importcpp: "Clear", dynlib: dynlibsteam_api.}
proc Init*(this: var CSteamAPIContext): bool {.stdcall, importcpp: "Init", dynlib: dynlibsteam_api.}
proc SteamClient*(this: CSteamAPIContext): ptr ISteamClient {.noSideEffect, stdcall, importcpp: "SteamClient", dynlib: dynlibsteam_api.}
proc SteamUser*(this: CSteamAPIContext): ptr ISteamUser {.noSideEffect, stdcall, importcpp: "SteamUser", dynlib: dynlibsteam_api.}
proc SteamFriends*(this: CSteamAPIContext): ptr ISteamFriends {.noSideEffect, stdcall, importcpp: "SteamFriends", dynlib: dynlibsteam_api.}
proc SteamUtils*(this: CSteamAPIContext): ptr ISteamUtils {.noSideEffect, stdcall, importcpp: "SteamUtils", dynlib: dynlibsteam_api.}
proc SteamMatchmaking*(this: CSteamAPIContext): ptr ISteamMatchmaking {.noSideEffect, stdcall, importcpp: "SteamMatchmaking", dynlib: dynlibsteam_api.}
proc SteamUserStats*(this: CSteamAPIContext): ptr ISteamUserStats {.noSideEffect, stdcall, importcpp: "SteamUserStats", dynlib: dynlibsteam_api.}
proc SteamApps*(this: CSteamAPIContext): ptr ISteamApps {.noSideEffect, stdcall, importcpp: "SteamApps", dynlib: dynlibsteam_api.}
proc SteamMatchmakingServers*(this: CSteamAPIContext): ptr ISteamMatchmakingServers {. noSideEffect, stdcall, importcpp: "SteamMatchmakingServers", dynlib: dynlibsteam_api.}
proc SteamNetworking*(this: CSteamAPIContext): ptr ISteamNetworking {.noSideEffect, stdcall, importcpp: "SteamNetworking", dynlib: dynlibsteam_api.}
proc SteamRemoteStorage*(this: CSteamAPIContext): ptr ISteamRemoteStorage {. noSideEffect, stdcall, importcpp: "SteamRemoteStorage", dynlib: dynlibsteam_api.}
proc SteamScreenshots*(this: CSteamAPIContext): ptr ISteamScreenshots {.noSideEffect, stdcall, importcpp: "SteamScreenshots", dynlib: dynlibsteam_api.}
proc SteamHTTP*(this: CSteamAPIContext): ptr ISteamHTTP {.noSideEffect, stdcall, importcpp: "SteamHTTP", dynlib: dynlibsteam_api.}
proc SteamController*(this: CSteamAPIContext): ptr ISteamController {.noSideEffect, stdcall, importcpp: "SteamController", dynlib: dynlibsteam_api.}
proc SteamUGC*(this: CSteamAPIContext): ptr ISteamUGC {.noSideEffect, stdcall, importcpp: "SteamUGC", dynlib: dynlibsteam_api.}
proc SteamAppList*(this: CSteamAPIContext): ptr ISteamAppList {.noSideEffect, stdcall, importcpp: "SteamAppList", dynlib: dynlibsteam_api.}
proc SteamMusic*(this: CSteamAPIContext): ptr ISteamMusic {.noSideEffect, stdcall, importcpp: "SteamMusic", dynlib: dynlibsteam_api.}
proc SteamMusicRemote*(this: CSteamAPIContext): ptr ISteamMusicRemote {.noSideEffect, stdcall, importcpp: "SteamMusicRemote", dynlib: dynlibsteam_api.}
proc SteamHTMLSurface*(this: CSteamAPIContext): ptr ISteamHTMLSurface {.noSideEffect, stdcall, importcpp: "SteamHTMLSurface", dynlib: dynlibsteam_api.}
proc SteamInventory*(this: CSteamAPIContext): ptr ISteamInventory {.noSideEffect, stdcall, importcpp: "SteamInventory", dynlib: dynlibsteam_api.}
proc SteamVideo*(this: CSteamAPIContext): ptr ISteamVideo {.noSideEffect, stdcall, importcpp: "SteamVideo", dynlib: dynlibsteam_api.}
proc SteamParentalSettings*(this: CSteamAPIContext): ptr ISteamParentalSettings {. noSideEffect, stdcall, importcpp: "SteamParentalSettings", dynlib: dynlibsteam_api.}
proc SteamAPI_RunCallbacks*() {.stdcall, importcpp: "SteamAPI_RunCallbacks(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_RegisterCallback*(pCallback: ptr CCallbackBase; iCallback: cint) {. stdcall, importcpp: "SteamAPI_RegisterCallback(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_UnregisterCallback*(pCallback: ptr CCallbackBase) {.stdcall, importcpp: "SteamAPI_UnregisterCallback(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_RegisterCallResult*(pCallback: ptr CCallbackBase; hAPICall: SteamAPICall_t) {.stdcall, importcpp: "SteamAPI_RegisterCallResult(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_UnregisterCallResult*(pCallback: ptr CCallbackBase; hAPICall: SteamAPICall_t) {.stdcall, importcpp: "SteamAPI_UnregisterCallResult(@)", dynlib: dynlibsteam_api.}
type
  CCallbackBase* {.bycopy.} = object


proc constructCCallbackBase*(): CCallbackBase {.stdcall, constructor, importcpp: "CCallbackBase(@)", dynlib: dynlibsteam_api.}
proc Run*(this: var CCallbackBase; pvParam: pointer) {.stdcall, importcpp: "Run", dynlib: dynlibsteam_api.}
proc Run*(this: var CCallbackBase; pvParam: pointer; bIOFailure: bool; hSteamAPICall: SteamAPICall_t) {.stdcall, importcpp: "Run", dynlib: dynlibsteam_api.}
proc GetICallback*(this: var CCallbackBase): cint {.stdcall, importcpp: "GetICallback", dynlib: dynlibsteam_api.}
proc GetCallbackSizeBytes*(this: var CCallbackBase): cint {.stdcall, importcpp: "GetCallbackSizeBytes", dynlib: dynlibsteam_api.}
type
  CCallbackImpl* {.bycopy.}[sizeof_P: static[cint]] = object of CCallbackBase


proc destroyCCallbackImpl*[sizeof_P: static[cint]](
    this: var CCallbackImpl[sizeof_P]) {.stdcall, importcpp: "#.~CCallbackImpl()", dynlib: dynlibsteam_api.}
proc SetGameserverFlag*[sizeof_P: static[cint]](this: var CCallbackImpl[sizeof_P]) {. stdcall, importcpp: "SetGameserverFlag", dynlib: dynlibsteam_api.}
type
  CCallResult* {.bycopy.}[T; P] = object of CCallbackBase

  func_t* = proc (a2: ptr P; a3: bool) {.stdcall, memberfuncptr.}

proc constructCCallResult*[T; P](): CCallResult[T, P] {.stdcall, constructor, importcpp: "CCallResult(@)", dynlib: dynlibsteam_api.}
proc destroyCCallResult*[T; P](this: var CCallResult[T, P]) {.stdcall, importcpp: "#.~CCallResult()", dynlib: dynlibsteam_api.}
proc Set*[T; P](this: var CCallResult[T, P]; hAPICall: SteamAPICall_t; p: ptr T; `func`: func_t) {.stdcall, importcpp: "Set", dynlib: dynlibsteam_api.}
proc IsActive*[T; P](this: CCallResult[T, P]): bool {.noSideEffect, stdcall, importcpp: "IsActive", dynlib: dynlibsteam_api.}
proc Cancel*[T; P](this: var CCallResult[T, P]) {.stdcall, importcpp: "Cancel", dynlib: dynlibsteam_api.}
proc SetGameserverFlag*[T; P](this: var CCallResult[T, P]) {.stdcall, importcpp: "SetGameserverFlag", dynlib: dynlibsteam_api.}
type
  CCallback* {.bycopy.}[T; P; bGameserver: static[bool]] = object of CCallbackImpl

  func_t* = proc (a2: ptr P) {.stdcall, memberfuncptr.}

proc constructCCallback*[T; P; bGameserver: static[bool]](pObj: ptr T; `func`: func_t): CCallback[
    T, P, bGameserver] {.stdcall, constructor, importcpp: "CCallback(@)", dynlib: dynlibsteam_api.}
proc Register*[T; P; bGameserver: static[bool]](
    this: var CCallback[T, P, bGameserver]; pObj: ptr T; `func`: func_t) {.stdcall, importcpp: "Register", dynlib: dynlibsteam_api.}
proc Unregister*[T; P; bGameserver: static[bool]](
    this: var CCallback[T, P, bGameserver]) {.stdcall, importcpp: "Unregister", dynlib: dynlibsteam_api.}
type
  CCallbackManual* {.bycopy.}[T; P; bGameServer: static[bool]] = object of CCallback[T, P, bGameServer]


proc constructCCallbackManual*[T; P; bGameServer: static[bool]](): CCallbackManual[T, P, bGameServer] {.stdcall, constructor, importcpp: "CCallbackManual(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_IsSteamRunning*(): bool {.stdcall, importcpp: "SteamAPI_IsSteamRunning(@)", dynlib: dynlibsteam_api.}
proc Steam_RunCallbacks*(hSteamPipe: HSteamPipe; bGameServerCallbacks: bool) {. stdcall, importcpp: "Steam_RunCallbacks(@)", dynlib: dynlibsteam_api.}
proc Steam_RegisterInterfaceFuncs*(hModule: pointer) {.stdcall, importcpp: "Steam_RegisterInterfaceFuncs(@)", dynlib: dynlibsteam_api.}
proc Steam_GetHSteamUserCurrent*(): HSteamUser {.stdcall, importcpp: "Steam_GetHSteamUserCurrent(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_GetSteamInstallPath*(): cstring {.stdcall, importcpp: "SteamAPI_GetSteamInstallPath(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_GetHSteamPipe*(): HSteamPipe {.stdcall, importcpp: "SteamAPI_GetHSteamPipe(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_SetTryCatchCallbacks*(bTryCatchCallbacks: bool) {.stdcall, importcpp: "SteamAPI_SetTryCatchCallbacks(@)", dynlib: dynlibsteam_api.}
proc GetHSteamPipe*(): HSteamPipe {.stdcall, importcpp: "GetHSteamPipe(@)", dynlib: dynlibsteam_api.}
proc GetHSteamUser*(): HSteamUser {.stdcall, importcpp: "GetHSteamUser(@)", dynlib: dynlibsteam_api.}
proc SteamAPI_GetHSteamUser*(): HSteamUser {.stdcall, importcpp: "SteamAPI_GetHSteamUser(@)", dynlib: dynlibsteam_api.}
proc SteamInternal_ContextInit*(pContextInitData: pointer): pointer {.stdcall, importcpp: "SteamInternal_ContextInit(@)", dynlib: dynlibsteam_api.}
proc SteamInternal_CreateInterface*(ver: cstring): pointer {.stdcall, importcpp: "SteamInternal_CreateInterface(@)", dynlib: dynlibsteam_api.}
proc SteamInternal_OnContextInit*(p: pointer) {.stdcall.}
proc SteamInternal_ModuleContext*(): var CSteamAPIContext {.stdcall.}
proc SteamClient*(): ptr ISteamClient {.stdcall.}
proc SteamUser*(): ptr ISteamUser {.stdcall.}
proc SteamFriends*(): ptr ISteamFriends {.stdcall.}
proc SteamUtils*(): ptr ISteamUtils {.stdcall.}
proc SteamMatchmaking*(): ptr ISteamMatchmaking {.stdcall.}
proc SteamUserStats*(): ptr ISteamUserStats {.stdcall.}
proc SteamApps*(): ptr ISteamApps {.stdcall.}
proc SteamMatchmakingServers*(): ptr ISteamMatchmakingServers {.stdcall.}
proc SteamNetworking*(): ptr ISteamNetworking {.stdcall.}
proc SteamRemoteStorage*(): ptr ISteamRemoteStorage {.stdcall.}
proc SteamScreenshots*(): ptr ISteamScreenshots {.stdcall.}
proc SteamHTTP*(): ptr ISteamHTTP {.stdcall.}
proc SteamController*(): ptr ISteamController {.stdcall.}
proc SteamUGC*(): ptr ISteamUGC {.stdcall.}
proc SteamAppList*(): ptr ISteamAppList {.stdcall.}
proc SteamMusic*(): ptr ISteamMusic {.stdcall.}
proc SteamMusicRemote*(): ptr ISteamMusicRemote {.stdcall.}
proc SteamHTMLSurface*(): ptr ISteamHTMLSurface {.stdcall.}
proc SteamInventory*(): ptr ISteamInventory {.stdcall.}
proc SteamVideo*(): ptr ISteamVideo {.stdcall.}
proc SteamParentalSettings*(): ptr ISteamParentalSettings {.stdcall.}
proc Clear*(this: var CSteamAPIContext) {.stdcall, importcpp: "Clear", dynlib: dynlibsteam_api.}
proc Init*(this: var CSteamAPIContext): bool {.stdcall, importcpp: "Init", dynlib: dynlibsteam_api.}