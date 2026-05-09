# This version uses the DLL api directly (No C++ or .lib files).
# Not need to use VC++. Gcc works even on windows.
import os

const
  k_cchMaxSteamErrMsg* = 1024

type
  ISteamApps* = distinct pointer
  ISteamUser* = distinct pointer
  ISteamFriends* = distinct pointer
  ISteamUserStats* = distinct pointer
  ISteamUtils* = distinct pointer
  ISteamUGC* = distinct pointer

  SteamAPICall* = distinct uint64

  AccountId* = uint32
  AppId* = uint32
  DepotId* = uint32
  PublishedFileId* = uint64
  RTime32* = uint32
  SteamId* = uint64
  UGCHandle* = uint64
  UGCQueryHandle* = uint64
  UGCUpdateHandle* = uint64
  SteamErrMsg* = array[k_cchMaxSteamErrMsg, char]

  EItemPreviewType* = int32
  EItemState* = uint32
  EItemUpdateStatus* = int32
  ERemoteStoragePublishedFileVisibility* = int32
  EResult* = int32
  EUGCMatchingUGCType* = int32
  EUGCQuery* = int32
  EUserUGCList* = int32
  EUserUGCListSortOrder* = int32
  EWorkshopFileType* = int32

  InitResult* = enum
    InitOk = 0
    InitFailedGeneric = 1 # Some other failure
    InitNoSteamClient = 2 # We cannot connect to Steam, steam probably isn't running
    InitVersionMismatch = 3 # Steam client appears to be out of date

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
    success*: uint8 # Was the call successful? Returns 1 if it was; otherwise, 0 on failure.
    players*: int32 # Number of players currently playing.

  SteamParamStringArray* = object
    m_ppStrings*: ptr cstring
    m_nNumStrings*: int32

  CreateItemResult* = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId
    m_bUserNeedsToAcceptWorkshopLegalAgreement*: bool

  SubmitItemUpdateResult* = object
    m_eResult*: EResult
    m_bUserNeedsToAcceptWorkshopLegalAgreement*: bool
    m_nPublishedFileId*: PublishedFileId

  DownloadItemResult* = object
    m_unAppID*: AppId
    m_nPublishedFileId*: PublishedFileId
    m_eResult*: EResult

  RemoteStorageSubscribePublishedFileResult* = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId

  RemoteStorageUnsubscribePublishedFileResult* = object
    m_eResult*: EResult
    m_nPublishedFileId*: PublishedFileId

  SetUserItemVoteResult* = object
    m_nPublishedFileId*: PublishedFileId
    m_eResult*: EResult
    m_bVoteUp*: bool

  GetUserItemVoteResult* = object
    m_nPublishedFileId*: PublishedFileId
    m_eResult*: EResult
    m_bVotedUp*: bool
    m_bVotedDown*: bool
    m_bVoteSkipped*: bool

  SteamUGCQueryCompleted* = object
    m_handle*: UGCQueryHandle
    m_eResult*: EResult
    m_unNumResultsReturned*: uint32
    m_unTotalMatchingResults*: uint32
    m_bCachedData*: bool
    m_rgchNextCursor*: array[256, char]

  SteamUGCDetails* = object
    m_nPublishedFileId*: PublishedFileId
    m_eResult*: EResult
    m_eFileType*: EWorkshopFileType
    m_nCreatorAppID*: AppId
    m_nConsumerAppID*: AppId
    m_rgchTitle*: array[129, char]
    m_rgchDescription*: array[8000, char]
    m_ulSteamIDOwner*: uint64
    m_rtimeCreated*: RTime32
    m_rtimeUpdated*: RTime32
    m_rtimeAddedToUserList*: RTime32
    m_eVisibility*: ERemoteStoragePublishedFileVisibility
    m_bBanned*: bool
    m_bAcceptedForUse*: bool
    m_bTagsTruncated*: bool
    m_rgchTags*: array[1025, char]
    m_hFile*: UGCHandle
    m_hPreviewFile*: UGCHandle
    m_pchFileName*: array[260, char]
    m_nFileSize*: int32
    m_nPreviewFileSize*: int32
    m_rgchURL*: array[256, char]
    m_unVotesUp*: uint32
    m_unVotesDown*: uint32
    m_flScore*: float32
    m_unNumChildren*: uint32
    m_ulTotalFilesSize*: uint64

const
  k_uAPICallInvalid* = SteamAPICall(0'u64)
  k_UGCQueryHandleInvalid* = high(uint64)
  k_UGCUpdateHandleInvalid* = high(uint64)

  k_iRemoteStorageSubscribePublishedFileResult* = 1313
  k_iRemoteStorageUnsubscribePublishedFileResult* = 1314
  k_iSteamUGCQueryCompleted* = 3401
  k_iCreateItemResult* = 3403
  k_iSubmitItemUpdateResult* = 3404
  k_iDownloadItemResult* = 3406
  k_iSetUserItemVoteResult* = 3408
  k_iGetUserItemVoteResult* = 3409

  k_EResultOK* = 1'i32
  k_EResultFail* = 2'i32
  k_EResultNoConnection* = 3'i32
  k_EResultInvalidPassword* = 5'i32
  k_EResultLoggedInElsewhere* = 6'i32
  k_EResultInvalidProtocolVer* = 7'i32
  k_EResultInvalidParam* = 8'i32
  k_EResultFileNotFound* = 9'i32
  k_EResultBusy* = 10'i32
  k_EResultInvalidState* = 11'i32
  k_EResultInvalidName* = 12'i32
  k_EResultInvalidEmail* = 13'i32
  k_EResultDuplicateName* = 14'i32
  k_EResultAccessDenied* = 15'i32
  k_EResultTimeout* = 16'i32
  k_EResultBanned* = 17'i32
  k_EResultAccountNotFound* = 18'i32
  k_EResultInvalidSteamID* = 19'i32
  k_EResultServiceUnavailable* = 20'i32
  k_EResultNotLoggedOn* = 21'i32
  k_EResultPending* = 22'i32
  k_EResultEncryptionFailure* = 23'i32
  k_EResultInsufficientPrivilege* = 24'i32
  k_EResultLimitExceeded* = 25'i32
  k_EResultRevoked* = 26'i32
  k_EResultExpired* = 27'i32
  k_EResultAlreadyRedeemed* = 28'i32
  k_EResultDuplicateRequest* = 29'i32
  k_EResultAlreadyOwned* = 30'i32
  k_EResultIPNotFound* = 31'i32
  k_EResultPersistFailed* = 32'i32
  k_EResultLockingFailed* = 33'i32
  k_EResultServiceReadOnly* = 44'i32

  k_EWorkshopFileTypeCommunity* = 0'i32
  k_EWorkshopFileTypeMicrotransaction* = 1'i32
  k_EWorkshopFileTypeCollection* = 2'i32
  k_EWorkshopFileTypeArt* = 3'i32
  k_EWorkshopFileTypeVideo* = 4'i32
  k_EWorkshopFileTypeScreenshot* = 5'i32
  k_EWorkshopFileTypeGame* = 6'i32
  k_EWorkshopFileTypeSoftware* = 7'i32
  k_EWorkshopFileTypeConcept* = 8'i32
  k_EWorkshopFileTypeWebGuide* = 9'i32
  k_EWorkshopFileTypeIntegratedGuide* = 10'i32
  k_EWorkshopFileTypeMerch* = 11'i32
  k_EWorkshopFileTypeControllerBinding* = 12'i32
  k_EWorkshopFileTypeSteamworksAccessInvite* = 13'i32
  k_EWorkshopFileTypeSteamVideo* = 14'i32
  k_EWorkshopFileTypeGameManagedItem* = 15'i32

  k_ERemoteStoragePublishedFileVisibilityPublic* = 0'i32
  k_ERemoteStoragePublishedFileVisibilityFriendsOnly* = 1'i32
  k_ERemoteStoragePublishedFileVisibilityPrivate* = 2'i32
  k_ERemoteStoragePublishedFileVisibilityUnlisted* = 3'i32

  k_EItemStateNone* = 0'u32
  k_EItemStateSubscribed* = 1'u32
  k_EItemStateLegacyItem* = 2'u32
  k_EItemStateInstalled* = 4'u32
  k_EItemStateNeedsUpdate* = 8'u32
  k_EItemStateDownloading* = 16'u32
  k_EItemStateDownloadPending* = 32'u32
  k_EItemStateDisabledLocally* = 64'u32

  k_EItemUpdateStatusInvalid* = 0'i32
  k_EItemUpdateStatusPreparingConfig* = 1'i32
  k_EItemUpdateStatusPreparingContent* = 2'i32
  k_EItemUpdateStatusUploadingContent* = 3'i32
  k_EItemUpdateStatusUploadingPreviewFile* = 4'i32
  k_EItemUpdateStatusCommittingChanges* = 5'i32

  k_EItemPreviewTypeImage* = 0'i32
  k_EItemPreviewTypeYouTubeVideo* = 1'i32
  k_EItemPreviewTypeSketchfab* = 2'i32
  k_EItemPreviewTypeEnvironmentMapHorizontalCross* = 3'i32
  k_EItemPreviewTypeEnvironmentMapLatLong* = 4'i32

  k_EUGCQueryRankedByVote* = 0'i32
  k_EUGCQueryRankedByPublicationDate* = 1'i32
  k_EUGCQueryAcceptedForGameRankedByAcceptanceDate* = 2'i32
  k_EUGCQueryRankedByTrend* = 3'i32
  k_EUGCQueryFavoritedByFriendsRankedByPublicationDate* = 4'i32
  k_EUGCQueryCreatedByFriendsRankedByPublicationDate* = 5'i32
  k_EUGCQueryRankedByNumTimesReported* = 6'i32
  k_EUGCQueryCreatedByFollowedUsersRankedByPublicationDate* = 7'i32
  k_EUGCQueryNotYetRated* = 8'i32
  k_EUGCQueryRankedByTotalVotesAsc* = 9'i32
  k_EUGCQueryRankedByVotesUp* = 10'i32
  k_EUGCQueryRankedByTextSearch* = 11'i32
  k_EUGCQueryRankedByTotalUniqueSubscriptions* = 12'i32
  k_EUGCQueryRankedByPlaytimeTrend* = 13'i32
  k_EUGCQueryRankedByTotalPlaytime* = 14'i32
  k_EUGCQueryRankedByAveragePlaytimeTrend* = 15'i32
  k_EUGCQueryRankedByLifetimeAveragePlaytime* = 16'i32
  k_EUGCQueryRankedByPlaytimeSessionsTrend* = 17'i32
  k_EUGCQueryRankedByLifetimePlaytimeSessions* = 18'i32
  k_EUGCQueryRankedByLastUpdatedDate* = 19'i32

  k_EUGCMatchingUGCTypeItems* = 0'i32
  k_EUGCMatchingUGCTypeItemsMtx* = 1'i32
  k_EUGCMatchingUGCTypeItemsReadyToUse* = 2'i32
  k_EUGCMatchingUGCTypeCollections* = 3'i32
  k_EUGCMatchingUGCTypeArtwork* = 4'i32
  k_EUGCMatchingUGCTypeVideos* = 5'i32
  k_EUGCMatchingUGCTypeScreenshots* = 6'i32
  k_EUGCMatchingUGCTypeAllGuides* = 7'i32
  k_EUGCMatchingUGCTypeWebGuides* = 8'i32
  k_EUGCMatchingUGCTypeIntegratedGuides* = 9'i32
  k_EUGCMatchingUGCTypeUsableInGame* = 10'i32
  k_EUGCMatchingUGCTypeControllerBindings* = 11'i32
  k_EUGCMatchingUGCTypeGameManagedItems* = 12'i32
  k_EUGCMatchingUGCTypeAll* = int32(-1)

  k_EUserUGCListPublished* = 0'i32
  k_EUserUGCListVotedOn* = 1'i32
  k_EUserUGCListVotedUp* = 2'i32
  k_EUserUGCListVotedDown* = 3'i32
  k_EUserUGCListWillVoteLater* = 4'i32
  k_EUserUGCListFavorited* = 5'i32
  k_EUserUGCListSubscribed* = 6'i32
  k_EUserUGCListUsedOrPlayed* = 7'i32
  k_EUserUGCListFollowed* = 8'i32

  k_EUserUGCListSortOrderCreationOrderDesc* = 0'i32
  k_EUserUGCListSortOrderCreationOrderAsc* = 1'i32
  k_EUserUGCListSortOrderTitleAsc* = 2'i32
  k_EUserUGCListSortOrderLastUpdatedDesc* = 3'i32
  k_EUserUGCListSortOrderSubscriptionDateDesc* = 4'i32
  k_EUserUGCListSortOrderVoteScoreDesc* = 5'i32
  k_EUserUGCListSortOrderForModeration* = 6'i32

{.push cdecl, dynlib: "steam_api64".}

proc RestartAppIfNecessary*(ownAppID: AppId): bool {.importc: "SteamAPI_RestartAppIfNecessary".}
proc InitFlat*(pOutErrMsg: ptr SteamErrMsg): InitResult {.importc: "SteamAPI_InitFlat".}
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

proc SteamUser*(): ISteamUser {.importc: "SteamAPI_SteamUser_v023".}
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
proc getAppID*(self: ISteamUtils): AppId {.importc: "SteamAPI_ISteamUtils_GetAppID".}
proc getAPICallResult*(self: ISteamUtils, steamAPICall: SteamAPICall, data: pointer, dataSize: cint, callbackExpected: cint, failed: ptr[bool]): bool {.importc: "SteamAPI_ISteamUtils_GetAPICallResult".}
proc isAPICallCompleted*(self: ISteamUtils, steamAPICall: SteamAPICall, failed: ptr[bool]): bool {.importc: "SteamAPI_ISteamUtils_IsAPICallCompleted".}
proc getAPICallFailureReason*(self: ISteamUtils, steamAPICall: SteamAPICall): cint  {.importc: "SteamAPI_ISteamUtils_GetAPICallFailureReason".}

proc SteamUGC*(): ISteamUGC {.importc: "SteamAPI_SteamUGC_v018".}
proc createItem*(self: ISteamUGC, nConsumerAppId: AppId, eFileType: EWorkshopFileType): SteamAPICall {.importc: "SteamAPI_ISteamUGC_CreateItem".}
proc startItemUpdate*(self: ISteamUGC, nConsumerAppId: AppId, nPublishedFileID: PublishedFileId): UGCUpdateHandle {.importc: "SteamAPI_ISteamUGC_StartItemUpdate".}
proc setItemTitle*(self: ISteamUGC, handle: UGCUpdateHandle, pchTitle: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemTitle".}
proc setItemDescription*(self: ISteamUGC, handle: UGCUpdateHandle, pchDescription: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemDescription".}
proc setItemMetadata*(self: ISteamUGC, handle: UGCUpdateHandle, pchMetaData: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemMetadata".}
proc setItemVisibility*(self: ISteamUGC, handle: UGCUpdateHandle, eVisibility: ERemoteStoragePublishedFileVisibility): bool {.importc: "SteamAPI_ISteamUGC_SetItemVisibility".}
proc setItemTags*(self: ISteamUGC, updateHandle: UGCUpdateHandle, pTags: ptr SteamParamStringArray, bAllowAdminTags: bool): bool {.importc: "SteamAPI_ISteamUGC_SetItemTags".}
proc setItemContent*(self: ISteamUGC, handle: UGCUpdateHandle, pszContentFolder: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemContent".}
proc setItemPreview*(self: ISteamUGC, handle: UGCUpdateHandle, pszPreviewFile: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemPreview".}
proc addItemKeyValueTag*(self: ISteamUGC, handle: UGCUpdateHandle, pchKey, pchValue: cstring): bool {.importc: "SteamAPI_ISteamUGC_AddItemKeyValueTag".}
proc removeAllItemKeyValueTags*(self: ISteamUGC, handle: UGCUpdateHandle): bool {.importc: "SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags".}
proc removeItemKeyValueTags*(self: ISteamUGC, handle: UGCUpdateHandle, pchKey: cstring): bool {.importc: "SteamAPI_ISteamUGC_RemoveItemKeyValueTags".}
proc submitItemUpdate*(self: ISteamUGC, handle: UGCUpdateHandle, pchChangeNote: cstring): SteamAPICall {.importc: "SteamAPI_ISteamUGC_SubmitItemUpdate".}
proc getItemUpdateProgress*(self: ISteamUGC, handle: UGCUpdateHandle, punBytesProcessed, punBytesTotal: ptr[uint64]): EItemUpdateStatus {.importc: "SteamAPI_ISteamUGC_GetItemUpdateProgress".}

proc subscribeItem*(self: ISteamUGC, nPublishedFileID: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_SubscribeItem".}
proc unsubscribeItem*(self: ISteamUGC, nPublishedFileID: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_UnsubscribeItem".}
proc downloadItem*(self: ISteamUGC, nPublishedFileID: PublishedFileId, bHighPriority: bool): bool {.importc: "SteamAPI_ISteamUGC_DownloadItem".}
proc getItemState*(self: ISteamUGC, nPublishedFileID: PublishedFileId): EItemState {.importc: "SteamAPI_ISteamUGC_GetItemState".}
proc getItemDownloadInfo*(self: ISteamUGC, nPublishedFileID: PublishedFileId, punBytesDownloaded, punBytesTotal: ptr[uint64]): bool {.importc: "SteamAPI_ISteamUGC_GetItemDownloadInfo".}
proc getItemInstallInfo*(self: ISteamUGC, nPublishedFileID: PublishedFileId, punSizeOnDisk: ptr[uint64], pchFolder: ptr char, cchFolderSize: uint32, punTimeStamp: ptr[uint32]): bool {.importc: "SteamAPI_ISteamUGC_GetItemInstallInfo".}
proc getNumSubscribedItems*(self: ISteamUGC, bIncludeLocallyDisabled: bool): uint32 {.importc: "SteamAPI_ISteamUGC_GetNumSubscribedItems".}
proc getSubscribedItems*(self: ISteamUGC, pvecPublishedFileID: ptr PublishedFileId, cMaxEntries: uint32, bIncludeLocallyDisabled: bool): uint32 {.importc: "SteamAPI_ISteamUGC_GetSubscribedItems".}
proc suspendDownloads*(self: ISteamUGC, bSuspend: bool) {.importc: "SteamAPI_ISteamUGC_SuspendDownloads".}

proc createQueryUGCDetailsRequest*(self: ISteamUGC, pvecPublishedFileID: ptr PublishedFileId, unNumPublishedFileIDs: uint32): UGCQueryHandle {.importc: "SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest".}
proc createQueryAllUGCRequest*(self: ISteamUGC, eQueryType: EUGCQuery, eMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID, nConsumerAppID: AppId, unPage: uint32): UGCQueryHandle {.importc: "SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage".}
proc createQueryUserUGCRequest*(self: ISteamUGC, unAccountID: AccountId, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID, nConsumerAppID: AppId, unPage: uint32): UGCQueryHandle {.importc: "SteamAPI_ISteamUGC_CreateQueryUserUGCRequest".}
proc sendQueryUGCRequest*(self: ISteamUGC, handle: UGCQueryHandle): SteamAPICall {.importc: "SteamAPI_ISteamUGC_SendQueryUGCRequest".}
proc getQueryUGCResult*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, pDetails: ptr SteamUGCDetails): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCResult".}
proc getQueryUGCMetadata*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, pchMetadata: ptr char, cchMetadatasize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCMetadata".}
proc getQueryUGCPreviewURL*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, pchURL: ptr char, cchURLSize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCPreviewURL".}
proc getQueryUGCNumKeyValueTags*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32): uint32 {.importc: "SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags".}
proc getQueryUGCKeyValueTag*(self: ISteamUGC, handle: UGCQueryHandle, index, keyValueTagIndex: uint32, pchKey: ptr char, cchKeySize: uint32, pchValue: ptr char, cchValueSize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag".}
proc addRequiredTag*(self: ISteamUGC, handle: UGCQueryHandle, pTagName: cstring): bool {.importc: "SteamAPI_ISteamUGC_AddRequiredTag".}
proc addRequiredKeyValueTag*(self: ISteamUGC, handle: UGCQueryHandle, pKey, pValue: cstring): bool {.importc: "SteamAPI_ISteamUGC_AddRequiredKeyValueTag".}
proc addExcludedTag*(self: ISteamUGC, handle: UGCQueryHandle, pTagName: cstring): bool {.importc: "SteamAPI_ISteamUGC_AddExcludedTag".}
proc setMatchAnyTag*(self: ISteamUGC, handle: UGCQueryHandle, bMatchAnyTag: bool): bool {.importc: "SteamAPI_ISteamUGC_SetMatchAnyTag".}
proc setSearchText*(self: ISteamUGC, handle: UGCQueryHandle, pSearchText: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetSearchText".}
proc setReturnKeyValueTags*(self: ISteamUGC, handle: UGCQueryHandle, bReturnKeyValueTags: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnKeyValueTags".}
proc setReturnMetadata*(self: ISteamUGC, handle: UGCQueryHandle, bReturnMetadata: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnMetadata".}
proc setReturnOnlyIDs*(self: ISteamUGC, handle: UGCQueryHandle, bReturnOnlyIDs: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnOnlyIDs".}
proc releaseQueryUGCRequest*(self: ISteamUGC, handle: UGCQueryHandle): bool {.importc: "SteamAPI_ISteamUGC_ReleaseQueryUGCRequest".}

proc setUserItemVote*(self: ISteamUGC, nPublishedFileID: PublishedFileId, bVoteUp: bool): SteamAPICall {.importc: "SteamAPI_ISteamUGC_SetUserItemVote".}
proc getUserItemVote*(self: ISteamUGC, nPublishedFileID: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_GetUserItemVote".}
{.pop.}

proc zeroCap(s: var string) =
  for i, c in s:
    if c == char(0):
      s.setLen(i)
      return

proc InitFlat*(): InitResult =
  var errMsg: SteamErrMsg
  InitFlat(errMsg.addr)

proc Init*(): bool =
  InitFlat() == InitOk

proc getAppInstallDir*(self: ISteamApps, appID: AppId): string =
  result = newString(1024)
  result.setLen(self.getAppInstallDir(appID, result[0].addr, result.len.uint32).int)

proc getCurrentBetaName*(self: ISteamApps): string =
  result = newString(1024)
  discard self.getCurrentBetaName(result[0].addr, result.len.cint)
  result.zeroCap()

proc steamString*(chars: openArray[char]): string =
  result = newStringOfCap(chars.len)
  for c in chars:
    if c == char(0):
      return
    result.add(c)

proc InitFlat*(errorMessage: var string): InitResult =
  var errMsg: SteamErrMsg
  result = InitFlat(errMsg.addr)
  errorMessage = steamString(errMsg)

proc setItemTags*(self: ISteamUGC, updateHandle: UGCUpdateHandle, tags: openArray[string], allowAdminTags = false): bool =
  var cTags = newSeq[cstring](tags.len)
  for i, tag in tags:
    cTags[i] = tag.cstring
  var tagArray = SteamParamStringArray(
    m_ppStrings: (if cTags.len == 0: cast[ptr cstring](nil) else: cTags[0].addr),
    m_nNumStrings: cTags.len.int32
  )
  self.setItemTags(updateHandle, tagArray.addr, allowAdminTags)

proc getItemInstallInfo*(self: ISteamUGC, nPublishedFileID: PublishedFileId): tuple[ok: bool, sizeOnDisk: uint64, folder: string, timestamp: uint32] =
  result.folder = newString(1024)
  result.ok = self.getItemInstallInfo(
    nPublishedFileID,
    result.sizeOnDisk.addr,
    result.folder[0].addr,
    result.folder.len.uint32,
    result.timestamp.addr
  )
  if result.ok:
    result.folder.zeroCap()
  else:
    result.folder.setLen(0)

proc getItemDownloadInfo*(self: ISteamUGC, nPublishedFileID: PublishedFileId): tuple[ok: bool, bytesDownloaded, bytesTotal: uint64] =
  result.ok = self.getItemDownloadInfo(
    nPublishedFileID,
    result.bytesDownloaded.addr,
    result.bytesTotal.addr
  )

proc getSubscribedItems*(self: ISteamUGC, includeLocallyDisabled = false): seq[PublishedFileId] =
  let count = self.getNumSubscribedItems(includeLocallyDisabled)
  if count == 0:
    return @[]
  result.setLen(count.int)
  let returned = self.getSubscribedItems(result[0].addr, count, includeLocallyDisabled)
  result.setLen(returned.int)

proc waitForAPICall*[T](
  self: ISteamUtils,
  steamAPICall: SteamAPICall,
  callbackExpected: cint,
  timeoutMs = 30000,
  pollMs = 10
): tuple[ok: bool, failed: bool, timedOut: bool, data: T] =
  var elapsed = 0
  let actualPollMs = if pollMs <= 0: 10 else: pollMs

  RunCallbacks()
  while not self.isAPICallCompleted(steamAPICall, result.failed.addr):
    if timeoutMs >= 0 and elapsed >= timeoutMs:
      result.timedOut = true
      return
    sleep(actualPollMs)
    elapsed += actualPollMs
    RunCallbacks()

  RunCallbacks()
  result.ok = self.getAPICallResult(
    steamAPICall,
    result.data.addr,
    sizeof(T).cint,
    callbackExpected,
    result.failed.addr
  )
