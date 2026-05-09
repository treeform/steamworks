# Auto-generated from steam_api.json - do not edit manually.
# Regenerate with: nim r tools/generate_api.nim

import std/os

type
  ISteamClient* = distinct pointer
  ISteamUser* = distinct pointer
  ISteamFriends* = distinct pointer
  ISteamUtils* = distinct pointer
  ISteamMatchmaking* = distinct pointer
  ISteamMatchmakingServerListResponse* = distinct pointer
  ISteamMatchmakingPingResponse* = distinct pointer
  ISteamMatchmakingPlayersResponse* = distinct pointer
  ISteamMatchmakingRulesResponse* = distinct pointer
  ISteamMatchmakingServers* = distinct pointer
  ISteamParties* = distinct pointer
  ISteamRemoteStorage* = distinct pointer
  ISteamUserStats* = distinct pointer
  ISteamApps* = distinct pointer
  ISteamNetworking* = distinct pointer
  ISteamScreenshots* = distinct pointer
  ISteamMusic* = distinct pointer
  ISteamHTTP* = distinct pointer
  ISteamInput* = distinct pointer
  ISteamController* = distinct pointer
  ISteamUGC* = distinct pointer
  ISteamHTMLSurface* = distinct pointer
  ISteamInventory* = distinct pointer
  ISteamTimeline* = distinct pointer
  ISteamVideo* = distinct pointer
  ISteamParentalSettings* = distinct pointer
  ISteamRemotePlay* = distinct pointer
  ISteamNetworkingMessages* = distinct pointer
  ISteamNetworkingSockets* = distinct pointer
  ISteamNetworkingUtils* = distinct pointer
  ISteamGameServer* = distinct pointer
  ISteamGameServerStats* = distinct pointer
  ISteamNetworkingFakeUDPPort* = distinct pointer
  SteamId* = uint64
  GameId* = uint64
  SteamAPIWarningMessageHook* = proc (arg0: cint, arg1: cstring) {.cdecl.}
  AppId* = uint32
  DepotId* = uint32
  RTime32* = uint32
  SteamAPICall* = uint64
  AccountId* = uint32
  PartyBeaconID* = uint64
  HAuthTicket* = uint32
  PFNPreMinidumpCallback* = proc (arg0: pointer) {.cdecl.}
  HSteamPipe* = cint
  HSteamUser* = cint
  SteamErrMsg* = array[1024, char]
  FriendsGroupID* = int16
  HServerListRequest* = pointer
  HServerQuery* = cint
  UGCHandle* = uint64
  PublishedFileUpdateHandle* = uint64
  PublishedFileId* = uint64
  UGCFileWriteStreamHandle* = uint64
  SteamLeaderboard* = uint64
  SteamLeaderboardEntries* = uint64
  SNetSocket* = uint32
  SNetListenSocket* = uint32
  ScreenshotHandle* = uint32
  HTTPRequestHandle* = uint32
  HTTPCookieContainerHandle* = uint32
  InputHandle* = uint64
  InputActionSetHandle* = uint64
  InputDigitalActionHandle* = uint64
  InputAnalogActionHandle* = uint64
  SteamInputActionEventCallbackPointer* = proc (arg0: ptr SteamInputActionEvent) {.cdecl.}
  ControllerHandle* = uint64
  ControllerActionSetHandle* = uint64
  ControllerDigitalActionHandle* = uint64
  ControllerAnalogActionHandle* = uint64
  UGCQueryHandle* = uint64
  UGCUpdateHandle* = uint64
  HHTMLBrowser* = uint32
  SteamItemInstanceID* = uint64
  SteamItemDef* = cint
  SteamInventoryResult* = cint
  SteamInventoryUpdateHandle* = uint64
  TimelineEventHandle* = uint64
  RemotePlaySessionID* = uint32
  RemotePlayCursorID* = uint32
  FnSteamNetConnectionStatusChanged* = proc (arg0: ptr SteamNetConnectionStatusChangedCallback) {.cdecl.}
  FnSteamNetAuthenticationStatusChanged* = proc (arg0: ptr SteamNetAuthenticationStatus) {.cdecl.}
  FnSteamRelayNetworkStatusChanged* = proc (arg0: ptr SteamRelayNetworkStatus) {.cdecl.}
  FnSteamNetworkingMessagesSessionRequest* = proc (arg0: ptr SteamNetworkingMessagesSessionRequest) {.cdecl.}
  FnSteamNetworkingMessagesSessionFailed* = proc (arg0: ptr SteamNetworkingMessagesSessionFailed) {.cdecl.}
  FnSteamNetworkingFakeIPResult* = proc (arg0: ptr SteamNetworkingFakeIPResult) {.cdecl.}
  HSteamNetConnection* = uint32
  HSteamListenSocket* = uint32
  HSteamNetPollGroup* = uint32
  SteamNetworkingErrMsg* = array[1024, char]
  SteamNetworkingPOPID* = uint32
  SteamNetworkingMicroseconds* = int64
  FSteamNetworkingSocketsDebugOutput* = proc (arg0: NetworkingSocketsDebugOutputType, arg1: cstring) {.cdecl.}
  IPType* = int32
  Universe* = int32
  Result* = int32
  VoiceResult* = int32
  DenyReason* = int32
  BeginAuthSessionResult* = int32
  AuthSessionResponse* = int32
  UserHasLicenseForAppResult* = int32
  AccountType* = int32
  ChatEntryType* = int32
  ChatRoomEnterResponse* = int32
  ChatSteamIDInstanceFlags* = int32
  NotificationPosition* = int32
  BroadcastUploadResult* = int32
  MarketNotAllowedReasonFlags* = int32
  DurationControlProgress* = int32
  DurationControlNotification* = int32
  DurationControlOnlineState* = int32
  BetaBranchFlags* = int32
  IPv6ConnectivityProtocol* = int32
  IPv6ConnectivityState* = int32
  FriendRelationship* = int32
  PersonaState* = int32
  FriendFlags* = int32
  OverlayToStoreFlag* = int32
  ActivateGameOverlayToWebPageMode* = int32
  CommunityProfileItemType* = int32
  CommunityProfileItemProperty* = int32
  PersonaChange* = int32
  APICallFailure* = int32
  GamepadTextInputMode* = int32
  GamepadTextInputLineMode* = int32
  FloatingGamepadTextInputMode* = int32
  TextFilteringContext* = int32
  CheckFileSignature* = int32
  MatchMakingServerResponse* = int32
  LobbyType* = int32
  LobbyComparison* = int32
  LobbyDistanceFilter* = int32
  ChatMemberStateChange* = int32
  PartyBeaconLocationType* = int32
  PartyBeaconLocationData* = int32
  RemoteStoragePlatform* = int32
  RemoteStoragePublishedFileVisibility* = int32
  WorkshopFileType* = int32
  WorkshopVote* = int32
  WorkshopFileAction* = int32
  WorkshopEnumerationType* = int32
  WorkshopVideoProvider* = int32
  UGCReadAction* = int32
  RemoteStorageLocalFileChange* = int32
  RemoteStorageFilePathType* = int32
  LeaderboardDataRequest* = int32
  LeaderboardSortMethod* = int32
  LeaderboardDisplayType* = int32
  LeaderboardUploadScoreMethod* = int32
  P2PSessionError* = int32
  P2PSend* = int32
  SNetSocketState* = int32
  SNetSocketConnectionType* = int32
  VRScreenshotType* = int32
  AudioPlayback_Status* = int32
  HTTPMethod* = int32
  HTTPStatusCode* = int32
  InputSourceMode* = int32
  InputActionOrigin* = int32
  XboxOrigin* = int32
  ControllerPad* = int32
  ControllerHapticLocation* = int32
  ControllerHapticType* = int32
  InputType* = int32
  InputConfigurationEnableType* = int32
  InputLEDFlag* = int32
  InputGlyphSize* = int32
  InputGlyphStyle* = int32
  InputActionEventType* = int32
  ControllerActionOrigin* = int32
  ControllerLEDFlag* = int32
  UGCMatchingUGCType* = int32
  UserUGCList* = int32
  UserUGCListSortOrder* = int32
  UGCQuery* = int32
  ItemUpdateStatus* = int32
  ItemState* = int32
  ItemStatistic* = int32
  ItemPreviewType* = int32
  UGCContentDescriptorID* = int32
  ItemFlags* = int32
  TimelineGameMode* = int32
  TimelineEventClipPriority* = int32
  ParentalFeature* = int32
  DeviceFormFactor* = int32
  RemotePlayInputType* = int32
  RemotePlayMouseButton* = int32
  RemotePlayMouseWheelDirection* = int32
  RemotePlayScancode* = int32
  RemotePlayKeyModifier* = int32
  NetworkingAvailability* = int32
  NetworkingIdentityType* = int32
  NetworkingFakeIPType* = int32
  NetworkingConnectionState* = int32
  NetConnectionEnd* = int32
  NetworkingConfigScope* = int32
  NetworkingConfigDataType* = int32
  NetworkingConfigValue* = int32
  NetworkingGetConfigValueResult* = int32
  NetworkingSocketsDebugOutputType* = int32
  InitResult* = int32
  ServerMode* = int32
  HTMLMouseButton* = int32
  HTMLMouseCursor* = int32
  HTMLKeyModifiers* = int32
  FailureType* = int32
  SteamInputActionEventAnalogAction* = object
    actionHandle*: InputAnalogActionHandle
    analogActionData*: InputAnalogActionData

  SteamInputActionEventDigitalAction* = object
    actionHandle*: InputDigitalActionHandle
    digitalActionData*: InputDigitalActionData

  SteamInputActionEventData* {.union.} = object
    analogAction*: SteamInputActionEventAnalogAction
    digitalAction*: SteamInputActionEventDigitalAction

  SteamIPAddress* = object
    rgubIpv6*: array[16, uint8]
    typeValue*: IPType

  FriendGameInfo* = object
    gameId*: GameId
    gameIp*: uint32
    gamePort*: uint16
    queryPort*: uint16
    steamIdLobby*: SteamId

  MatchMakingKeyValuePair* = object
    key*: array[256, char]
    value*: array[256, char]

  ServerNetAdr* = object
    connectionPort*: uint16
    queryPort*: uint16
    ip*: uint32

  GameServerItem* = object
    netAdr*: ServerNetAdr
    ping*: cint
    hadSuccessfulResponse*: bool
    doNotRefresh*: bool
    gameDir*: array[32, char]
    map*: array[32, char]
    gameDescription*: array[64, char]
    appId*: uint32
    players*: cint
    maxPlayers*: cint
    botPlayers*: cint
    password*: bool
    secure*: bool
    timeLastPlayed*: uint32
    serverVersion*: cint
    serverName*: array[64, char]
    gameTags*: array[128, char]
    steamId*: SteamId

  SteamPartyBeaconLocation* = object
    typeValue*: PartyBeaconLocationType
    locationId*: uint64

  SteamParamStringArray* = object
    strings*: ptr cstring
    numStrings*: int32

  LeaderboardEntry* = object
    steamIdUser*: SteamId
    globalRank*: int32
    score*: int32
    details*: int32
    hUgc*: UGCHandle

  P2PSessionState* = object
    connectionActive*: uint8
    connecting*: uint8
    p2PsessionError*: uint8
    usingRelay*: uint8
    bytesQueuedForSend*: int32
    packetsQueuedForSend*: int32
    remoteIp*: uint32
    remotePort*: uint16

  InputAnalogActionData* = object
    mode*: InputSourceMode
    x*: float32
    y*: float32
    active*: bool

  InputDigitalActionData* = object
    state*: bool
    active*: bool

  InputMotionData* = object
    rotQuatX*: float32
    rotQuatY*: float32
    rotQuatZ*: float32
    rotQuatW*: float32
    posAccelX*: float32
    posAccelY*: float32
    posAccelZ*: float32
    rotVelX*: float32
    rotVelY*: float32
    rotVelZ*: float32

  SteamInputActionEvent* = object
    controllerHandle*: InputHandle
    eventType*: InputActionEventType
    data*: SteamInputActionEventData

  SteamUGCDetails* = object
    publishedFileId*: PublishedFileId
    resultValue*: Result
    fileType*: WorkshopFileType
    creatorAppId*: AppId
    consumerAppId*: AppId
    title*: array[129, char]
    description*: array[8000, char]
    steamIdOwner*: uint64
    rtimeCreated*: uint32
    rtimeUpdated*: uint32
    rtimeAddedToUserList*: uint32
    visibility*: RemoteStoragePublishedFileVisibility
    banned*: bool
    acceptedForUse*: bool
    tagsTruncated*: bool
    tags*: array[1025, char]
    hFile*: UGCHandle
    hPreviewFile*: UGCHandle
    fileName*: array[260, char]
    fileSize*: int32
    previewFileSize*: int32
    url*: array[256, char]
    votesUp*: uint32
    votesDown*: uint32
    score*: float32
    numChildren*: uint32
    totalFilesSize*: uint64

  SteamItemDetails* = object
    itemId*: SteamItemInstanceID
    definition*: SteamItemDef
    quantity*: uint16
    flags*: uint16

  RemotePlayInputMouseMotion* = object
    absolute*: bool
    normalizedX*: float32
    normalizedY*: float32
    deltaX*: cint
    deltaY*: cint

  RemotePlayInputMouseWheel* = object
    direction*: RemotePlayMouseWheelDirection
    amount*: float32

  RemotePlayInputKey* = object
    scancode*: cint
    modifiers*: uint32
    keycode*: uint32

  RemotePlayInput* = object
    sessionId*: RemotePlaySessionID
    typeValue*: RemotePlayInputType
    padding*: array[56, char]

  SteamNetworkingIPAddr* = object
    ipv6*: array[16, uint8]
    port*: uint16

  SteamNetworkingIdentity* = object
    typeValue*: NetworkingIdentityType
    size*: cint
    unknownRawString*: array[128, char]

  SteamNetConnectionInfo* = object
    identityRemote*: SteamNetworkingIdentity
    userData*: int64
    hListenSocket*: HSteamListenSocket
    addrRemote*: SteamNetworkingIPAddr
    pad1*: uint16
    idPopRemote*: SteamNetworkingPOPID
    idPopRelay*: SteamNetworkingPOPID
    state*: NetworkingConnectionState
    endReason*: cint
    endDebug*: array[128, char]
    connectionDescription*: array[128, char]
    flags*: cint
    reserved*: array[63, uint32]

  SteamNetConnectionRealTimeStatus* = object
    state*: NetworkingConnectionState
    ping*: cint
    connectionQualityLocal*: float32
    connectionQualityRemote*: float32
    outPacketsPerSec*: float32
    outBytesPerSec*: float32
    inPacketsPerSec*: float32
    inBytesPerSec*: float32
    sendRateBytesPerSecond*: cint
    pendingUnreliable*: cint
    pendingReliable*: cint
    sentUnackedReliable*: cint
    usecQueueTime*: SteamNetworkingMicroseconds
    usecMaxJitter*: int32
    reserved*: array[15, uint32]

  SteamNetConnectionRealTimeLaneStatus* = object
    pendingUnreliable*: cint
    pendingReliable*: cint
    sentUnackedReliable*: cint
    reservePad1*: cint
    usecQueueTime*: SteamNetworkingMicroseconds
    reserved*: array[10, uint32]

  SteamNetworkingMessage* = object
    data*: pointer
    size*: cint
    conn*: HSteamNetConnection
    identityPeer*: SteamNetworkingIdentity
    connUserData*: int64
    usecTimeReceived*: SteamNetworkingMicroseconds
    messageNumber*: int64
    pfnFreeData*: proc (arg0: ptr SteamNetworkingMessage) {.cdecl.}
    pfnRelease*: proc (arg0: ptr SteamNetworkingMessage) {.cdecl.}
    channel*: cint
    flags*: cint
    userData*: int64
    idxLane*: uint16
    pad1*: uint16

  SteamNetworkPingLocation* = object
    data*: array[512, uint8]

  SteamNetworkingConfigValue* = object
    value*: NetworkingConfigValue
    dataType*: NetworkingConfigDataType
    int64*: int64

  SteamDatagramHostedAddress* = object
    size*: cint
    data*: array[128, char]

  SteamDatagramGameCoordinatorServerLogin* = object
    identity*: SteamNetworkingIdentity
    routing*: SteamDatagramHostedAddress
    appId*: AppId
    rtime*: RTime32
    appData*: cint
    appData2*: array[2048, char]

  SteamServersConnected* = object

  SteamServerConnectFailure* = object
    resultValue*: Result
    stillRetrying*: bool

  SteamServersDisconnected* = object
    resultValue*: Result

  ClientGameServerDeny* = object
    appId*: uint32
    gameServerIp*: uint32
    gameServerPort*: uint16
    secure*: uint16
    reason*: uint32

  IPCFailure* = object
    failureType*: uint8

  LicensesUpdated* = object

  ValidateAuthTicketResponse* = object
    steamId*: SteamId
    authSessionResponse*: AuthSessionResponse
    ownerSteamId*: SteamId

  MicroTxnAuthorizationResponse* = object
    appId*: uint32
    orderId*: uint64
    authorized*: uint8

  EncryptedAppTicketResponse* = object
    resultValue*: Result

  GetAuthSessionTicketResponse* = object
    hAuthTicket*: HAuthTicket
    resultValue*: Result

  GameWebCallback* = object
    url*: array[256, char]

  StoreAuthURLResponse* = object
    url*: array[512, char]

  MarketEligibilityResponse* = object
    allowed*: bool
    notAllowedReason*: MarketNotAllowedReasonFlags
    rtAllowedAtTime*: RTime32
    cdaySteamGuardRequiredDays*: cint
    cdayNewDeviceCooldown*: cint

  DurationControl* = object
    resultValue*: Result
    appid*: AppId
    applicable*: bool
    csecsLast5h*: int32
    progress*: DurationControlProgress
    notification*: DurationControlNotification
    csecsToday*: int32
    csecsRemaining*: int32

  GetTicketForWebApiResponse* = object
    hAuthTicket*: HAuthTicket
    resultValue*: Result
    ticket*: cint
    rgubTicket*: array[2560, uint8]

  PersonaStateChange* = object
    steamId*: uint64
    changeFlags*: cint

  GameOverlayActivated* = object
    active*: uint8
    userInitiated*: bool
    appId*: AppId
    dwOverlayPid*: uint32

  GameServerChangeRequested* = object
    server*: array[64, char]
    password*: array[64, char]

  GameLobbyJoinRequested* = object
    steamIdLobby*: SteamId
    steamIdFriend*: SteamId

  AvatarImageLoaded* = object
    steamId*: SteamId
    image*: cint
    wide*: cint
    tall*: cint

  ClanOfficerListResponse* = object
    steamIdClan*: SteamId
    officers*: cint
    success*: uint8

  FriendRichPresenceUpdate* = object
    steamIdFriend*: SteamId
    appId*: AppId

  GameRichPresenceJoinRequested* = object
    steamIdFriend*: SteamId
    connect*: array[256, char]

  GameConnectedClanChatMsg* = object
    steamIdClanChat*: SteamId
    steamIdUser*: SteamId
    messageId*: cint

  GameConnectedChatJoin* = object
    steamIdClanChat*: SteamId
    steamIdUser*: SteamId

  GameConnectedChatLeave* = object
    steamIdClanChat*: SteamId
    steamIdUser*: SteamId
    kicked*: bool
    dropped*: bool

  DownloadClanActivityCountsResult* = object
    success*: bool

  JoinClanChatRoomCompletionResult* = object
    steamIdClanChat*: SteamId
    chatRoomEnterResponse*: ChatRoomEnterResponse

  GameConnectedFriendChatMsg* = object
    steamIdUser*: SteamId
    messageId*: cint

  FriendsGetFollowerCount* = object
    resultValue*: Result
    steamId*: SteamId
    count*: cint

  FriendsIsFollowing* = object
    resultValue*: Result
    steamId*: SteamId
    isFollowing*: bool

  FriendsEnumerateFollowingList* = object
    resultValue*: Result
    rgSteamId*: array[50, SteamId]
    resultsReturned*: int32
    totalResultCount*: int32

  UnreadChatMessagesChanged* = object

  OverlayBrowserProtocolNavigation* = object
    uri*: array[1024, char]

  EquippedProfileItemsChanged* = object
    steamId*: SteamId

  EquippedProfileItems* = object
    resultValue*: Result
    steamId*: SteamId
    hasAnimatedAvatar*: bool
    hasAvatarFrame*: bool
    hasProfileModifier*: bool
    hasProfileBackground*: bool
    hasMiniProfileBackground*: bool
    fromCache*: bool

  IPCountry* = object

  LowBatteryPower* = object
    minutesBatteryLeft*: uint8

  SteamAPICallCompleted* = object
    hAsyncCall*: SteamAPICall
    callback*: cint
    param*: uint32

  SteamShutdown* = object

    checkFileSignature*: CheckFileSignature

  GamepadTextInputDismissed* = object
    submitted*: bool
    submittedText*: uint32
    appId*: AppId

  AppResumingFromSuspend* = object

  FloatingGamepadTextInputDismissed* = object

  FilterTextDictionaryChanged* = object
    language*: cint

  FavoritesListChanged* = object
    ip*: uint32
    queryPort*: uint32
    connPort*: uint32
    appId*: uint32
    flags*: uint32
    add*: bool
    accountId*: AccountId

  LobbyInvite* = object
    steamIdUser*: uint64
    steamIdLobby*: uint64
    gameId*: uint64

  LobbyEnter* = object
    steamIdLobby*: uint64
    rgfChatPermissions*: uint32
    locked*: bool
    echatRoomEnterResponse*: uint32

  LobbyDataUpdate* = object
    steamIdLobby*: uint64
    steamIdMember*: uint64
    success*: uint8

  LobbyChatUpdate* = object
    steamIdLobby*: uint64
    steamIdUserChanged*: uint64
    steamIdMakingChange*: uint64
    rgfChatMemberStateChange*: uint32

  LobbyChatMsg* = object
    steamIdLobby*: uint64
    steamIdUser*: uint64
    chatEntryType*: uint8
    chatId*: uint32

  LobbyGameCreated* = object
    steamIdLobby*: uint64
    steamIdGameServer*: uint64
    ip*: uint32
    port*: uint16

  LobbyMatchList* = object
    lobbiesMatching*: uint32

  LobbyKicked* = object
    steamIdLobby*: uint64
    steamIdAdmin*: uint64
    kickedDueToDisconnect*: uint8

  LobbyCreated* = object
    resultValue*: Result
    steamIdLobby*: uint64

  FavoritesListAccountsUpdated* = object
    resultValue*: Result

  JoinPartyCallback* = object
    resultValue*: Result
    beaconId*: PartyBeaconID
    steamIdBeaconOwner*: SteamId
    connectString*: array[256, char]

  CreateBeaconCallback* = object
    resultValue*: Result
    beaconId*: PartyBeaconID

  ReservationNotificationCallback* = object
    beaconId*: PartyBeaconID
    steamIdJoiner*: SteamId

  ChangeNumOpenSlotsCallback* = object
    resultValue*: Result

  AvailableBeaconLocationsUpdated* = object

  ActiveBeaconsUpdated* = object

  RemoteStorageFileShareResult* = object
    resultValue*: Result
    hFile*: UGCHandle
    filename*: array[260, char]

  RemoteStoragePublishFileResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    userNeedsToAcceptWorkshopLegalAgreement*: bool

  RemoteStorageDeletePublishedFileResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId

  RemoteStorageEnumerateUserPublishedFilesResult* = object
    resultValue*: Result
    resultsReturned*: int32
    totalResultCount*: int32
    rgPublishedFileId*: array[50, PublishedFileId]

  RemoteStorageSubscribePublishedFileResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId

  RemoteStorageEnumerateUserSubscribedFilesResult* = object
    resultValue*: Result
    resultsReturned*: int32
    totalResultCount*: int32
    rgPublishedFileId*: array[50, PublishedFileId]
    rgRtimeSubscribed*: array[50, uint32]

  RemoteStorageUnsubscribePublishedFileResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId

  RemoteStorageUpdatePublishedFileResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    userNeedsToAcceptWorkshopLegalAgreement*: bool

  RemoteStorageDownloadUGCResult* = object
    resultValue*: Result
    hFile*: UGCHandle
    appId*: AppId
    sizeInBytes*: int32
    fileName*: array[260, char]
    steamIdOwner*: uint64

  RemoteStorageGetPublishedFileDetailsResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    creatorAppId*: AppId
    consumerAppId*: AppId
    title*: array[129, char]
    description*: array[8000, char]
    hFile*: UGCHandle
    hPreviewFile*: UGCHandle
    steamIdOwner*: uint64
    rtimeCreated*: uint32
    rtimeUpdated*: uint32
    visibility*: RemoteStoragePublishedFileVisibility
    banned*: bool
    tags*: array[1025, char]
    tagsTruncated*: bool
    fileName*: array[260, char]
    fileSize*: int32
    previewFileSize*: int32
    url*: array[256, char]
    fileType*: WorkshopFileType
    acceptedForUse*: bool

  RemoteStorageEnumerateWorkshopFilesResult* = object
    resultValue*: Result
    resultsReturned*: int32
    totalResultCount*: int32
    rgPublishedFileId*: array[50, PublishedFileId]
    rgScore*: array[50, float32]
    appId*: AppId
    startIndex*: uint32

  RemoteStorageGetPublishedItemVoteDetailsResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    votesFor*: int32
    votesAgainst*: int32
    reports*: int32
    fScore*: float32

  RemoteStoragePublishedFileSubscribed* = object
    publishedFileId*: PublishedFileId
    appId*: AppId

  RemoteStoragePublishedFileUnsubscribed* = object
    publishedFileId*: PublishedFileId
    appId*: AppId

  RemoteStoragePublishedFileDeleted* = object
    publishedFileId*: PublishedFileId
    appId*: AppId

  RemoteStorageUpdateUserPublishedItemVoteResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId

  RemoteStorageUserVoteDetails* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    vote*: WorkshopVote

  RemoteStorageEnumerateUserSharedWorkshopFilesResult* = object
    resultValue*: Result
    resultsReturned*: int32
    totalResultCount*: int32
    rgPublishedFileId*: array[50, PublishedFileId]

  RemoteStorageSetUserPublishedFileActionResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    action*: WorkshopFileAction

  RemoteStorageEnumeratePublishedFilesByUserActionResult* = object
    resultValue*: Result
    action*: WorkshopFileAction
    resultsReturned*: int32
    totalResultCount*: int32
    rgPublishedFileId*: array[50, PublishedFileId]
    rgRtimeUpdated*: array[50, uint32]

  RemoteStoragePublishFileProgress* = object
    dPercentFile*: float64
    preview*: bool

  RemoteStoragePublishedFileUpdated* = object
    publishedFileId*: PublishedFileId
    appId*: AppId
    unused*: uint64

  RemoteStorageFileWriteAsyncComplete* = object
    resultValue*: Result

  RemoteStorageFileReadAsyncComplete* = object
    hFileReadAsync*: SteamAPICall
    resultValue*: Result
    offset*: uint32
    read*: uint32


  UserStatsReceived* = object
    gameId*: uint64
    resultValue*: Result
    steamIdUser*: SteamId

  UserStatsStored* = object
    gameId*: uint64
    resultValue*: Result

  UserAchievementStored* = object
    gameId*: uint64
    groupAchievement*: bool
    achievementName*: array[128, char]
    curProgress*: uint32
    maxProgress*: uint32

  LeaderboardFindResult* = object
    hSteamLeaderboard*: SteamLeaderboard
    leaderboardFound*: uint8

  LeaderboardScoresDownloaded* = object
    hSteamLeaderboard*: SteamLeaderboard
    hSteamLeaderboardEntries*: SteamLeaderboardEntries
    entryCount*: cint

  LeaderboardScoreUploaded* = object
    success*: uint8
    hSteamLeaderboard*: SteamLeaderboard
    score*: int32
    scoreChanged*: uint8
    globalRankNew*: cint
    globalRankPrevious*: cint

  NumberOfCurrentPlayers* = object
    success*: uint8
    players*: int32

  UserStatsUnloaded* = object
    steamIdUser*: SteamId

  UserAchievementIconFetched* = object
    gameId*: GameId
    achievementName*: array[128, char]
    achieved*: bool
    iconHandle*: cint

  GlobalAchievementPercentagesReady* = object
    gameId*: uint64
    resultValue*: Result

  LeaderboardUGCSet* = object
    resultValue*: Result
    hSteamLeaderboard*: SteamLeaderboard

  GlobalStatsReceived* = object
    gameId*: uint64
    resultValue*: Result

  DlcInstalled* = object
    appId*: AppId

  NewUrlLaunchParameters* = object

  AppProofOfPurchaseKeyResponse* = object
    resultValue*: Result
    appId*: uint32
    keyLength*: uint32
    key*: array[240, char]

  FileDetailsResult* = object
    resultValue*: Result
    fileSize*: uint64
    fileSha*: array[20, uint8]
    flags*: uint32

  TimedTrialStatus* = object
    appId*: AppId
    isOffline*: bool
    secondsAllowed*: uint32
    secondsPlayed*: uint32

  P2PSessionRequest* = object
    steamIdRemote*: SteamId

  P2PSessionConnectFail* = object
    steamIdRemote*: SteamId
    p2PsessionError*: uint8

  SocketStatusCallback* = object
    hSocket*: SNetSocket
    hListenSocket*: SNetListenSocket
    steamIdRemote*: SteamId
    snetSocketState*: cint

  ScreenshotReady* = object
    hLocal*: ScreenshotHandle
    resultValue*: Result

  ScreenshotRequested* = object

  PlaybackStatusHasChanged* = object

  VolumeHasChanged* = object
    newVolume*: float32

  HTTPRequestCompleted* = object
    hRequest*: HTTPRequestHandle
    contextValue*: uint64
    requestSuccessful*: bool
    statusCode*: HTTPStatusCode
    bodySize*: uint32

  HTTPRequestHeadersReceived* = object
    hRequest*: HTTPRequestHandle
    contextValue*: uint64

  HTTPRequestDataReceived* = object
    hRequest*: HTTPRequestHandle
    contextValue*: uint64
    offset*: uint32
    bytesReceived*: uint32

  SteamInputDeviceConnected* = object
    connectedDeviceHandle*: InputHandle

  SteamInputDeviceDisconnected* = object
    disconnectedDeviceHandle*: InputHandle

  SteamInputConfigurationLoaded* = object
    appId*: AppId
    deviceHandle*: InputHandle
    mappingCreator*: SteamId
    majorRevision*: uint32
    minorRevision*: uint32
    usesSteamInputApi*: bool
    usesGamepadApi*: bool

  SteamInputGamepadSlotChange* = object
    appId*: AppId
    deviceHandle*: InputHandle
    deviceType*: InputType
    oldGamepadSlot*: cint
    newGamepadSlot*: cint

  SteamUGCQueryCompleted* = object
    handle*: UGCQueryHandle
    resultValue*: Result
    numResultsReturned*: uint32
    totalMatchingResults*: uint32
    cachedData*: bool
    nextCursor*: array[256, char]

  SteamUGCRequestUGCDetailsResult* = object
    details*: SteamUGCDetails
    cachedData*: bool

  CreateItemResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    userNeedsToAcceptWorkshopLegalAgreement*: bool

  SubmitItemUpdateResult* = object
    resultValue*: Result
    userNeedsToAcceptWorkshopLegalAgreement*: bool
    publishedFileId*: PublishedFileId

  ItemInstalled* = object
    appId*: AppId
    publishedFileId*: PublishedFileId
    hLegacyContent*: UGCHandle
    manifestId*: uint64

  DownloadItemResult* = object
    appId*: AppId
    publishedFileId*: PublishedFileId
    resultValue*: Result

  UserFavoriteItemsListChanged* = object
    publishedFileId*: PublishedFileId
    resultValue*: Result
    wasAddRequest*: bool

  SetUserItemVoteResult* = object
    publishedFileId*: PublishedFileId
    resultValue*: Result
    voteUp*: bool

  GetUserItemVoteResult* = object
    publishedFileId*: PublishedFileId
    resultValue*: Result
    votedUp*: bool
    votedDown*: bool
    voteSkipped*: bool

  StartPlaytimeTrackingResult* = object
    resultValue*: Result

  StopPlaytimeTrackingResult* = object
    resultValue*: Result

  AddUGCDependencyResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    childPublishedFileId*: PublishedFileId

  RemoveUGCDependencyResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    childPublishedFileId*: PublishedFileId

  AddAppDependencyResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    appId*: AppId

  RemoveAppDependencyResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    appId*: AppId

  GetAppDependenciesResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId
    rgAppIds*: array[32, AppId]
    numAppDependencies*: uint32
    totalNumAppDependencies*: uint32

  DeleteItemResult* = object
    resultValue*: Result
    publishedFileId*: PublishedFileId

  UserSubscribedItemsListChanged* = object
    appId*: AppId

  WorkshopEULAStatus* = object
    resultValue*: Result
    appId*: AppId
    version*: uint32
    rtAction*: RTime32
    accepted*: bool
    needsAction*: bool

  HTML_BrowserReady* = object
    browserHandle*: HHTMLBrowser

  HTML_NeedsPaint* = object
    browserHandle*: HHTMLBrowser
    bgra*: cstring
    wide*: uint32
    tall*: uint32
    updateX*: uint32
    updateY*: uint32
    updateWide*: uint32
    updateTall*: uint32
    scrollX*: uint32
    scrollY*: uint32
    pageScale*: float32
    pageSerial*: uint32

  HTML_StartRequest* = object
    browserHandle*: HHTMLBrowser
    url*: cstring
    target*: cstring
    postData*: cstring
    isRedirect*: bool

  HTML_CloseBrowser* = object
    browserHandle*: HHTMLBrowser

  HTML_URLChanged* = object
    browserHandle*: HHTMLBrowser
    url*: cstring
    postData*: cstring
    isRedirect*: bool
    pageTitle*: cstring
    newNavigation*: bool

  HTML_FinishedRequest* = object
    browserHandle*: HHTMLBrowser
    url*: cstring
    pageTitle*: cstring

  HTML_OpenLinkInNewTab* = object
    browserHandle*: HHTMLBrowser
    url*: cstring

  HTML_ChangedTitle* = object
    browserHandle*: HHTMLBrowser
    title*: cstring

  HTML_SearchResults* = object
    browserHandle*: HHTMLBrowser
    results*: uint32
    currentMatch*: uint32

  HTML_CanGoBackAndForward* = object
    browserHandle*: HHTMLBrowser
    canGoBack*: bool
    canGoForward*: bool

  HTML_HorizontalScroll* = object
    browserHandle*: HHTMLBrowser
    scrollMax*: uint32
    scrollCurrent*: uint32
    pageScale*: float32
    visible*: bool
    pageSize*: uint32

  HTML_VerticalScroll* = object
    browserHandle*: HHTMLBrowser
    scrollMax*: uint32
    scrollCurrent*: uint32
    pageScale*: float32
    visible*: bool
    pageSize*: uint32

  HTML_LinkAtPosition* = object
    browserHandle*: HHTMLBrowser
    x*: uint32
    y*: uint32
    url*: cstring
    input*: bool
    liveLink*: bool

  HTML_JSAlert* = object
    browserHandle*: HHTMLBrowser
    message*: cstring

  HTML_JSConfirm* = object
    browserHandle*: HHTMLBrowser
    message*: cstring

  HTML_FileOpenDialog* = object
    browserHandle*: HHTMLBrowser
    title*: cstring
    initialFile*: cstring

  HTML_NewWindow* = object
    browserHandle*: HHTMLBrowser
    url*: cstring
    x*: uint32
    y*: uint32
    wide*: uint32
    tall*: uint32
    newWindowBrowserHandleIgnore*: HHTMLBrowser

  HTML_SetCursor* = object
    browserHandle*: HHTMLBrowser
    mouseCursor*: uint32

  HTML_StatusText* = object
    browserHandle*: HHTMLBrowser
    msg*: cstring

  HTML_ShowToolTip* = object
    browserHandle*: HHTMLBrowser
    msg*: cstring

  HTML_UpdateToolTip* = object
    browserHandle*: HHTMLBrowser
    msg*: cstring

  HTML_HideToolTip* = object
    browserHandle*: HHTMLBrowser

  HTML_BrowserRestarted* = object
    browserHandle*: HHTMLBrowser
    oldBrowserHandle*: HHTMLBrowser

  SteamInventoryResultReady* = object
    handle*: SteamInventoryResult
    resultValue*: Result

  SteamInventoryFullUpdate* = object
    handle*: SteamInventoryResult

  SteamInventoryDefinitionUpdate* = object

  SteamInventoryEligiblePromoItemDefIDs* = object
    resultValue*: Result
    steamId*: SteamId
    numEligiblePromoItemDefs*: cint
    cachedData*: bool

  SteamInventoryStartPurchaseResult* = object
    resultValue*: Result
    orderId*: uint64
    transId*: uint64

  SteamInventoryRequestPricesResult* = object
    resultValue*: Result
    currency*: array[4, char]

  SteamTimelineGamePhaseRecordingExists* = object
    phaseId*: array[64, char]
    recordingMs*: uint64
    longestClipMs*: uint64
    clipCount*: uint32
    screenshotCount*: uint32

  SteamTimelineEventRecordingExists* = object
    eventId*: uint64
    recordingExists*: bool

  GetVideoURLResult* = object
    resultValue*: Result
    videoAppId*: AppId
    url*: array[256, char]

  GetOPFSettingsResult* = object
    resultValue*: Result
    videoAppId*: AppId

  BroadcastUploadStart* = object
    isRtmp*: bool

  BroadcastUploadStop* = object
    resultValue*: BroadcastUploadResult

  SteamParentalSettingsChanged* = object

  SteamRemotePlaySessionConnected* = object
    sessionId*: RemotePlaySessionID

  SteamRemotePlaySessionDisconnected* = object
    sessionId*: RemotePlaySessionID

  SteamRemotePlayTogetherGuestInvite* = object
    connectUrl*: array[1024, char]

  SteamRemotePlaySessionAvatarLoaded* = object
    sessionId*: RemotePlaySessionID
    image*: cint
    wide*: cint
    tall*: cint

  SteamNetworkingMessagesSessionRequest* = object
    identityRemote*: SteamNetworkingIdentity

  SteamNetworkingMessagesSessionFailed* = object
    info*: SteamNetConnectionInfo

  SteamNetConnectionStatusChangedCallback* = object
    hConn*: HSteamNetConnection
    info*: SteamNetConnectionInfo
    oldState*: NetworkingConnectionState

  SteamNetAuthenticationStatus* = object
    avail*: NetworkingAvailability
    debugMsg*: array[256, char]

  SteamRelayNetworkStatus* = object
    avail*: NetworkingAvailability
    pingMeasurementInProgress*: cint
    availNetworkConfig*: NetworkingAvailability
    availAnyRelay*: NetworkingAvailability
    debugMsg*: array[256, char]

  GSClientApprove* = object
    steamId*: SteamId
    ownerSteamId*: SteamId

  GSClientDeny* = object
    steamId*: SteamId
    denyReason*: DenyReason
    optionalText*: array[128, char]

  GSClientKick* = object
    steamId*: SteamId
    denyReason*: DenyReason

  GSClientAchievementStatus* = object
    steamId*: uint64
    achievement*: array[128, char]
    unlocked*: bool

  GSPolicyResponse* = object
    secure*: uint8

  GSGameplayStats* = object
    resultValue*: Result
    rank*: int32
    totalConnects*: uint32
    totalMinutesPlayed*: uint32

  GSClientGroupStatus* = object
    steamIdUser*: SteamId
    steamIdGroup*: SteamId
    member*: bool
    officer*: bool

  GSReputation* = object
    resultValue*: Result
    reputationScore*: uint32
    banned*: bool
    bannedIp*: uint32
    bannedPort*: uint16
    bannedGameId*: uint64
    banExpires*: uint32

  AssociateWithClanResult* = object
    resultValue*: Result

  ComputeNewPlayerCompatibilityResult* = object
    resultValue*: Result
    playersThatDontLikeCandidate*: cint
    playersThatCandidateDoesntLike*: cint
    clanPlayersThatDontLikeCandidate*: cint
    steamIdCandidate*: SteamId

  GSStatsReceived* = object
    resultValue*: Result
    steamIdUser*: SteamId

  GSStatsStored* = object
    resultValue*: Result
    steamIdUser*: SteamId

  GSStatsUnloaded* = object
    steamIdUser*: SteamId

  SteamNetworkingFakeIPResult* = object
    resultValue*: Result
    identity*: SteamNetworkingIdentity
    ip*: uint32
    ports*: array[8, uint16]


proc isNil*(self: ISteamClient): bool {.borrow.}
proc isNil*(self: ISteamUser): bool {.borrow.}
proc isNil*(self: ISteamFriends): bool {.borrow.}
proc isNil*(self: ISteamUtils): bool {.borrow.}
proc isNil*(self: ISteamMatchmaking): bool {.borrow.}
proc isNil*(self: ISteamMatchmakingServerListResponse): bool {.borrow.}
proc isNil*(self: ISteamMatchmakingPingResponse): bool {.borrow.}
proc isNil*(self: ISteamMatchmakingPlayersResponse): bool {.borrow.}
proc isNil*(self: ISteamMatchmakingRulesResponse): bool {.borrow.}
proc isNil*(self: ISteamMatchmakingServers): bool {.borrow.}
proc isNil*(self: ISteamParties): bool {.borrow.}
proc isNil*(self: ISteamRemoteStorage): bool {.borrow.}
proc isNil*(self: ISteamUserStats): bool {.borrow.}
proc isNil*(self: ISteamApps): bool {.borrow.}
proc isNil*(self: ISteamNetworking): bool {.borrow.}
proc isNil*(self: ISteamScreenshots): bool {.borrow.}
proc isNil*(self: ISteamMusic): bool {.borrow.}
proc isNil*(self: ISteamHTTP): bool {.borrow.}
proc isNil*(self: ISteamInput): bool {.borrow.}
proc isNil*(self: ISteamController): bool {.borrow.}
proc isNil*(self: ISteamUGC): bool {.borrow.}
proc isNil*(self: ISteamHTMLSurface): bool {.borrow.}
proc isNil*(self: ISteamInventory): bool {.borrow.}
proc isNil*(self: ISteamTimeline): bool {.borrow.}
proc isNil*(self: ISteamVideo): bool {.borrow.}
proc isNil*(self: ISteamParentalSettings): bool {.borrow.}
proc isNil*(self: ISteamRemotePlay): bool {.borrow.}
proc isNil*(self: ISteamNetworkingMessages): bool {.borrow.}
proc isNil*(self: ISteamNetworkingSockets): bool {.borrow.}
proc isNil*(self: ISteamNetworkingUtils): bool {.borrow.}
proc isNil*(self: ISteamGameServer): bool {.borrow.}
proc isNil*(self: ISteamGameServerStats): bool {.borrow.}
proc isNil*(self: ISteamNetworkingFakeUDPPort): bool {.borrow.}

const
  appIdInvalid* = 0x0
  depotIdInvalid* = 0x0
  apiCallInvalid* = 0x0
  accountIdInvalid* = 0
  partyBeaconIdInvalid* = 0
  hauthTicketInvalid* = 0
  steamAccountIdMask* = 0xFFFFFFFF
  steamAccountInstanceMask* = 0x000FFFFF
  steamUserDefaultInstance* = 1
  gameExtraInfoMax* = 64
  maxSteamErrMsg* = 1024
  maxFriendsGroupName* = 64
  friendsGroupLimit* = 100
  friendsGroupIdInvalid* = -1
  enumerateFollowersMax* = 50
  friendGameInfoQueryPortNotInitialized* = 0xFFFF
  friendGameInfoQueryPortError* = 0xFFFE
  chatMetadataMax* = 8192
  maxGameServerGameDir* = 32
  maxGameServerMapName* = 32
  maxGameServerGameDescription* = 64
  maxGameServerName* = 64
  maxGameServerTags* = 128
  maxGameServerGameData* = 2048
  hserverqueryInvalid* = 0xffffffff
  favoriteFlagNone* = 0x00
  favoriteFlagFavorite* = 0x01
  favoriteFlagHistory* = 0x02
  maxCloudFileChunkSize* = 100 * 1024 * 1024
  publishedFileIdInvalid* = 0
  ugcHandleInvalid* = 0xffffffffffffffff'u64
  publishedFileUpdateHandleInvalid* = 0xffffffffffffffff'u64
  ugcFileStreamHandleInvalid* = 0xffffffffffffffff'u64
  publishedDocumentTitleMax* = 128 + 1
  publishedDocumentDescriptionMax* = 8000
  publishedDocumentChangeDescriptionMax* = 8000
  enumeratePublishedFilesMaxResults* = 50
  tagListMax* = 1024 + 1
  filenameMax* = 260
  publishedFileUrlMax* = 256
  appProofOfPurchaseKeyMax* = 240
  screenshotMaxTaggedUsers* = 32
  screenshotMaxTaggedPublishedFiles* = 32
  ufsTagTypeMax* = 255
  ufsTagValueMax* = 255
  screenshotThumbWidth* = 200
  ugcQueryHandleInvalid* = 0xffffffffffffffff'u64
  ugcUpdateHandleInvalid* = 0xffffffffffffffff'u64
  numUgcResultsPerPage* = 50
  developerMetadataMax* = 5000
  invalidHtmlbrowser* = 0
  itemInstanceIdInvalid* = high(SteamItemInstanceID)
  inventoryResultInvalid* = -1
  inventoryUpdateHandleInvalid* = 0xffffffffffffffff'u64
  maxTimelinePriority* = 1000
  timelinePriorityKeepCurrentValue* = 1000000
  maxTimelineEventDuration* = 600.0'f32
  maxPhaseIdLength* = 64
  hsteamNetConnectionInvalid* = 0
  hsteamListenSocketInvalid* = 0
  hsteamNetPollGroupInvalid* = 0
  maxSteamNetworkingErrMsg* = 1024
  steamNetworkingMaxConnectionCloseReason* = 128
  steamNetworkingMaxConnectionDescription* = 128
  steamNetworkingMaxConnectionAppName* = 32
  steamNetworkConnectionInfoFlagsUnauthenticated* = 1
  steamNetworkConnectionInfoFlagsUnencrypted* = 2
  steamNetworkConnectionInfoFlagsLoopbackBuffers* = 4
  steamNetworkConnectionInfoFlagsFast* = 8
  steamNetworkConnectionInfoFlagsRelayed* = 16
  steamNetworkConnectionInfoFlagsDualWifi* = 32
  maxSteamNetworkingSocketsMessageSizeSend* = 512 * 1024
  steamNetworkingSendUnreliable* = 0
  steamNetworkingSendNoNagle* = 1
  steamNetworkingSendUnreliableNoNagle* = steamNetworkingSendUnreliable or steamNetworkingSendNoNagle
  steamNetworkingSendNoDelay* = 4
  steamNetworkingSendUnreliableNoDelay* = steamNetworkingSendUnreliable or steamNetworkingSendNoDelay or steamNetworkingSendNoNagle
  steamNetworkingSendReliable* = 8
  steamNetworkingSendReliableNoNagle* = steamNetworkingSendReliable or steamNetworkingSendNoNagle
  steamNetworkingSendUseCurrentThread* = 16
  steamNetworkingSendAutoRestartBrokenSession* = 32
  maxSteamNetworkingPingLocationString* = 1024
  steamNetworkingPingFailed* = -1
  steamNetworkingPingUnknown* = -2
  steamNetworkingConfigP2PTransportIceEnableDefault* = -1
  steamNetworkingConfigP2PTransportIceEnableDisable* = 0
  steamNetworkingConfigP2PTransportIceEnableRelay* = 1
  steamNetworkingConfigP2PTransportIceEnablePrivate* = 2
  steamNetworkingConfigP2PTransportIceEnablePublic* = 4
  steamNetworkingConfigP2PTransportIceEnableAll* = 0x7fffffff
  datagramPopidDev* = ( 100 shl 16 ) or ( 101 shl 8 ) or 118
  steamgameserverQueryPortShared* = 0xffff
  masterserverupdaterportUsegamesocketshare* = steamgameserverQueryPortShared
  steamDatagramMaxSerializedTicket* = 512
  maxSteamDatagramGameCoordinatorServerLoginAppData* = 2048
  maxSteamDatagramGameCoordinatorServerLoginSerialized* = 4096
  steamNetworkingSocketsFakeUdpPortRecommendedMtu* = 1200
  steamNetworkingSocketsFakeUdpPortMaxMessageSize* = 4096

# IPType
const
  ipTypeIpv4* = 0
  ipTypeIpv6* = 1

# Universe
const
  universeInvalid* = 0
  universePublic* = 1
  universeBeta* = 2
  universeInternal* = 3
  universeDev* = 4
  universeMax* = 5

# Result
const
  resultNone* = 0
  resultOk* = 1
  resultFail* = 2
  resultNoConnection* = 3
  resultInvalidPassword* = 5
  resultLoggedInElsewhere* = 6
  resultInvalidProtocolVer* = 7
  resultInvalidParam* = 8
  resultFileNotFound* = 9
  resultBusy* = 10
  resultInvalidState* = 11
  resultInvalidName* = 12
  resultInvalidEmail* = 13
  resultDuplicateName* = 14
  resultAccessDenied* = 15
  resultTimeout* = 16
  resultBanned* = 17
  resultAccountNotFound* = 18
  resultInvalidSteamId* = 19
  resultServiceUnavailable* = 20
  resultNotLoggedOn* = 21
  resultPending* = 22
  resultEncryptionFailure* = 23
  resultInsufficientPrivilege* = 24
  resultLimitExceeded* = 25
  resultRevoked* = 26
  resultExpired* = 27
  resultAlreadyRedeemed* = 28
  resultDuplicateRequest* = 29
  resultAlreadyOwned* = 30
  resultIpNotFound* = 31
  resultPersistFailed* = 32
  resultLockingFailed* = 33
  resultLogonSessionReplaced* = 34
  resultConnectFailed* = 35
  resultHandshakeFailed* = 36
  resultIoFailure* = 37
  resultRemoteDisconnect* = 38
  resultShoppingCartNotFound* = 39
  resultBlocked* = 40
  resultIgnored* = 41
  resultNoMatch* = 42
  resultAccountDisabled* = 43
  resultServiceReadOnly* = 44
  resultAccountNotFeatured* = 45
  resultAdministratorOk* = 46
  resultContentVersion* = 47
  resultTryAnotherCm* = 48
  resultPasswordRequiredToKickSession* = 49
  resultAlreadyLoggedInElsewhere* = 50
  resultSuspended* = 51
  resultCancelled* = 52
  resultDataCorruption* = 53
  resultDiskFull* = 54
  resultRemoteCallFailed* = 55
  resultPasswordUnset* = 56
  resultExternalAccountUnlinked* = 57
  resultPsnTicketInvalid* = 58
  resultExternalAccountAlreadyLinked* = 59
  resultRemoteFileConflict* = 60
  resultIllegalPassword* = 61
  resultSameAsPreviousValue* = 62
  resultAccountLogonDenied* = 63
  resultCannotUseOldPassword* = 64
  resultInvalidLoginAuthCode* = 65
  resultAccountLogonDeniedNoMail* = 66
  resultHardwareNotCapableOfIpt* = 67
  resultIptInitError* = 68
  resultParentalControlRestricted* = 69
  resultFacebookQueryError* = 70
  resultExpiredLoginAuthCode* = 71
  resultIpLoginRestrictionFailed* = 72
  resultAccountLockedDown* = 73
  resultAccountLogonDeniedVerifiedEmailRequired* = 74
  resultNoMatchingUrl* = 75
  resultBadResponse* = 76
  resultRequirePasswordReEntry* = 77
  resultValueOutOfRange* = 78
  resultUnexpectedError* = 79
  resultDisabled* = 80
  resultInvalidCegSubmission* = 81
  resultRestrictedDevice* = 82
  resultRegionLocked* = 83
  resultRateLimitExceeded* = 84
  resultAccountLoginDeniedNeedTwoFactor* = 85
  resultItemDeleted* = 86
  resultAccountLoginDeniedThrottle* = 87
  resultTwoFactorCodeMismatch* = 88
  resultTwoFactorActivationCodeMismatch* = 89
  resultAccountAssociatedToMultiplePartners* = 90
  resultNotModified* = 91
  resultNoMobileDevice* = 92
  resultTimeNotSynced* = 93
  resultSmsCodeFailed* = 94
  resultAccountLimitExceeded* = 95
  resultAccountActivityLimitExceeded* = 96
  resultPhoneActivityLimitExceeded* = 97
  resultRefundToWallet* = 98
  resultEmailSendFailure* = 99
  resultNotSettled* = 100
  resultNeedCaptcha* = 101
  resultGsltDenied* = 102
  resultGsOwnerDenied* = 103
  resultInvalidItemType* = 104
  resultIpBanned* = 105
  resultGsltExpired* = 106
  resultInsufficientFunds* = 107
  resultTooManyPending* = 108
  resultNoSiteLicensesFound* = 109
  resultWgNetworkSendExceeded* = 110
  resultAccountNotFriends* = 111
  resultLimitedUserAccount* = 112
  resultCantRemoveItem* = 113
  resultAccountDeleted* = 114
  resultExistingUserCancelledLicense* = 115
  resultCommunityCooldown* = 116
  resultNoLauncherSpecified* = 117
  resultMustAgreeToSsa* = 118
  resultLauncherMigrated* = 119
  resultSteamRealmMismatch* = 120
  resultInvalidSignature* = 121
  resultParseFailure* = 122
  resultNoVerifiedPhone* = 123
  resultInsufficientBattery* = 124
  resultChargerRequired* = 125
  resultCachedCredentialInvalid* = 126
  resultPhoneNumberIsVoip* = 127
  resultNotSupported* = 128
  resultFamilySizeLimitExceeded* = 129
  resultOfflineAppCacheInvalid* = 130
  resultTryLater* = 131

# VoiceResult
const
  voiceResultOk* = 0
  voiceResultNotInitialized* = 1
  voiceResultNotRecording* = 2
  voiceResultNoData* = 3
  voiceResultBufferTooSmall* = 4
  voiceResultDataCorrupted* = 5
  voiceResultRestricted* = 6
  voiceResultUnsupportedCodec* = 7
  voiceResultReceiverOutOfDate* = 8
  voiceResultReceiverDidNotAnswer* = 9

# DenyReason
const
  denyInvalid* = 0
  denyInvalidVersion* = 1
  denyGeneric* = 2
  denyNotLoggedOn* = 3
  denyNoLicense* = 4
  denyCheater* = 5
  denyLoggedInElseWhere* = 6
  denyUnknownText* = 7
  denyIncompatibleAnticheat* = 8
  denyMemoryCorruption* = 9
  denyIncompatibleSoftware* = 10
  denySteamConnectionLost* = 11
  denySteamConnectionError* = 12
  denySteamResponseTimedOut* = 13
  denySteamValidationStalled* = 14
  denySteamOwnerLeftGuestUser* = 15

# BeginAuthSessionResult
const
  beginAuthSessionResultOk* = 0
  beginAuthSessionResultInvalidTicket* = 1
  beginAuthSessionResultDuplicateRequest* = 2
  beginAuthSessionResultInvalidVersion* = 3
  beginAuthSessionResultGameMismatch* = 4
  beginAuthSessionResultExpiredTicket* = 5

# AuthSessionResponse
const
  authSessionResponseOk* = 0
  authSessionResponseUserNotConnectedToSteam* = 1
  authSessionResponseNoLicenseOrExpired* = 2
  authSessionResponseVacBanned* = 3
  authSessionResponseLoggedInElseWhere* = 4
  authSessionResponseVacCheckTimedOut* = 5
  authSessionResponseAuthTicketCanceled* = 6
  authSessionResponseAuthTicketInvalidAlreadyUsed* = 7
  authSessionResponseAuthTicketInvalid* = 8
  authSessionResponsePublisherIssuedBan* = 9
  authSessionResponseAuthTicketNetworkIdentityFailure* = 10

# UserHasLicenseForAppResult
const
  userHasLicenseResultHasLicense* = 0
  userHasLicenseResultDoesNotHaveLicense* = 1
  userHasLicenseResultNoAuth* = 2

# AccountType
const
  accountTypeInvalid* = 0
  accountTypeIndividual* = 1
  accountTypeMultiseat* = 2
  accountTypeGameServer* = 3
  accountTypeAnonGameServer* = 4
  accountTypePending* = 5
  accountTypeContentServer* = 6
  accountTypeClan* = 7
  accountTypeChat* = 8
  accountTypeConsoleUser* = 9
  accountTypeAnonUser* = 10
  accountTypeMax* = 11

# ChatEntryType
const
  chatEntryTypeInvalid* = 0
  chatEntryTypeChatMsg* = 1
  chatEntryTypeTyping* = 2
  chatEntryTypeInviteGame* = 3
  chatEntryTypeEmote* = 4
  chatEntryTypeLeftConversation* = 6
  chatEntryTypeEntered* = 7
  chatEntryTypeWasKicked* = 8
  chatEntryTypeWasBanned* = 9
  chatEntryTypeDisconnected* = 10
  chatEntryTypeHistoricalChat* = 11
  chatEntryTypeLinkBlocked* = 14

# ChatRoomEnterResponse
const
  chatRoomEnterResponseSuccess* = 1
  chatRoomEnterResponseDoesntExist* = 2
  chatRoomEnterResponseNotAllowed* = 3
  chatRoomEnterResponseFull* = 4
  chatRoomEnterResponseError* = 5
  chatRoomEnterResponseBanned* = 6
  chatRoomEnterResponseLimited* = 7
  chatRoomEnterResponseClanDisabled* = 8
  chatRoomEnterResponseCommunityBan* = 9
  chatRoomEnterResponseMemberBlockedYou* = 10
  chatRoomEnterResponseYouBlockedMember* = 11
  chatRoomEnterResponseRatelimitExceeded* = 15

# ChatSteamIDInstanceFlags
const
  chatAccountInstanceMask* = 4095
  chatInstanceFlagClan* = 524288
  chatInstanceFlagLobby* = 262144
  chatInstanceFlagMmsLobby* = 131072

# NotificationPosition
const
  positionInvalid* = -1
  positionTopLeft* = 0
  positionTopRight* = 1
  positionBottomLeft* = 2
  positionBottomRight* = 3

# BroadcastUploadResult
const
  broadcastUploadResultNone* = 0
  broadcastUploadResultOk* = 1
  broadcastUploadResultInitFailed* = 2
  broadcastUploadResultFrameFailed* = 3
  broadcastUploadResultTimeout* = 4
  broadcastUploadResultBandwidthExceeded* = 5
  broadcastUploadResultLowFps* = 6
  broadcastUploadResultMissingKeyFrames* = 7
  broadcastUploadResultNoConnection* = 8
  broadcastUploadResultRelayFailed* = 9
  broadcastUploadResultSettingsChanged* = 10
  broadcastUploadResultMissingAudio* = 11
  broadcastUploadResultTooFarBehind* = 12
  broadcastUploadResultTranscodeBehind* = 13
  broadcastUploadResultNotAllowedToPlay* = 14
  broadcastUploadResultBusy* = 15
  broadcastUploadResultBanned* = 16
  broadcastUploadResultAlreadyActive* = 17
  broadcastUploadResultForcedOff* = 18
  broadcastUploadResultAudioBehind* = 19
  broadcastUploadResultShutdown* = 20
  broadcastUploadResultDisconnect* = 21
  broadcastUploadResultVideoInitFailed* = 22
  broadcastUploadResultAudioInitFailed* = 23

# MarketNotAllowedReasonFlags
const
  marketNotAllowedReasonNone* = 0
  marketNotAllowedReasonTemporaryFailure* = 1
  marketNotAllowedReasonAccountDisabled* = 2
  marketNotAllowedReasonAccountLockedDown* = 4
  marketNotAllowedReasonAccountLimited* = 8
  marketNotAllowedReasonTradeBanned* = 16
  marketNotAllowedReasonAccountNotTrusted* = 32
  marketNotAllowedReasonSteamGuardNotEnabled* = 64
  marketNotAllowedReasonSteamGuardOnlyRecentlyEnabled* = 128
  marketNotAllowedReasonRecentPasswordReset* = 256
  marketNotAllowedReasonNewPaymentMethod* = 512
  marketNotAllowedReasonInvalidCookie* = 1024
  marketNotAllowedReasonUsingNewDevice* = 2048
  marketNotAllowedReasonRecentSelfRefund* = 4096
  marketNotAllowedReasonNewPaymentMethodCannotBeVerified* = 8192
  marketNotAllowedReasonNoRecentPurchases* = 16384
  marketNotAllowedReasonAcceptedWalletGift* = 32768
  marketNotAllowedReasonTradeCooldown* = 65536

# DurationControlProgress
const
  durationControlProgressFull* = 0
  durationControlProgressHalf* = 1
  durationControlProgressNone* = 2
  durationControlExitSoon3h* = 3
  durationControlExitSoon5h* = 4
  durationControlExitSoonNight* = 5

# DurationControlNotification
const
  durationControlNotificationNone* = 0
  durationControlNotification1Hour* = 1
  durationControlNotification3Hours* = 2
  durationControlNotificationHalfProgress* = 3
  durationControlNotificationNoProgress* = 4
  durationControlNotificationExitSoon3h* = 5
  durationControlNotificationExitSoon5h* = 6
  durationControlNotificationExitSoonNight* = 7

# DurationControlOnlineState
const
  durationControlOnlineStateInvalid* = 0
  durationControlOnlineStateOffline* = 1
  durationControlOnlineStateOnline* = 2
  durationControlOnlineStateOnlineHighPri* = 3

# BetaBranchFlags
const
  betaBranchNone* = 0
  betaBranchDefault* = 1
  betaBranchAvailable* = 2
  betaBranchPrivate* = 4
  betaBranchSelected* = 8
  betaBranchInstalled* = 16

# IPv6ConnectivityProtocol
const
  ipv6ConnectivityProtocolInvalid* = 0
  ipv6ConnectivityProtocolHttp* = 1
  ipv6ConnectivityProtocolUdp* = 2

# IPv6ConnectivityState
const
  ipv6ConnectivityStateUnknown* = 0
  ipv6ConnectivityStateGood* = 1
  ipv6ConnectivityStateBad* = 2

# FriendRelationship
const
  friendRelationshipNone* = 0
  friendRelationshipBlocked* = 1
  friendRelationshipRequestRecipient* = 2
  friendRelationshipFriend* = 3
  friendRelationshipRequestInitiator* = 4
  friendRelationshipIgnored* = 5
  friendRelationshipIgnoredFriend* = 6
  friendRelationshipSuggestedDeprecated* = 7
  friendRelationshipMax* = 8

# PersonaState
const
  personaStateOffline* = 0
  personaStateOnline* = 1
  personaStateBusy* = 2
  personaStateAway* = 3
  personaStateSnooze* = 4
  personaStateLookingToTrade* = 5
  personaStateLookingToPlay* = 6
  personaStateInvisible* = 7
  personaStateMax* = 8

# FriendFlags
const
  friendFlagNone* = 0
  friendFlagBlocked* = 1
  friendFlagFriendshipRequested* = 2
  friendFlagImmediate* = 4
  friendFlagClanMember* = 8
  friendFlagOnGameServer* = 16
  friendFlagRequestingFriendship* = 128
  friendFlagRequestingInfo* = 256
  friendFlagIgnored* = 512
  friendFlagIgnoredFriend* = 1024
  friendFlagChatMember* = 4096
  friendFlagAll* = 65535

# OverlayToStoreFlag
const
  overlayToStoreFlagNone* = 0
  overlayToStoreFlagAddToCart* = 1
  overlayToStoreFlagAddToCartAndShow* = 2

# ActivateGameOverlayToWebPageMode
const
  activateGameOverlayToWebPageModeDefault* = 0
  activateGameOverlayToWebPageModeModal* = 1

# CommunityProfileItemType
const
  communityProfileItemTypeAnimatedAvatar* = 0
  communityProfileItemTypeAvatarFrame* = 1
  communityProfileItemTypeProfileModifier* = 2
  communityProfileItemTypeProfileBackground* = 3
  communityProfileItemTypeMiniProfileBackground* = 4

# CommunityProfileItemProperty
const
  communityProfileItemPropertyImageSmall* = 0
  communityProfileItemPropertyImageLarge* = 1
  communityProfileItemPropertyInternalName* = 2
  communityProfileItemPropertyTitle* = 3
  communityProfileItemPropertyDescription* = 4
  communityProfileItemPropertyAppId* = 5
  communityProfileItemPropertyTypeId* = 6
  communityProfileItemPropertyClass* = 7
  communityProfileItemPropertyMovieWebM* = 8
  communityProfileItemPropertyMovieMp4* = 9
  communityProfileItemPropertyMovieWebMsmall* = 10
  communityProfileItemPropertyMovieMp4Small* = 11

# PersonaChange
const
  personaChangeName* = 1
  personaChangeStatus* = 2
  personaChangeComeOnline* = 4
  personaChangeGoneOffline* = 8
  personaChangeGamePlayed* = 16
  personaChangeGameServer* = 32
  personaChangeAvatar* = 64
  personaChangeJoinedSource* = 128
  personaChangeLeftSource* = 256
  personaChangeRelationshipChanged* = 512
  personaChangeNameFirstSet* = 1024
  personaChangeBroadcast* = 2048
  personaChangeNickname* = 4096
  personaChangeSteamLevel* = 8192
  personaChangeRichPresence* = 16384

# APICallFailure
const
  apiCallFailureNone* = -1
  apiCallFailureSteamGone* = 0
  apiCallFailureNetworkFailure* = 1
  apiCallFailureInvalidHandle* = 2
  apiCallFailureMismatchedCallback* = 3

# GamepadTextInputMode
const
  gamepadTextInputModeNormal* = 0
  gamepadTextInputModePassword* = 1

# GamepadTextInputLineMode
const
  gamepadTextInputLineModeSingleLine* = 0
  gamepadTextInputLineModeMultipleLines* = 1

# FloatingGamepadTextInputMode
const
  floatingGamepadTextInputModeModeSingleLine* = 0
  floatingGamepadTextInputModeModeMultipleLines* = 1
  floatingGamepadTextInputModeModeEmail* = 2
  floatingGamepadTextInputModeModeNumeric* = 3

# TextFilteringContext
const
  textFilteringContextUnknown* = 0
  textFilteringContextGameContent* = 1
  textFilteringContextChat* = 2
  textFilteringContextName* = 3

# CheckFileSignature
const
  checkFileSignatureInvalidSignature* = 0
  checkFileSignatureValidSignature* = 1
  checkFileSignatureFileNotFound* = 2
  checkFileSignatureNoSignaturesFoundForThisApp* = 3
  checkFileSignatureNoSignaturesFoundForThisFile* = 4

# MatchMakingServerResponse
const
  eServerResponded* = 0
  eServerFailedToRespond* = 1
  eNoServersListedOnMasterServer* = 2

# LobbyType
const
  lobbyTypePrivate* = 0
  lobbyTypeFriendsOnly* = 1
  lobbyTypePublic* = 2
  lobbyTypeInvisible* = 3
  lobbyTypePrivateUnique* = 4

# LobbyComparison
const
  lobbyComparisonEqualToOrLessThan* = -2
  lobbyComparisonLessThan* = -1
  lobbyComparisonEqual* = 0
  lobbyComparisonGreaterThan* = 1
  lobbyComparisonEqualToOrGreaterThan* = 2
  lobbyComparisonNotEqual* = 3

# LobbyDistanceFilter
const
  lobbyDistanceFilterClose* = 0
  lobbyDistanceFilterDefault* = 1
  lobbyDistanceFilterFar* = 2
  lobbyDistanceFilterWorldwide* = 3

# ChatMemberStateChange
const
  chatMemberStateChangeEntered* = 1
  chatMemberStateChangeLeft* = 2
  chatMemberStateChangeDisconnected* = 4
  chatMemberStateChangeKicked* = 8
  chatMemberStateChangeBanned* = 16

# PartyBeaconLocationType
const
  partyBeaconLocationTypeInvalid* = 0
  partyBeaconLocationTypeChatGroup* = 1
  partyBeaconLocationTypeMax* = 2

# PartyBeaconLocationData
const
  partyBeaconLocationDataInvalid* = 0
  partyBeaconLocationDataName* = 1
  partyBeaconLocationDataIconUrlSmall* = 2
  partyBeaconLocationDataIconUrlMedium* = 3
  partyBeaconLocationDataIconUrlLarge* = 4

# RemoteStoragePlatform
const
  remoteStoragePlatformNone* = 0
  remoteStoragePlatformWindows* = 1
  remoteStoragePlatformOsx* = 2
  remoteStoragePlatformPs3* = 4
  remoteStoragePlatformLinux* = 8
  remoteStoragePlatformSwitch* = 16
  remoteStoragePlatformAndroid* = 32
  remoteStoragePlatformIos* = 64
  remoteStoragePlatformAll* = -1

# RemoteStoragePublishedFileVisibility
const
  remoteStoragePublishedFileVisibilityPublic* = 0
  remoteStoragePublishedFileVisibilityFriendsOnly* = 1
  remoteStoragePublishedFileVisibilityPrivate* = 2
  remoteStoragePublishedFileVisibilityUnlisted* = 3

# WorkshopFileType
const
  workshopFileTypeFirst* = 0
  workshopFileTypeCommunity* = 0
  workshopFileTypeMicrotransaction* = 1
  workshopFileTypeCollection* = 2
  workshopFileTypeArt* = 3
  workshopFileTypeVideo* = 4
  workshopFileTypeScreenshot* = 5
  workshopFileTypeGame* = 6
  workshopFileTypeSoftware* = 7
  workshopFileTypeConcept* = 8
  workshopFileTypeWebGuide* = 9
  workshopFileTypeIntegratedGuide* = 10
  workshopFileTypeMerch* = 11
  workshopFileTypeControllerBinding* = 12
  workshopFileTypeSteamworksAccessInvite* = 13
  workshopFileTypeSteamVideo* = 14
  workshopFileTypeGameManagedItem* = 15
  workshopFileTypeClip* = 16
  workshopFileTypeMax* = 17

# WorkshopVote
const
  workshopVoteUnvoted* = 0
  workshopVoteFor* = 1
  workshopVoteAgainst* = 2
  workshopVoteLater* = 3

# WorkshopFileAction
const
  workshopFileActionPlayed* = 0
  workshopFileActionCompleted* = 1

# WorkshopEnumerationType
const
  workshopEnumerationTypeRankedByVote* = 0
  workshopEnumerationTypeRecent* = 1
  workshopEnumerationTypeTrending* = 2
  workshopEnumerationTypeFavoritesOfFriends* = 3
  workshopEnumerationTypeVotedByFriends* = 4
  workshopEnumerationTypeContentByFriends* = 5
  workshopEnumerationTypeRecentFromFollowedUsers* = 6

# WorkshopVideoProvider
const
  workshopVideoProviderNone* = 0
  workshopVideoProviderYoutube* = 1

# UGCReadAction
const
  ugcReadContinueReadingUntilFinished* = 0
  ugcReadContinueReading* = 1
  ugcReadClose* = 2

# RemoteStorageLocalFileChange
const
  remoteStorageLocalFileChangeInvalid* = 0
  remoteStorageLocalFileChangeFileUpdated* = 1
  remoteStorageLocalFileChangeFileDeleted* = 2

# RemoteStorageFilePathType
const
  remoteStorageFilePathTypeInvalid* = 0
  remoteStorageFilePathTypeAbsolute* = 1
  remoteStorageFilePathTypeApiFilename* = 2

# LeaderboardDataRequest
const
  leaderboardDataRequestGlobal* = 0
  leaderboardDataRequestGlobalAroundUser* = 1
  leaderboardDataRequestFriends* = 2
  leaderboardDataRequestUsers* = 3

# LeaderboardSortMethod
const
  leaderboardSortMethodNone* = 0
  leaderboardSortMethodAscending* = 1
  leaderboardSortMethodDescending* = 2

# LeaderboardDisplayType
const
  leaderboardDisplayTypeNone* = 0
  leaderboardDisplayTypeNumeric* = 1
  leaderboardDisplayTypeTimeSeconds* = 2
  leaderboardDisplayTypeTimeMilliSeconds* = 3

# LeaderboardUploadScoreMethod
const
  leaderboardUploadScoreMethodNone* = 0
  leaderboardUploadScoreMethodKeepBest* = 1
  leaderboardUploadScoreMethodForceUpdate* = 2

# P2PSessionError
const
  p2PsessionErrorNone* = 0
  p2PsessionErrorNoRightsToApp* = 2
  p2PsessionErrorTimeout* = 4
  p2PsessionErrorNotRunningAppDeleted* = 1
  p2PsessionErrorDestinationNotLoggedInDeleted* = 3
  p2PsessionErrorMax* = 5

# P2PSend
const
  p2PsendUnreliable* = 0
  p2PsendUnreliableNoDelay* = 1
  p2PsendReliable* = 2
  p2PsendReliableWithBuffering* = 3

# SNetSocketState
const
  snetSocketStateInvalid* = 0
  snetSocketStateConnected* = 1
  snetSocketStateInitiated* = 10
  snetSocketStateLocalCandidatesFound* = 11
  snetSocketStateReceivedRemoteCandidates* = 12
  snetSocketStateChallengeHandshake* = 15
  snetSocketStateDisconnecting* = 21
  snetSocketStateLocalDisconnect* = 22
  snetSocketStateTimeoutDuringConnect* = 23
  snetSocketStateRemoteEndDisconnected* = 24
  snetSocketStateConnectionBroken* = 25

# SNetSocketConnectionType
const
  snetSocketConnectionTypeNotConnected* = 0
  snetSocketConnectionTypeUdp* = 1
  snetSocketConnectionTypeUdpRelay* = 2

# VRScreenshotType
const
  vrScreenshotTypeNone* = 0
  vrScreenshotTypeMono* = 1
  vrScreenshotTypeStereo* = 2
  vrScreenshotTypeMonoCubemap* = 3
  vrScreenshotTypeMonoPanorama* = 4
  vrScreenshotTypeStereoPanorama* = 5

# AudioPlayback_Status
const
  audioPlaybackUndefined* = 0
  audioPlaybackPlaying* = 1
  audioPlaybackPaused* = 2
  audioPlaybackIdle* = 3

# HTTPMethod
const
  httpMethodInvalid* = 0
  httpMethodGet* = 1
  httpMethodHead* = 2
  httpMethodPost* = 3
  httpMethodPut* = 4
  httpMethodDelete* = 5
  httpMethodOptions* = 6
  httpMethodPatch* = 7

# HTTPStatusCode
const
  httpStatusCodeInvalid* = 0
  httpStatusCode100Continue* = 100
  httpStatusCode101SwitchingProtocols* = 101
  httpStatusCode200Ok* = 200
  httpStatusCode201Created* = 201
  httpStatusCode202Accepted* = 202
  httpStatusCode203NonAuthoritative* = 203
  httpStatusCode204NoContent* = 204
  httpStatusCode205ResetContent* = 205
  httpStatusCode206PartialContent* = 206
  httpStatusCode300MultipleChoices* = 300
  httpStatusCode301MovedPermanently* = 301
  httpStatusCode302Found* = 302
  httpStatusCode303SeeOther* = 303
  httpStatusCode304NotModified* = 304
  httpStatusCode305UseProxy* = 305
  httpStatusCode307TemporaryRedirect* = 307
  httpStatusCode308PermanentRedirect* = 308
  httpStatusCode400BadRequest* = 400
  httpStatusCode401Unauthorized* = 401
  httpStatusCode402PaymentRequired* = 402
  httpStatusCode403Forbidden* = 403
  httpStatusCode404NotFound* = 404
  httpStatusCode405MethodNotAllowed* = 405
  httpStatusCode406NotAcceptable* = 406
  httpStatusCode407ProxyAuthRequired* = 407
  httpStatusCode408RequestTimeout* = 408
  httpStatusCode409Conflict* = 409
  httpStatusCode410Gone* = 410
  httpStatusCode411LengthRequired* = 411
  httpStatusCode412PreconditionFailed* = 412
  httpStatusCode413RequestEntityTooLarge* = 413
  httpStatusCode414RequestUriTooLong* = 414
  httpStatusCode415UnsupportedMediaType* = 415
  httpStatusCode416RequestedRangeNotSatisfiable* = 416
  httpStatusCode417ExpectationFailed* = 417
  httpStatusCode4xxUnknown* = 418
  httpStatusCode421MisdirectedRequest* = 421
  httpStatusCode422UnprocessableContent* = 422
  httpStatusCode423Locked* = 423
  httpStatusCode424FailedDependency* = 424
  httpStatusCode425TooEarly* = 425
  httpStatusCode426UpgradeRequired* = 426
  httpStatusCode428PreconditionRequired* = 428
  httpStatusCode429TooManyRequests* = 429
  httpStatusCode431RequestHeaderFieldsTooLarge* = 431
  httpStatusCode444ConnectionClosed* = 444
  httpStatusCode451UnavailableForLegalReasons* = 451
  httpStatusCode500InternalServerError* = 500
  httpStatusCode501NotImplemented* = 501
  httpStatusCode502BadGateway* = 502
  httpStatusCode503ServiceUnavailable* = 503
  httpStatusCode504GatewayTimeout* = 504
  httpStatusCode505HttpVersionNotSupported* = 505
  httpStatusCode506VariantAlsoNegotiates* = 506
  httpStatusCode507InsufficientStorage* = 507
  httpStatusCode508LoopDetected* = 508
  httpStatusCode510NotExtended* = 510
  httpStatusCode511NetworkAuthenticationRequired* = 511
  httpStatusCode5xxUnknown* = 599

# InputSourceMode
const
  inputSourceModeNone* = 0
  inputSourceModeDpad* = 1
  inputSourceModeButtons* = 2
  inputSourceModeFourButtons* = 3
  inputSourceModeAbsoluteMouse* = 4
  inputSourceModeRelativeMouse* = 5
  inputSourceModeJoystickMove* = 6
  inputSourceModeJoystickMouse* = 7
  inputSourceModeJoystickCamera* = 8
  inputSourceModeScrollWheel* = 9
  inputSourceModeTrigger* = 10
  inputSourceModeTouchMenu* = 11
  inputSourceModeMouseJoystick* = 12
  inputSourceModeMouseRegion* = 13
  inputSourceModeRadialMenu* = 14
  inputSourceModeSingleButton* = 15
  inputSourceModeSwitches* = 16

# InputActionOrigin
const
  inputActionOriginNone* = 0
  inputActionOriginSteamControllerA* = 1
  inputActionOriginSteamControllerB* = 2
  inputActionOriginSteamControllerX* = 3
  inputActionOriginSteamControllerY* = 4
  inputActionOriginSteamControllerLeftBumper* = 5
  inputActionOriginSteamControllerRightBumper* = 6
  inputActionOriginSteamControllerLeftGrip* = 7
  inputActionOriginSteamControllerRightGrip* = 8
  inputActionOriginSteamControllerStart* = 9
  inputActionOriginSteamControllerBack* = 10
  inputActionOriginSteamControllerLeftPadTouch* = 11
  inputActionOriginSteamControllerLeftPadSwipe* = 12
  inputActionOriginSteamControllerLeftPadClick* = 13
  inputActionOriginSteamControllerLeftPadDpadNorth* = 14
  inputActionOriginSteamControllerLeftPadDpadSouth* = 15
  inputActionOriginSteamControllerLeftPadDpadWest* = 16
  inputActionOriginSteamControllerLeftPadDpadEast* = 17
  inputActionOriginSteamControllerRightPadTouch* = 18
  inputActionOriginSteamControllerRightPadSwipe* = 19
  inputActionOriginSteamControllerRightPadClick* = 20
  inputActionOriginSteamControllerRightPadDpadNorth* = 21
  inputActionOriginSteamControllerRightPadDpadSouth* = 22
  inputActionOriginSteamControllerRightPadDpadWest* = 23
  inputActionOriginSteamControllerRightPadDpadEast* = 24
  inputActionOriginSteamControllerLeftTriggerPull* = 25
  inputActionOriginSteamControllerLeftTriggerClick* = 26
  inputActionOriginSteamControllerRightTriggerPull* = 27
  inputActionOriginSteamControllerRightTriggerClick* = 28
  inputActionOriginSteamControllerLeftStickMove* = 29
  inputActionOriginSteamControllerLeftStickClick* = 30
  inputActionOriginSteamControllerLeftStickDpadNorth* = 31
  inputActionOriginSteamControllerLeftStickDpadSouth* = 32
  inputActionOriginSteamControllerLeftStickDpadWest* = 33
  inputActionOriginSteamControllerLeftStickDpadEast* = 34
  inputActionOriginSteamControllerGyroMove* = 35
  inputActionOriginSteamControllerGyroPitch* = 36
  inputActionOriginSteamControllerGyroYaw* = 37
  inputActionOriginSteamControllerGyroRoll* = 38
  inputActionOriginSteamControllerReserved0* = 39
  inputActionOriginSteamControllerReserved1* = 40
  inputActionOriginSteamControllerReserved2* = 41
  inputActionOriginSteamControllerReserved3* = 42
  inputActionOriginSteamControllerReserved4* = 43
  inputActionOriginSteamControllerReserved5* = 44
  inputActionOriginSteamControllerReserved6* = 45
  inputActionOriginSteamControllerReserved7* = 46
  inputActionOriginSteamControllerReserved8* = 47
  inputActionOriginSteamControllerReserved9* = 48
  inputActionOriginSteamControllerReserved10* = 49
  inputActionOriginPs4X* = 50
  inputActionOriginPs4Circle* = 51
  inputActionOriginPs4Triangle* = 52
  inputActionOriginPs4Square* = 53
  inputActionOriginPs4LeftBumper* = 54
  inputActionOriginPs4RightBumper* = 55
  inputActionOriginPs4Options* = 56
  inputActionOriginPs4Share* = 57
  inputActionOriginPs4LeftPadTouch* = 58
  inputActionOriginPs4LeftPadSwipe* = 59
  inputActionOriginPs4LeftPadClick* = 60
  inputActionOriginPs4LeftPadDpadNorth* = 61
  inputActionOriginPs4LeftPadDpadSouth* = 62
  inputActionOriginPs4LeftPadDpadWest* = 63
  inputActionOriginPs4LeftPadDpadEast* = 64
  inputActionOriginPs4RightPadTouch* = 65
  inputActionOriginPs4RightPadSwipe* = 66
  inputActionOriginPs4RightPadClick* = 67
  inputActionOriginPs4RightPadDpadNorth* = 68
  inputActionOriginPs4RightPadDpadSouth* = 69
  inputActionOriginPs4RightPadDpadWest* = 70
  inputActionOriginPs4RightPadDpadEast* = 71
  inputActionOriginPs4CenterPadTouch* = 72
  inputActionOriginPs4CenterPadSwipe* = 73
  inputActionOriginPs4CenterPadClick* = 74
  inputActionOriginPs4CenterPadDpadNorth* = 75
  inputActionOriginPs4CenterPadDpadSouth* = 76
  inputActionOriginPs4CenterPadDpadWest* = 77
  inputActionOriginPs4CenterPadDpadEast* = 78
  inputActionOriginPs4LeftTriggerPull* = 79
  inputActionOriginPs4LeftTriggerClick* = 80
  inputActionOriginPs4RightTriggerPull* = 81
  inputActionOriginPs4RightTriggerClick* = 82
  inputActionOriginPs4LeftStickMove* = 83
  inputActionOriginPs4LeftStickClick* = 84
  inputActionOriginPs4LeftStickDpadNorth* = 85
  inputActionOriginPs4LeftStickDpadSouth* = 86
  inputActionOriginPs4LeftStickDpadWest* = 87
  inputActionOriginPs4LeftStickDpadEast* = 88
  inputActionOriginPs4RightStickMove* = 89
  inputActionOriginPs4RightStickClick* = 90
  inputActionOriginPs4RightStickDpadNorth* = 91
  inputActionOriginPs4RightStickDpadSouth* = 92
  inputActionOriginPs4RightStickDpadWest* = 93
  inputActionOriginPs4RightStickDpadEast* = 94
  inputActionOriginPs4DpadNorth* = 95
  inputActionOriginPs4DpadSouth* = 96
  inputActionOriginPs4DpadWest* = 97
  inputActionOriginPs4DpadEast* = 98
  inputActionOriginPs4GyroMove* = 99
  inputActionOriginPs4GyroPitch* = 100
  inputActionOriginPs4GyroYaw* = 101
  inputActionOriginPs4GyroRoll* = 102
  inputActionOriginPs4DpadMove* = 103
  inputActionOriginPs4Reserved1* = 104
  inputActionOriginPs4Reserved2* = 105
  inputActionOriginPs4Reserved3* = 106
  inputActionOriginPs4Reserved4* = 107
  inputActionOriginPs4Reserved5* = 108
  inputActionOriginPs4Reserved6* = 109
  inputActionOriginPs4Reserved7* = 110
  inputActionOriginPs4Reserved8* = 111
  inputActionOriginPs4Reserved9* = 112
  inputActionOriginPs4Reserved10* = 113
  inputActionOriginXboxOneA* = 114
  inputActionOriginXboxOneB* = 115
  inputActionOriginXboxOneX* = 116
  inputActionOriginXboxOneY* = 117
  inputActionOriginXboxOneLeftBumper* = 118
  inputActionOriginXboxOneRightBumper* = 119
  inputActionOriginXboxOneMenu* = 120
  inputActionOriginXboxOneView* = 121
  inputActionOriginXboxOneLeftTriggerPull* = 122
  inputActionOriginXboxOneLeftTriggerClick* = 123
  inputActionOriginXboxOneRightTriggerPull* = 124
  inputActionOriginXboxOneRightTriggerClick* = 125
  inputActionOriginXboxOneLeftStickMove* = 126
  inputActionOriginXboxOneLeftStickClick* = 127
  inputActionOriginXboxOneLeftStickDpadNorth* = 128
  inputActionOriginXboxOneLeftStickDpadSouth* = 129
  inputActionOriginXboxOneLeftStickDpadWest* = 130
  inputActionOriginXboxOneLeftStickDpadEast* = 131
  inputActionOriginXboxOneRightStickMove* = 132
  inputActionOriginXboxOneRightStickClick* = 133
  inputActionOriginXboxOneRightStickDpadNorth* = 134
  inputActionOriginXboxOneRightStickDpadSouth* = 135
  inputActionOriginXboxOneRightStickDpadWest* = 136
  inputActionOriginXboxOneRightStickDpadEast* = 137
  inputActionOriginXboxOneDpadNorth* = 138
  inputActionOriginXboxOneDpadSouth* = 139
  inputActionOriginXboxOneDpadWest* = 140
  inputActionOriginXboxOneDpadEast* = 141
  inputActionOriginXboxOneDpadMove* = 142
  inputActionOriginXboxOneLeftGripLower* = 143
  inputActionOriginXboxOneLeftGripUpper* = 144
  inputActionOriginXboxOneRightGripLower* = 145
  inputActionOriginXboxOneRightGripUpper* = 146
  inputActionOriginXboxOneShare* = 147
  inputActionOriginXboxOneReserved6* = 148
  inputActionOriginXboxOneReserved7* = 149
  inputActionOriginXboxOneReserved8* = 150
  inputActionOriginXboxOneReserved9* = 151
  inputActionOriginXboxOneReserved10* = 152
  inputActionOriginXbox360A* = 153
  inputActionOriginXbox360B* = 154
  inputActionOriginXbox360X* = 155
  inputActionOriginXbox360Y* = 156
  inputActionOriginXbox360LeftBumper* = 157
  inputActionOriginXbox360RightBumper* = 158
  inputActionOriginXbox360Start* = 159
  inputActionOriginXbox360Back* = 160
  inputActionOriginXbox360LeftTriggerPull* = 161
  inputActionOriginXbox360LeftTriggerClick* = 162
  inputActionOriginXbox360RightTriggerPull* = 163
  inputActionOriginXbox360RightTriggerClick* = 164
  inputActionOriginXbox360LeftStickMove* = 165
  inputActionOriginXbox360LeftStickClick* = 166
  inputActionOriginXbox360LeftStickDpadNorth* = 167
  inputActionOriginXbox360LeftStickDpadSouth* = 168
  inputActionOriginXbox360LeftStickDpadWest* = 169
  inputActionOriginXbox360LeftStickDpadEast* = 170
  inputActionOriginXbox360RightStickMove* = 171
  inputActionOriginXbox360RightStickClick* = 172
  inputActionOriginXbox360RightStickDpadNorth* = 173
  inputActionOriginXbox360RightStickDpadSouth* = 174
  inputActionOriginXbox360RightStickDpadWest* = 175
  inputActionOriginXbox360RightStickDpadEast* = 176
  inputActionOriginXbox360DpadNorth* = 177
  inputActionOriginXbox360DpadSouth* = 178
  inputActionOriginXbox360DpadWest* = 179
  inputActionOriginXbox360DpadEast* = 180
  inputActionOriginXbox360DpadMove* = 181
  inputActionOriginXbox360Reserved1* = 182
  inputActionOriginXbox360Reserved2* = 183
  inputActionOriginXbox360Reserved3* = 184
  inputActionOriginXbox360Reserved4* = 185
  inputActionOriginXbox360Reserved5* = 186
  inputActionOriginXbox360Reserved6* = 187
  inputActionOriginXbox360Reserved7* = 188
  inputActionOriginXbox360Reserved8* = 189
  inputActionOriginXbox360Reserved9* = 190
  inputActionOriginXbox360Reserved10* = 191
  inputActionOriginSwitchA* = 192
  inputActionOriginSwitchB* = 193
  inputActionOriginSwitchX* = 194
  inputActionOriginSwitchY* = 195
  inputActionOriginSwitchLeftBumper* = 196
  inputActionOriginSwitchRightBumper* = 197
  inputActionOriginSwitchPlus* = 198
  inputActionOriginSwitchMinus* = 199
  inputActionOriginSwitchCapture* = 200
  inputActionOriginSwitchLeftTriggerPull* = 201
  inputActionOriginSwitchLeftTriggerClick* = 202
  inputActionOriginSwitchRightTriggerPull* = 203
  inputActionOriginSwitchRightTriggerClick* = 204
  inputActionOriginSwitchLeftStickMove* = 205
  inputActionOriginSwitchLeftStickClick* = 206
  inputActionOriginSwitchLeftStickDpadNorth* = 207
  inputActionOriginSwitchLeftStickDpadSouth* = 208
  inputActionOriginSwitchLeftStickDpadWest* = 209
  inputActionOriginSwitchLeftStickDpadEast* = 210
  inputActionOriginSwitchRightStickMove* = 211
  inputActionOriginSwitchRightStickClick* = 212
  inputActionOriginSwitchRightStickDpadNorth* = 213
  inputActionOriginSwitchRightStickDpadSouth* = 214
  inputActionOriginSwitchRightStickDpadWest* = 215
  inputActionOriginSwitchRightStickDpadEast* = 216
  inputActionOriginSwitchDpadNorth* = 217
  inputActionOriginSwitchDpadSouth* = 218
  inputActionOriginSwitchDpadWest* = 219
  inputActionOriginSwitchDpadEast* = 220
  inputActionOriginSwitchProGyroMove* = 221
  inputActionOriginSwitchProGyroPitch* = 222
  inputActionOriginSwitchProGyroYaw* = 223
  inputActionOriginSwitchProGyroRoll* = 224
  inputActionOriginSwitchDpadMove* = 225
  inputActionOriginSwitchReserved1* = 226
  inputActionOriginSwitchReserved2* = 227
  inputActionOriginSwitchReserved3* = 228
  inputActionOriginSwitchReserved4* = 229
  inputActionOriginSwitchReserved5* = 230
  inputActionOriginSwitchReserved6* = 231
  inputActionOriginSwitchReserved7* = 232
  inputActionOriginSwitchReserved8* = 233
  inputActionOriginSwitchReserved9* = 234
  inputActionOriginSwitchReserved10* = 235
  inputActionOriginSwitchRightGyroMove* = 236
  inputActionOriginSwitchRightGyroPitch* = 237
  inputActionOriginSwitchRightGyroYaw* = 238
  inputActionOriginSwitchRightGyroRoll* = 239
  inputActionOriginSwitchLeftGyroMove* = 240
  inputActionOriginSwitchLeftGyroPitch* = 241
  inputActionOriginSwitchLeftGyroYaw* = 242
  inputActionOriginSwitchLeftGyroRoll* = 243
  inputActionOriginSwitchLeftGripLower* = 244
  inputActionOriginSwitchLeftGripUpper* = 245
  inputActionOriginSwitchRightGripLower* = 246
  inputActionOriginSwitchRightGripUpper* = 247
  inputActionOriginSwitchJoyConButtonN* = 248
  inputActionOriginSwitchJoyConButtonE* = 249
  inputActionOriginSwitchJoyConButtonS* = 250
  inputActionOriginSwitchJoyConButtonW* = 251
  inputActionOriginSwitchReserved15* = 252
  inputActionOriginSwitchReserved16* = 253
  inputActionOriginSwitchReserved17* = 254
  inputActionOriginSwitchReserved18* = 255
  inputActionOriginSwitchReserved19* = 256
  inputActionOriginSwitchReserved20* = 257
  inputActionOriginPs5X* = 258
  inputActionOriginPs5Circle* = 259
  inputActionOriginPs5Triangle* = 260
  inputActionOriginPs5Square* = 261
  inputActionOriginPs5LeftBumper* = 262
  inputActionOriginPs5RightBumper* = 263
  inputActionOriginPs5Option* = 264
  inputActionOriginPs5Create* = 265
  inputActionOriginPs5Mute* = 266
  inputActionOriginPs5LeftPadTouch* = 267
  inputActionOriginPs5LeftPadSwipe* = 268
  inputActionOriginPs5LeftPadClick* = 269
  inputActionOriginPs5LeftPadDpadNorth* = 270
  inputActionOriginPs5LeftPadDpadSouth* = 271
  inputActionOriginPs5LeftPadDpadWest* = 272
  inputActionOriginPs5LeftPadDpadEast* = 273
  inputActionOriginPs5RightPadTouch* = 274
  inputActionOriginPs5RightPadSwipe* = 275
  inputActionOriginPs5RightPadClick* = 276
  inputActionOriginPs5RightPadDpadNorth* = 277
  inputActionOriginPs5RightPadDpadSouth* = 278
  inputActionOriginPs5RightPadDpadWest* = 279
  inputActionOriginPs5RightPadDpadEast* = 280
  inputActionOriginPs5CenterPadTouch* = 281
  inputActionOriginPs5CenterPadSwipe* = 282
  inputActionOriginPs5CenterPadClick* = 283
  inputActionOriginPs5CenterPadDpadNorth* = 284
  inputActionOriginPs5CenterPadDpadSouth* = 285
  inputActionOriginPs5CenterPadDpadWest* = 286
  inputActionOriginPs5CenterPadDpadEast* = 287
  inputActionOriginPs5LeftTriggerPull* = 288
  inputActionOriginPs5LeftTriggerClick* = 289
  inputActionOriginPs5RightTriggerPull* = 290
  inputActionOriginPs5RightTriggerClick* = 291
  inputActionOriginPs5LeftStickMove* = 292
  inputActionOriginPs5LeftStickClick* = 293
  inputActionOriginPs5LeftStickDpadNorth* = 294
  inputActionOriginPs5LeftStickDpadSouth* = 295
  inputActionOriginPs5LeftStickDpadWest* = 296
  inputActionOriginPs5LeftStickDpadEast* = 297
  inputActionOriginPs5RightStickMove* = 298
  inputActionOriginPs5RightStickClick* = 299
  inputActionOriginPs5RightStickDpadNorth* = 300
  inputActionOriginPs5RightStickDpadSouth* = 301
  inputActionOriginPs5RightStickDpadWest* = 302
  inputActionOriginPs5RightStickDpadEast* = 303
  inputActionOriginPs5DpadNorth* = 304
  inputActionOriginPs5DpadSouth* = 305
  inputActionOriginPs5DpadWest* = 306
  inputActionOriginPs5DpadEast* = 307
  inputActionOriginPs5GyroMove* = 308
  inputActionOriginPs5GyroPitch* = 309
  inputActionOriginPs5GyroYaw* = 310
  inputActionOriginPs5GyroRoll* = 311
  inputActionOriginPs5DpadMove* = 312
  inputActionOriginPs5LeftGrip* = 313
  inputActionOriginPs5RightGrip* = 314
  inputActionOriginPs5LeftFn* = 315
  inputActionOriginPs5RightFn* = 316
  inputActionOriginPs5Reserved5* = 317
  inputActionOriginPs5Reserved6* = 318
  inputActionOriginPs5Reserved7* = 319
  inputActionOriginPs5Reserved8* = 320
  inputActionOriginPs5Reserved9* = 321
  inputActionOriginPs5Reserved10* = 322
  inputActionOriginPs5Reserved11* = 323
  inputActionOriginPs5Reserved12* = 324
  inputActionOriginPs5Reserved13* = 325
  inputActionOriginPs5Reserved14* = 326
  inputActionOriginPs5Reserved15* = 327
  inputActionOriginPs5Reserved16* = 328
  inputActionOriginPs5Reserved17* = 329
  inputActionOriginPs5Reserved18* = 330
  inputActionOriginPs5Reserved19* = 331
  inputActionOriginPs5Reserved20* = 332
  inputActionOriginSteamDeckA* = 333
  inputActionOriginSteamDeckB* = 334
  inputActionOriginSteamDeckX* = 335
  inputActionOriginSteamDeckY* = 336
  inputActionOriginSteamDeckL1* = 337
  inputActionOriginSteamDeckR1* = 338
  inputActionOriginSteamDeckMenu* = 339
  inputActionOriginSteamDeckView* = 340
  inputActionOriginSteamDeckLeftPadTouch* = 341
  inputActionOriginSteamDeckLeftPadSwipe* = 342
  inputActionOriginSteamDeckLeftPadClick* = 343
  inputActionOriginSteamDeckLeftPadDpadNorth* = 344
  inputActionOriginSteamDeckLeftPadDpadSouth* = 345
  inputActionOriginSteamDeckLeftPadDpadWest* = 346
  inputActionOriginSteamDeckLeftPadDpadEast* = 347
  inputActionOriginSteamDeckRightPadTouch* = 348
  inputActionOriginSteamDeckRightPadSwipe* = 349
  inputActionOriginSteamDeckRightPadClick* = 350
  inputActionOriginSteamDeckRightPadDpadNorth* = 351
  inputActionOriginSteamDeckRightPadDpadSouth* = 352
  inputActionOriginSteamDeckRightPadDpadWest* = 353
  inputActionOriginSteamDeckRightPadDpadEast* = 354
  inputActionOriginSteamDeckL2SoftPull* = 355
  inputActionOriginSteamDeckL2* = 356
  inputActionOriginSteamDeckR2SoftPull* = 357
  inputActionOriginSteamDeckR2* = 358
  inputActionOriginSteamDeckLeftStickMove* = 359
  inputActionOriginSteamDeckL3* = 360
  inputActionOriginSteamDeckLeftStickDpadNorth* = 361
  inputActionOriginSteamDeckLeftStickDpadSouth* = 362
  inputActionOriginSteamDeckLeftStickDpadWest* = 363
  inputActionOriginSteamDeckLeftStickDpadEast* = 364
  inputActionOriginSteamDeckLeftStickTouch* = 365
  inputActionOriginSteamDeckRightStickMove* = 366
  inputActionOriginSteamDeckR3* = 367
  inputActionOriginSteamDeckRightStickDpadNorth* = 368
  inputActionOriginSteamDeckRightStickDpadSouth* = 369
  inputActionOriginSteamDeckRightStickDpadWest* = 370
  inputActionOriginSteamDeckRightStickDpadEast* = 371
  inputActionOriginSteamDeckRightStickTouch* = 372
  inputActionOriginSteamDeckL4* = 373
  inputActionOriginSteamDeckR4* = 374
  inputActionOriginSteamDeckL5* = 375
  inputActionOriginSteamDeckR5* = 376
  inputActionOriginSteamDeckDpadMove* = 377
  inputActionOriginSteamDeckDpadNorth* = 378
  inputActionOriginSteamDeckDpadSouth* = 379
  inputActionOriginSteamDeckDpadWest* = 380
  inputActionOriginSteamDeckDpadEast* = 381
  inputActionOriginSteamDeckGyroMove* = 382
  inputActionOriginSteamDeckGyroPitch* = 383
  inputActionOriginSteamDeckGyroYaw* = 384
  inputActionOriginSteamDeckGyroRoll* = 385
  inputActionOriginSteamDeckReserved1* = 386
  inputActionOriginSteamDeckReserved2* = 387
  inputActionOriginSteamDeckReserved3* = 388
  inputActionOriginSteamDeckReserved4* = 389
  inputActionOriginSteamDeckReserved5* = 390
  inputActionOriginSteamDeckReserved6* = 391
  inputActionOriginSteamDeckReserved7* = 392
  inputActionOriginSteamDeckReserved8* = 393
  inputActionOriginSteamDeckReserved9* = 394
  inputActionOriginSteamDeckReserved10* = 395
  inputActionOriginSteamDeckReserved11* = 396
  inputActionOriginSteamDeckReserved12* = 397
  inputActionOriginSteamDeckReserved13* = 398
  inputActionOriginSteamDeckReserved14* = 399
  inputActionOriginSteamDeckReserved15* = 400
  inputActionOriginSteamDeckReserved16* = 401
  inputActionOriginSteamDeckReserved17* = 402
  inputActionOriginSteamDeckReserved18* = 403
  inputActionOriginSteamDeckReserved19* = 404
  inputActionOriginSteamDeckReserved20* = 405
  inputActionOriginHoripadM1* = 406
  inputActionOriginHoripadM2* = 407
  inputActionOriginHoripadL4* = 408
  inputActionOriginHoripadR4* = 409
  inputActionOriginLenovoLegionGoA* = 410
  inputActionOriginLenovoLegionGoB* = 411
  inputActionOriginLenovoLegionGoX* = 412
  inputActionOriginLenovoLegionGoY* = 413
  inputActionOriginLenovoLegionGoLb* = 414
  inputActionOriginLenovoLegionGoRb* = 415
  inputActionOriginLenovoLegionGoMenu* = 416
  inputActionOriginLenovoLegionGoView* = 417
  inputActionOriginLenovoLegionGoLeftPadTouch* = 418
  inputActionOriginLenovoLegionGoLeftPadSwipe* = 419
  inputActionOriginLenovoLegionGoLeftPadClick* = 420
  inputActionOriginLenovoLegionGoLeftPadDpadNorth* = 421
  inputActionOriginLenovoLegionGoLeftPadDpadSouth* = 422
  inputActionOriginLenovoLegionGoLeftPadDpadWest* = 423
  inputActionOriginLenovoLegionGoLeftPadDpadEast* = 424
  inputActionOriginLenovoLegionGoRightPadTouch* = 425
  inputActionOriginLenovoLegionGoRightPadSwipe* = 426
  inputActionOriginLenovoLegionGoRightPadClick* = 427
  inputActionOriginLenovoLegionGoRightPadDpadNorth* = 428
  inputActionOriginLenovoLegionGoRightPadDpadSouth* = 429
  inputActionOriginLenovoLegionGoRightPadDpadWest* = 430
  inputActionOriginLenovoLegionGoRightPadDpadEast* = 431
  inputActionOriginLenovoLegionGoLtSoftPull* = 432
  inputActionOriginLenovoLegionGoLt* = 433
  inputActionOriginLenovoLegionGoRtSoftPull* = 434
  inputActionOriginLenovoLegionGoRt* = 435
  inputActionOriginLenovoLegionGoLeftStickMove* = 436
  inputActionOriginLenovoLegionGoLs* = 437
  inputActionOriginLenovoLegionGoLeftStickDpadNorth* = 438
  inputActionOriginLenovoLegionGoLeftStickDpadSouth* = 439
  inputActionOriginLenovoLegionGoLeftStickDpadWest* = 440
  inputActionOriginLenovoLegionGoLeftStickDpadEast* = 441
  inputActionOriginLenovoLegionGoRightStickMove* = 442
  inputActionOriginLenovoLegionGoRs* = 443
  inputActionOriginLenovoLegionGoRightStickDpadNorth* = 444
  inputActionOriginLenovoLegionGoRightStickDpadSouth* = 445
  inputActionOriginLenovoLegionGoRightStickDpadWest* = 446
  inputActionOriginLenovoLegionGoRightStickDpadEast* = 447
  inputActionOriginLenovoLegionGoY1* = 448
  inputActionOriginLenovoLegionGoY2* = 449
  inputActionOriginLenovoLegionGoDpadMove* = 450
  inputActionOriginLenovoLegionGoDpadNorth* = 451
  inputActionOriginLenovoLegionGoDpadSouth* = 452
  inputActionOriginLenovoLegionGoDpadWest* = 453
  inputActionOriginLenovoLegionGoDpadEast* = 454
  inputActionOriginLenovoLegionGoGyroMove* = 455
  inputActionOriginLenovoLegionGoGyroPitch* = 456
  inputActionOriginLenovoLegionGoGyroYaw* = 457
  inputActionOriginLenovoLegionGoGyroRoll* = 458
  inputActionOriginLenovoLegionGoReserved1* = 459
  inputActionOriginLenovoLegionGoReserved2* = 460
  inputActionOriginLenovoLegionGoReserved3* = 461
  inputActionOriginLenovoLegionGoReserved4* = 462
  inputActionOriginLenovoLegionGoReserved5* = 463
  inputActionOriginLenovoLegionGoReserved6* = 464
  inputActionOriginLenovoLegionGoReserved7* = 465
  inputActionOriginLenovoLegionGoReserved8* = 466
  inputActionOriginLenovoLegionGoReserved9* = 467
  inputActionOriginLenovoLegionGoReserved10* = 468
  inputActionOriginLenovoLegionGoReserved11* = 469
  inputActionOriginLenovoLegionGoReserved12* = 470
  inputActionOriginLenovoLegionGoReserved13* = 471
  inputActionOriginLenovoLegionGoReserved14* = 472
  inputActionOriginLenovoLegionGoReserved15* = 473
  inputActionOriginLenovoLegionGoReserved16* = 474
  inputActionOriginLenovoLegionGoReserved17* = 475
  inputActionOriginLenovoLegionGoReserved18* = 476
  inputActionOriginLenovoLegionGoReserved19* = 477
  inputActionOriginLenovoLegionGoReserved20* = 478
  inputActionOriginGenericL4* = 479
  inputActionOriginGenericR4* = 480
  inputActionOriginGenericL5* = 481
  inputActionOriginGenericR5* = 482
  inputActionOriginGenericPl* = 483
  inputActionOriginGenericPr* = 484
  inputActionOriginGenericC* = 485
  inputActionOriginGenericZ* = 486
  inputActionOriginGenericMisc1* = 487
  inputActionOriginGenericMisc2* = 488
  inputActionOriginGenericMisc3* = 489
  inputActionOriginGenericMisc4* = 490
  inputActionOriginGenericMisc5* = 491
  inputActionOriginGenericMisc6* = 492
  inputActionOriginGenericMisc7* = 493
  inputActionOriginGenericMisc8* = 494
  inputActionOriginCount* = 495
  inputActionOriginMaximumPossibleValue* = 32767

# XboxOrigin
const
  xboxOriginA* = 0
  xboxOriginB* = 1
  xboxOriginX* = 2
  xboxOriginY* = 3
  xboxOriginLeftBumper* = 4
  xboxOriginRightBumper* = 5
  xboxOriginMenu* = 6
  xboxOriginView* = 7
  xboxOriginLeftTriggerPull* = 8
  xboxOriginLeftTriggerClick* = 9
  xboxOriginRightTriggerPull* = 10
  xboxOriginRightTriggerClick* = 11
  xboxOriginLeftStickMove* = 12
  xboxOriginLeftStickClick* = 13
  xboxOriginLeftStickDpadNorth* = 14
  xboxOriginLeftStickDpadSouth* = 15
  xboxOriginLeftStickDpadWest* = 16
  xboxOriginLeftStickDpadEast* = 17
  xboxOriginRightStickMove* = 18
  xboxOriginRightStickClick* = 19
  xboxOriginRightStickDpadNorth* = 20
  xboxOriginRightStickDpadSouth* = 21
  xboxOriginRightStickDpadWest* = 22
  xboxOriginRightStickDpadEast* = 23
  xboxOriginDpadNorth* = 24
  xboxOriginDpadSouth* = 25
  xboxOriginDpadWest* = 26
  xboxOriginDpadEast* = 27
  xboxOriginCount* = 28

# ControllerPad
const
  controllerPadLeft* = 0
  controllerPadRight* = 1

# ControllerHapticLocation
const
  controllerHapticLocationLeft* = 1
  controllerHapticLocationRight* = 2
  controllerHapticLocationBoth* = 3

# ControllerHapticType
const
  controllerHapticTypeOff* = 0
  controllerHapticTypeTick* = 1
  controllerHapticTypeClick* = 2

# InputType
const
  inputTypeUnknown* = 0
  inputTypeSteamController* = 1
  inputTypeXbox360Controller* = 2
  inputTypeXboxOneController* = 3
  inputTypeGenericGamepad* = 4
  inputTypePs4Controller* = 5
  inputTypeAppleMfiController* = 6
  inputTypeAndroidController* = 7
  inputTypeSwitchJoyConPair* = 8
  inputTypeSwitchJoyConSingle* = 9
  inputTypeSwitchProController* = 10
  inputTypeMobileTouch* = 11
  inputTypePs3Controller* = 12
  inputTypePs5Controller* = 13
  inputTypeSteamDeckController* = 14
  inputTypeCount* = 15
  inputTypeMaximumPossibleValue* = 255

# InputConfigurationEnableType
const
  inputConfigurationEnableTypeNone* = 0
  inputConfigurationEnableTypePlaystation* = 1
  inputConfigurationEnableTypeXbox* = 2
  inputConfigurationEnableTypeGeneric* = 4
  inputConfigurationEnableTypeSwitch* = 8

# InputLEDFlag
const
  inputLedFlagSetColor* = 0
  inputLedFlagRestoreUserDefault* = 1

# InputGlyphSize
const
  inputGlyphSizeSmall* = 0
  inputGlyphSizeMedium* = 1
  inputGlyphSizeLarge* = 2
  inputGlyphSizeCount* = 3

# InputGlyphStyle
const
  inputGlyphStyleKnockout* = 0
  inputGlyphStyleLight* = 1
  inputGlyphStyleDark* = 2
  inputGlyphStyleNeutralColorAbxy* = 16
  inputGlyphStyleSolidAbxy* = 32

# InputActionEventType
const
  inputActionEventTypeDigitalAction* = 0
  inputActionEventTypeAnalogAction* = 1

# ControllerActionOrigin
const
  controllerActionOriginNone* = 0
  controllerActionOriginA* = 1
  controllerActionOriginB* = 2
  controllerActionOriginX* = 3
  controllerActionOriginY* = 4
  controllerActionOriginLeftBumper* = 5
  controllerActionOriginRightBumper* = 6
  controllerActionOriginLeftGrip* = 7
  controllerActionOriginRightGrip* = 8
  controllerActionOriginStart* = 9
  controllerActionOriginBack* = 10
  controllerActionOriginLeftPadTouch* = 11
  controllerActionOriginLeftPadSwipe* = 12
  controllerActionOriginLeftPadClick* = 13
  controllerActionOriginLeftPadDpadNorth* = 14
  controllerActionOriginLeftPadDpadSouth* = 15
  controllerActionOriginLeftPadDpadWest* = 16
  controllerActionOriginLeftPadDpadEast* = 17
  controllerActionOriginRightPadTouch* = 18
  controllerActionOriginRightPadSwipe* = 19
  controllerActionOriginRightPadClick* = 20
  controllerActionOriginRightPadDpadNorth* = 21
  controllerActionOriginRightPadDpadSouth* = 22
  controllerActionOriginRightPadDpadWest* = 23
  controllerActionOriginRightPadDpadEast* = 24
  controllerActionOriginLeftTriggerPull* = 25
  controllerActionOriginLeftTriggerClick* = 26
  controllerActionOriginRightTriggerPull* = 27
  controllerActionOriginRightTriggerClick* = 28
  controllerActionOriginLeftStickMove* = 29
  controllerActionOriginLeftStickClick* = 30
  controllerActionOriginLeftStickDpadNorth* = 31
  controllerActionOriginLeftStickDpadSouth* = 32
  controllerActionOriginLeftStickDpadWest* = 33
  controllerActionOriginLeftStickDpadEast* = 34
  controllerActionOriginGyroMove* = 35
  controllerActionOriginGyroPitch* = 36
  controllerActionOriginGyroYaw* = 37
  controllerActionOriginGyroRoll* = 38
  controllerActionOriginPs4X* = 39
  controllerActionOriginPs4Circle* = 40
  controllerActionOriginPs4Triangle* = 41
  controllerActionOriginPs4Square* = 42
  controllerActionOriginPs4LeftBumper* = 43
  controllerActionOriginPs4RightBumper* = 44
  controllerActionOriginPs4Options* = 45
  controllerActionOriginPs4Share* = 46
  controllerActionOriginPs4LeftPadTouch* = 47
  controllerActionOriginPs4LeftPadSwipe* = 48
  controllerActionOriginPs4LeftPadClick* = 49
  controllerActionOriginPs4LeftPadDpadNorth* = 50
  controllerActionOriginPs4LeftPadDpadSouth* = 51
  controllerActionOriginPs4LeftPadDpadWest* = 52
  controllerActionOriginPs4LeftPadDpadEast* = 53
  controllerActionOriginPs4RightPadTouch* = 54
  controllerActionOriginPs4RightPadSwipe* = 55
  controllerActionOriginPs4RightPadClick* = 56
  controllerActionOriginPs4RightPadDpadNorth* = 57
  controllerActionOriginPs4RightPadDpadSouth* = 58
  controllerActionOriginPs4RightPadDpadWest* = 59
  controllerActionOriginPs4RightPadDpadEast* = 60
  controllerActionOriginPs4CenterPadTouch* = 61
  controllerActionOriginPs4CenterPadSwipe* = 62
  controllerActionOriginPs4CenterPadClick* = 63
  controllerActionOriginPs4CenterPadDpadNorth* = 64
  controllerActionOriginPs4CenterPadDpadSouth* = 65
  controllerActionOriginPs4CenterPadDpadWest* = 66
  controllerActionOriginPs4CenterPadDpadEast* = 67
  controllerActionOriginPs4LeftTriggerPull* = 68
  controllerActionOriginPs4LeftTriggerClick* = 69
  controllerActionOriginPs4RightTriggerPull* = 70
  controllerActionOriginPs4RightTriggerClick* = 71
  controllerActionOriginPs4LeftStickMove* = 72
  controllerActionOriginPs4LeftStickClick* = 73
  controllerActionOriginPs4LeftStickDpadNorth* = 74
  controllerActionOriginPs4LeftStickDpadSouth* = 75
  controllerActionOriginPs4LeftStickDpadWest* = 76
  controllerActionOriginPs4LeftStickDpadEast* = 77
  controllerActionOriginPs4RightStickMove* = 78
  controllerActionOriginPs4RightStickClick* = 79
  controllerActionOriginPs4RightStickDpadNorth* = 80
  controllerActionOriginPs4RightStickDpadSouth* = 81
  controllerActionOriginPs4RightStickDpadWest* = 82
  controllerActionOriginPs4RightStickDpadEast* = 83
  controllerActionOriginPs4DpadNorth* = 84
  controllerActionOriginPs4DpadSouth* = 85
  controllerActionOriginPs4DpadWest* = 86
  controllerActionOriginPs4DpadEast* = 87
  controllerActionOriginPs4GyroMove* = 88
  controllerActionOriginPs4GyroPitch* = 89
  controllerActionOriginPs4GyroYaw* = 90
  controllerActionOriginPs4GyroRoll* = 91
  controllerActionOriginXboxOneA* = 92
  controllerActionOriginXboxOneB* = 93
  controllerActionOriginXboxOneX* = 94
  controllerActionOriginXboxOneY* = 95
  controllerActionOriginXboxOneLeftBumper* = 96
  controllerActionOriginXboxOneRightBumper* = 97
  controllerActionOriginXboxOneMenu* = 98
  controllerActionOriginXboxOneView* = 99
  controllerActionOriginXboxOneLeftTriggerPull* = 100
  controllerActionOriginXboxOneLeftTriggerClick* = 101
  controllerActionOriginXboxOneRightTriggerPull* = 102
  controllerActionOriginXboxOneRightTriggerClick* = 103
  controllerActionOriginXboxOneLeftStickMove* = 104
  controllerActionOriginXboxOneLeftStickClick* = 105
  controllerActionOriginXboxOneLeftStickDpadNorth* = 106
  controllerActionOriginXboxOneLeftStickDpadSouth* = 107
  controllerActionOriginXboxOneLeftStickDpadWest* = 108
  controllerActionOriginXboxOneLeftStickDpadEast* = 109
  controllerActionOriginXboxOneRightStickMove* = 110
  controllerActionOriginXboxOneRightStickClick* = 111
  controllerActionOriginXboxOneRightStickDpadNorth* = 112
  controllerActionOriginXboxOneRightStickDpadSouth* = 113
  controllerActionOriginXboxOneRightStickDpadWest* = 114
  controllerActionOriginXboxOneRightStickDpadEast* = 115
  controllerActionOriginXboxOneDpadNorth* = 116
  controllerActionOriginXboxOneDpadSouth* = 117
  controllerActionOriginXboxOneDpadWest* = 118
  controllerActionOriginXboxOneDpadEast* = 119
  controllerActionOriginXbox360A* = 120
  controllerActionOriginXbox360B* = 121
  controllerActionOriginXbox360X* = 122
  controllerActionOriginXbox360Y* = 123
  controllerActionOriginXbox360LeftBumper* = 124
  controllerActionOriginXbox360RightBumper* = 125
  controllerActionOriginXbox360Start* = 126
  controllerActionOriginXbox360Back* = 127
  controllerActionOriginXbox360LeftTriggerPull* = 128
  controllerActionOriginXbox360LeftTriggerClick* = 129
  controllerActionOriginXbox360RightTriggerPull* = 130
  controllerActionOriginXbox360RightTriggerClick* = 131
  controllerActionOriginXbox360LeftStickMove* = 132
  controllerActionOriginXbox360LeftStickClick* = 133
  controllerActionOriginXbox360LeftStickDpadNorth* = 134
  controllerActionOriginXbox360LeftStickDpadSouth* = 135
  controllerActionOriginXbox360LeftStickDpadWest* = 136
  controllerActionOriginXbox360LeftStickDpadEast* = 137
  controllerActionOriginXbox360RightStickMove* = 138
  controllerActionOriginXbox360RightStickClick* = 139
  controllerActionOriginXbox360RightStickDpadNorth* = 140
  controllerActionOriginXbox360RightStickDpadSouth* = 141
  controllerActionOriginXbox360RightStickDpadWest* = 142
  controllerActionOriginXbox360RightStickDpadEast* = 143
  controllerActionOriginXbox360DpadNorth* = 144
  controllerActionOriginXbox360DpadSouth* = 145
  controllerActionOriginXbox360DpadWest* = 146
  controllerActionOriginXbox360DpadEast* = 147
  controllerActionOriginSteamV2A* = 148
  controllerActionOriginSteamV2B* = 149
  controllerActionOriginSteamV2X* = 150
  controllerActionOriginSteamV2Y* = 151
  controllerActionOriginSteamV2LeftBumper* = 152
  controllerActionOriginSteamV2RightBumper* = 153
  controllerActionOriginSteamV2LeftGripLower* = 154
  controllerActionOriginSteamV2LeftGripUpper* = 155
  controllerActionOriginSteamV2RightGripLower* = 156
  controllerActionOriginSteamV2RightGripUpper* = 157
  controllerActionOriginSteamV2LeftBumperPressure* = 158
  controllerActionOriginSteamV2RightBumperPressure* = 159
  controllerActionOriginSteamV2LeftGripPressure* = 160
  controllerActionOriginSteamV2RightGripPressure* = 161
  controllerActionOriginSteamV2LeftGripUpperPressure* = 162
  controllerActionOriginSteamV2RightGripUpperPressure* = 163
  controllerActionOriginSteamV2Start* = 164
  controllerActionOriginSteamV2Back* = 165
  controllerActionOriginSteamV2LeftPadTouch* = 166
  controllerActionOriginSteamV2LeftPadSwipe* = 167
  controllerActionOriginSteamV2LeftPadClick* = 168
  controllerActionOriginSteamV2LeftPadPressure* = 169
  controllerActionOriginSteamV2LeftPadDpadNorth* = 170
  controllerActionOriginSteamV2LeftPadDpadSouth* = 171
  controllerActionOriginSteamV2LeftPadDpadWest* = 172
  controllerActionOriginSteamV2LeftPadDpadEast* = 173
  controllerActionOriginSteamV2RightPadTouch* = 174
  controllerActionOriginSteamV2RightPadSwipe* = 175
  controllerActionOriginSteamV2RightPadClick* = 176
  controllerActionOriginSteamV2RightPadPressure* = 177
  controllerActionOriginSteamV2RightPadDpadNorth* = 178
  controllerActionOriginSteamV2RightPadDpadSouth* = 179
  controllerActionOriginSteamV2RightPadDpadWest* = 180
  controllerActionOriginSteamV2RightPadDpadEast* = 181
  controllerActionOriginSteamV2LeftTriggerPull* = 182
  controllerActionOriginSteamV2LeftTriggerClick* = 183
  controllerActionOriginSteamV2RightTriggerPull* = 184
  controllerActionOriginSteamV2RightTriggerClick* = 185
  controllerActionOriginSteamV2LeftStickMove* = 186
  controllerActionOriginSteamV2LeftStickClick* = 187
  controllerActionOriginSteamV2LeftStickDpadNorth* = 188
  controllerActionOriginSteamV2LeftStickDpadSouth* = 189
  controllerActionOriginSteamV2LeftStickDpadWest* = 190
  controllerActionOriginSteamV2LeftStickDpadEast* = 191
  controllerActionOriginSteamV2GyroMove* = 192
  controllerActionOriginSteamV2GyroPitch* = 193
  controllerActionOriginSteamV2GyroYaw* = 194
  controllerActionOriginSteamV2GyroRoll* = 195
  controllerActionOriginSwitchA* = 196
  controllerActionOriginSwitchB* = 197
  controllerActionOriginSwitchX* = 198
  controllerActionOriginSwitchY* = 199
  controllerActionOriginSwitchLeftBumper* = 200
  controllerActionOriginSwitchRightBumper* = 201
  controllerActionOriginSwitchPlus* = 202
  controllerActionOriginSwitchMinus* = 203
  controllerActionOriginSwitchCapture* = 204
  controllerActionOriginSwitchLeftTriggerPull* = 205
  controllerActionOriginSwitchLeftTriggerClick* = 206
  controllerActionOriginSwitchRightTriggerPull* = 207
  controllerActionOriginSwitchRightTriggerClick* = 208
  controllerActionOriginSwitchLeftStickMove* = 209
  controllerActionOriginSwitchLeftStickClick* = 210
  controllerActionOriginSwitchLeftStickDpadNorth* = 211
  controllerActionOriginSwitchLeftStickDpadSouth* = 212
  controllerActionOriginSwitchLeftStickDpadWest* = 213
  controllerActionOriginSwitchLeftStickDpadEast* = 214
  controllerActionOriginSwitchRightStickMove* = 215
  controllerActionOriginSwitchRightStickClick* = 216
  controllerActionOriginSwitchRightStickDpadNorth* = 217
  controllerActionOriginSwitchRightStickDpadSouth* = 218
  controllerActionOriginSwitchRightStickDpadWest* = 219
  controllerActionOriginSwitchRightStickDpadEast* = 220
  controllerActionOriginSwitchDpadNorth* = 221
  controllerActionOriginSwitchDpadSouth* = 222
  controllerActionOriginSwitchDpadWest* = 223
  controllerActionOriginSwitchDpadEast* = 224
  controllerActionOriginSwitchProGyroMove* = 225
  controllerActionOriginSwitchProGyroPitch* = 226
  controllerActionOriginSwitchProGyroYaw* = 227
  controllerActionOriginSwitchProGyroRoll* = 228
  controllerActionOriginSwitchRightGyroMove* = 229
  controllerActionOriginSwitchRightGyroPitch* = 230
  controllerActionOriginSwitchRightGyroYaw* = 231
  controllerActionOriginSwitchRightGyroRoll* = 232
  controllerActionOriginSwitchLeftGyroMove* = 233
  controllerActionOriginSwitchLeftGyroPitch* = 234
  controllerActionOriginSwitchLeftGyroYaw* = 235
  controllerActionOriginSwitchLeftGyroRoll* = 236
  controllerActionOriginSwitchLeftGripLower* = 237
  controllerActionOriginSwitchLeftGripUpper* = 238
  controllerActionOriginSwitchRightGripLower* = 239
  controllerActionOriginSwitchRightGripUpper* = 240
  controllerActionOriginPs4DpadMove* = 241
  controllerActionOriginXboxOneDpadMove* = 242
  controllerActionOriginXbox360DpadMove* = 243
  controllerActionOriginSwitchDpadMove* = 244
  controllerActionOriginPs5X* = 245
  controllerActionOriginPs5Circle* = 246
  controllerActionOriginPs5Triangle* = 247
  controllerActionOriginPs5Square* = 248
  controllerActionOriginPs5LeftBumper* = 249
  controllerActionOriginPs5RightBumper* = 250
  controllerActionOriginPs5Option* = 251
  controllerActionOriginPs5Create* = 252
  controllerActionOriginPs5Mute* = 253
  controllerActionOriginPs5LeftPadTouch* = 254
  controllerActionOriginPs5LeftPadSwipe* = 255
  controllerActionOriginPs5LeftPadClick* = 256
  controllerActionOriginPs5LeftPadDpadNorth* = 257
  controllerActionOriginPs5LeftPadDpadSouth* = 258
  controllerActionOriginPs5LeftPadDpadWest* = 259
  controllerActionOriginPs5LeftPadDpadEast* = 260
  controllerActionOriginPs5RightPadTouch* = 261
  controllerActionOriginPs5RightPadSwipe* = 262
  controllerActionOriginPs5RightPadClick* = 263
  controllerActionOriginPs5RightPadDpadNorth* = 264
  controllerActionOriginPs5RightPadDpadSouth* = 265
  controllerActionOriginPs5RightPadDpadWest* = 266
  controllerActionOriginPs5RightPadDpadEast* = 267
  controllerActionOriginPs5CenterPadTouch* = 268
  controllerActionOriginPs5CenterPadSwipe* = 269
  controllerActionOriginPs5CenterPadClick* = 270
  controllerActionOriginPs5CenterPadDpadNorth* = 271
  controllerActionOriginPs5CenterPadDpadSouth* = 272
  controllerActionOriginPs5CenterPadDpadWest* = 273
  controllerActionOriginPs5CenterPadDpadEast* = 274
  controllerActionOriginPs5LeftTriggerPull* = 275
  controllerActionOriginPs5LeftTriggerClick* = 276
  controllerActionOriginPs5RightTriggerPull* = 277
  controllerActionOriginPs5RightTriggerClick* = 278
  controllerActionOriginPs5LeftStickMove* = 279
  controllerActionOriginPs5LeftStickClick* = 280
  controllerActionOriginPs5LeftStickDpadNorth* = 281
  controllerActionOriginPs5LeftStickDpadSouth* = 282
  controllerActionOriginPs5LeftStickDpadWest* = 283
  controllerActionOriginPs5LeftStickDpadEast* = 284
  controllerActionOriginPs5RightStickMove* = 285
  controllerActionOriginPs5RightStickClick* = 286
  controllerActionOriginPs5RightStickDpadNorth* = 287
  controllerActionOriginPs5RightStickDpadSouth* = 288
  controllerActionOriginPs5RightStickDpadWest* = 289
  controllerActionOriginPs5RightStickDpadEast* = 290
  controllerActionOriginPs5DpadMove* = 291
  controllerActionOriginPs5DpadNorth* = 292
  controllerActionOriginPs5DpadSouth* = 293
  controllerActionOriginPs5DpadWest* = 294
  controllerActionOriginPs5DpadEast* = 295
  controllerActionOriginPs5GyroMove* = 296
  controllerActionOriginPs5GyroPitch* = 297
  controllerActionOriginPs5GyroYaw* = 298
  controllerActionOriginPs5GyroRoll* = 299
  controllerActionOriginXboxOneLeftGripLower* = 300
  controllerActionOriginXboxOneLeftGripUpper* = 301
  controllerActionOriginXboxOneRightGripLower* = 302
  controllerActionOriginXboxOneRightGripUpper* = 303
  controllerActionOriginXboxOneShare* = 304
  controllerActionOriginSteamDeckA* = 305
  controllerActionOriginSteamDeckB* = 306
  controllerActionOriginSteamDeckX* = 307
  controllerActionOriginSteamDeckY* = 308
  controllerActionOriginSteamDeckL1* = 309
  controllerActionOriginSteamDeckR1* = 310
  controllerActionOriginSteamDeckMenu* = 311
  controllerActionOriginSteamDeckView* = 312
  controllerActionOriginSteamDeckLeftPadTouch* = 313
  controllerActionOriginSteamDeckLeftPadSwipe* = 314
  controllerActionOriginSteamDeckLeftPadClick* = 315
  controllerActionOriginSteamDeckLeftPadDpadNorth* = 316
  controllerActionOriginSteamDeckLeftPadDpadSouth* = 317
  controllerActionOriginSteamDeckLeftPadDpadWest* = 318
  controllerActionOriginSteamDeckLeftPadDpadEast* = 319
  controllerActionOriginSteamDeckRightPadTouch* = 320
  controllerActionOriginSteamDeckRightPadSwipe* = 321
  controllerActionOriginSteamDeckRightPadClick* = 322
  controllerActionOriginSteamDeckRightPadDpadNorth* = 323
  controllerActionOriginSteamDeckRightPadDpadSouth* = 324
  controllerActionOriginSteamDeckRightPadDpadWest* = 325
  controllerActionOriginSteamDeckRightPadDpadEast* = 326
  controllerActionOriginSteamDeckL2SoftPull* = 327
  controllerActionOriginSteamDeckL2* = 328
  controllerActionOriginSteamDeckR2SoftPull* = 329
  controllerActionOriginSteamDeckR2* = 330
  controllerActionOriginSteamDeckLeftStickMove* = 331
  controllerActionOriginSteamDeckL3* = 332
  controllerActionOriginSteamDeckLeftStickDpadNorth* = 333
  controllerActionOriginSteamDeckLeftStickDpadSouth* = 334
  controllerActionOriginSteamDeckLeftStickDpadWest* = 335
  controllerActionOriginSteamDeckLeftStickDpadEast* = 336
  controllerActionOriginSteamDeckLeftStickTouch* = 337
  controllerActionOriginSteamDeckRightStickMove* = 338
  controllerActionOriginSteamDeckR3* = 339
  controllerActionOriginSteamDeckRightStickDpadNorth* = 340
  controllerActionOriginSteamDeckRightStickDpadSouth* = 341
  controllerActionOriginSteamDeckRightStickDpadWest* = 342
  controllerActionOriginSteamDeckRightStickDpadEast* = 343
  controllerActionOriginSteamDeckRightStickTouch* = 344
  controllerActionOriginSteamDeckL4* = 345
  controllerActionOriginSteamDeckR4* = 346
  controllerActionOriginSteamDeckL5* = 347
  controllerActionOriginSteamDeckR5* = 348
  controllerActionOriginSteamDeckDpadMove* = 349
  controllerActionOriginSteamDeckDpadNorth* = 350
  controllerActionOriginSteamDeckDpadSouth* = 351
  controllerActionOriginSteamDeckDpadWest* = 352
  controllerActionOriginSteamDeckDpadEast* = 353
  controllerActionOriginSteamDeckGyroMove* = 354
  controllerActionOriginSteamDeckGyroPitch* = 355
  controllerActionOriginSteamDeckGyroYaw* = 356
  controllerActionOriginSteamDeckGyroRoll* = 357
  controllerActionOriginSteamDeckReserved1* = 358
  controllerActionOriginSteamDeckReserved2* = 359
  controllerActionOriginSteamDeckReserved3* = 360
  controllerActionOriginSteamDeckReserved4* = 361
  controllerActionOriginSteamDeckReserved5* = 362
  controllerActionOriginSteamDeckReserved6* = 363
  controllerActionOriginSteamDeckReserved7* = 364
  controllerActionOriginSteamDeckReserved8* = 365
  controllerActionOriginSteamDeckReserved9* = 366
  controllerActionOriginSteamDeckReserved10* = 367
  controllerActionOriginSteamDeckReserved11* = 368
  controllerActionOriginSteamDeckReserved12* = 369
  controllerActionOriginSteamDeckReserved13* = 370
  controllerActionOriginSteamDeckReserved14* = 371
  controllerActionOriginSteamDeckReserved15* = 372
  controllerActionOriginSteamDeckReserved16* = 373
  controllerActionOriginSteamDeckReserved17* = 374
  controllerActionOriginSteamDeckReserved18* = 375
  controllerActionOriginSteamDeckReserved19* = 376
  controllerActionOriginSteamDeckReserved20* = 377
  controllerActionOriginSwitchJoyConButtonN* = 378
  controllerActionOriginSwitchJoyConButtonE* = 379
  controllerActionOriginSwitchJoyConButtonS* = 380
  controllerActionOriginSwitchJoyConButtonW* = 381
  controllerActionOriginPs5LeftGrip* = 382
  controllerActionOriginPs5RightGrip* = 383
  controllerActionOriginPs5LeftFn* = 384
  controllerActionOriginPs5RightFn* = 385
  controllerActionOriginHoripadM1* = 386
  controllerActionOriginHoripadM2* = 387
  controllerActionOriginHoripadL4* = 388
  controllerActionOriginHoripadR4* = 389
  controllerActionOriginLenovoLegionGoA* = 390
  controllerActionOriginLenovoLegionGoB* = 391
  controllerActionOriginLenovoLegionGoX* = 392
  controllerActionOriginLenovoLegionGoY* = 393
  controllerActionOriginLenovoLegionGoLb* = 394
  controllerActionOriginLenovoLegionGoRb* = 395
  controllerActionOriginLenovoLegionGoMenu* = 396
  controllerActionOriginLenovoLegionGoView* = 397
  controllerActionOriginLenovoLegionGoLeftPadTouch* = 398
  controllerActionOriginLenovoLegionGoLeftPadSwipe* = 399
  controllerActionOriginLenovoLegionGoLeftPadClick* = 400
  controllerActionOriginLenovoLegionGoLeftPadDpadNorth* = 401
  controllerActionOriginLenovoLegionGoLeftPadDpadSouth* = 402
  controllerActionOriginLenovoLegionGoLeftPadDpadWest* = 403
  controllerActionOriginLenovoLegionGoLeftPadDpadEast* = 404
  controllerActionOriginLenovoLegionGoRightPadTouch* = 405
  controllerActionOriginLenovoLegionGoRightPadSwipe* = 406
  controllerActionOriginLenovoLegionGoRightPadClick* = 407
  controllerActionOriginLenovoLegionGoRightPadDpadNorth* = 408
  controllerActionOriginLenovoLegionGoRightPadDpadSouth* = 409
  controllerActionOriginLenovoLegionGoRightPadDpadWest* = 410
  controllerActionOriginLenovoLegionGoRightPadDpadEast* = 411
  controllerActionOriginLenovoLegionGoLtSoftPull* = 412
  controllerActionOriginLenovoLegionGoLt* = 413
  controllerActionOriginLenovoLegionGoRtSoftPull* = 414
  controllerActionOriginLenovoLegionGoRt* = 415
  controllerActionOriginLenovoLegionGoLeftStickMove* = 416
  controllerActionOriginLenovoLegionGoLs* = 417
  controllerActionOriginLenovoLegionGoLeftStickDpadNorth* = 418
  controllerActionOriginLenovoLegionGoLeftStickDpadSouth* = 419
  controllerActionOriginLenovoLegionGoLeftStickDpadWest* = 420
  controllerActionOriginLenovoLegionGoLeftStickDpadEast* = 421
  controllerActionOriginLenovoLegionGoRightStickMove* = 422
  controllerActionOriginLenovoLegionGoRs* = 423
  controllerActionOriginLenovoLegionGoRightStickDpadNorth* = 424
  controllerActionOriginLenovoLegionGoRightStickDpadSouth* = 425
  controllerActionOriginLenovoLegionGoRightStickDpadWest* = 426
  controllerActionOriginLenovoLegionGoRightStickDpadEast* = 427
  controllerActionOriginLenovoLegionGoY1* = 428
  controllerActionOriginLenovoLegionGoY2* = 429
  controllerActionOriginLenovoLegionGoDpadMove* = 430
  controllerActionOriginLenovoLegionGoDpadNorth* = 431
  controllerActionOriginLenovoLegionGoDpadSouth* = 432
  controllerActionOriginLenovoLegionGoDpadWest* = 433
  controllerActionOriginLenovoLegionGoDpadEast* = 434
  controllerActionOriginLenovoLegionGoGyroMove* = 435
  controllerActionOriginLenovoLegionGoGyroPitch* = 436
  controllerActionOriginLenovoLegionGoGyroYaw* = 437
  controllerActionOriginLenovoLegionGoGyroRoll* = 438
  controllerActionOriginLenovoLegionGoReserved1* = 439
  controllerActionOriginLenovoLegionGoReserved2* = 440
  controllerActionOriginLenovoLegionGoReserved3* = 441
  controllerActionOriginLenovoLegionGoReserved4* = 442
  controllerActionOriginLenovoLegionGoReserved5* = 443
  controllerActionOriginLenovoLegionGoReserved6* = 444
  controllerActionOriginLenovoLegionGoReserved7* = 445
  controllerActionOriginLenovoLegionGoReserved8* = 446
  controllerActionOriginLenovoLegionGoReserved9* = 447
  controllerActionOriginLenovoLegionGoReserved10* = 448
  controllerActionOriginLenovoLegionGoReserved11* = 449
  controllerActionOriginLenovoLegionGoReserved12* = 450
  controllerActionOriginLenovoLegionGoReserved13* = 451
  controllerActionOriginLenovoLegionGoReserved14* = 452
  controllerActionOriginLenovoLegionGoReserved15* = 453
  controllerActionOriginLenovoLegionGoReserved16* = 454
  controllerActionOriginLenovoLegionGoReserved17* = 455
  controllerActionOriginLenovoLegionGoReserved18* = 456
  controllerActionOriginLenovoLegionGoReserved19* = 457
  controllerActionOriginLenovoLegionGoReserved20* = 458
  controllerActionOriginGenericL4* = 459
  controllerActionOriginGenericR4* = 460
  controllerActionOriginGenericL5* = 461
  controllerActionOriginGenericR5* = 462
  controllerActionOriginGenericPl* = 463
  controllerActionOriginGenericPr* = 464
  controllerActionOriginGenericC* = 465
  controllerActionOriginGenericZ* = 466
  controllerActionOriginGenericMisc1* = 467
  controllerActionOriginGenericMisc2* = 468
  controllerActionOriginGenericMisc3* = 469
  controllerActionOriginGenericMisc4* = 470
  controllerActionOriginGenericMisc5* = 471
  controllerActionOriginGenericMisc6* = 472
  controllerActionOriginGenericMisc7* = 473
  controllerActionOriginGenericMisc8* = 474
  controllerActionOriginCount* = 475
  controllerActionOriginMaximumPossibleValue* = 32767

# ControllerLEDFlag
const
  controllerLedFlagSetColor* = 0
  controllerLedFlagRestoreUserDefault* = 1

# UGCMatchingUGCType
const
  ugcMatchingUgcTypeItems* = 0
  ugcMatchingUgcTypeItemsMtx* = 1
  ugcMatchingUgcTypeItemsReadyToUse* = 2
  ugcMatchingUgcTypeCollections* = 3
  ugcMatchingUgcTypeArtwork* = 4
  ugcMatchingUgcTypeVideos* = 5
  ugcMatchingUgcTypeScreenshots* = 6
  ugcMatchingUgcTypeAllGuides* = 7
  ugcMatchingUgcTypeWebGuides* = 8
  ugcMatchingUgcTypeIntegratedGuides* = 9
  ugcMatchingUgcTypeUsableInGame* = 10
  ugcMatchingUgcTypeControllerBindings* = 11
  ugcMatchingUgcTypeGameManagedItems* = 12
  ugcMatchingUgcTypeAll* = -1

# UserUGCList
const
  userUgcListPublished* = 0
  userUgcListVotedOn* = 1
  userUgcListVotedUp* = 2
  userUgcListVotedDown* = 3
  userUgcListWillVoteLater* = 4
  userUgcListFavorited* = 5
  userUgcListSubscribed* = 6
  userUgcListUsedOrPlayed* = 7
  userUgcListFollowed* = 8

# UserUGCListSortOrder
const
  userUgcListSortOrderCreationOrderDesc* = 0
  userUgcListSortOrderCreationOrderAsc* = 1
  userUgcListSortOrderTitleAsc* = 2
  userUgcListSortOrderLastUpdatedDesc* = 3
  userUgcListSortOrderSubscriptionDateDesc* = 4
  userUgcListSortOrderVoteScoreDesc* = 5
  userUgcListSortOrderForModeration* = 6

# UGCQuery
const
  ugcQueryRankedByVote* = 0
  ugcQueryRankedByPublicationDate* = 1
  ugcQueryAcceptedForGameRankedByAcceptanceDate* = 2
  ugcQueryRankedByTrend* = 3
  ugcQueryFavoritedByFriendsRankedByPublicationDate* = 4
  ugcQueryCreatedByFriendsRankedByPublicationDate* = 5
  ugcQueryRankedByNumTimesReported* = 6
  ugcQueryCreatedByFollowedUsersRankedByPublicationDate* = 7
  ugcQueryNotYetRated* = 8
  ugcQueryRankedByTotalVotesAsc* = 9
  ugcQueryRankedByVotesUp* = 10
  ugcQueryRankedByTextSearch* = 11
  ugcQueryRankedByTotalUniqueSubscriptions* = 12
  ugcQueryRankedByPlaytimeTrend* = 13
  ugcQueryRankedByTotalPlaytime* = 14
  ugcQueryRankedByAveragePlaytimeTrend* = 15
  ugcQueryRankedByLifetimeAveragePlaytime* = 16
  ugcQueryRankedByPlaytimeSessionsTrend* = 17
  ugcQueryRankedByLifetimePlaytimeSessions* = 18
  ugcQueryRankedByLastUpdatedDate* = 19

# ItemUpdateStatus
const
  itemUpdateStatusInvalid* = 0
  itemUpdateStatusPreparingConfig* = 1
  itemUpdateStatusPreparingContent* = 2
  itemUpdateStatusUploadingContent* = 3
  itemUpdateStatusUploadingPreviewFile* = 4
  itemUpdateStatusCommittingChanges* = 5

# ItemState
const
  itemStateNone* = 0
  itemStateSubscribed* = 1
  itemStateLegacyItem* = 2
  itemStateInstalled* = 4
  itemStateNeedsUpdate* = 8
  itemStateDownloading* = 16
  itemStateDownloadPending* = 32
  itemStateDisabledLocally* = 64

# ItemStatistic
const
  itemStatisticNumSubscriptions* = 0
  itemStatisticNumFavorites* = 1
  itemStatisticNumFollowers* = 2
  itemStatisticNumUniqueSubscriptions* = 3
  itemStatisticNumUniqueFavorites* = 4
  itemStatisticNumUniqueFollowers* = 5
  itemStatisticNumUniqueWebsiteViews* = 6
  itemStatisticReportScore* = 7
  itemStatisticNumSecondsPlayed* = 8
  itemStatisticNumPlaytimeSessions* = 9
  itemStatisticNumComments* = 10
  itemStatisticNumSecondsPlayedDuringTimePeriod* = 11
  itemStatisticNumPlaytimeSessionsDuringTimePeriod* = 12

# ItemPreviewType
const
  itemPreviewTypeImage* = 0
  itemPreviewTypeYouTubeVideo* = 1
  itemPreviewTypeSketchfab* = 2
  itemPreviewTypeEnvironmentMapHorizontalCross* = 3
  itemPreviewTypeEnvironmentMapLatLong* = 4
  itemPreviewTypeClip* = 5
  itemPreviewTypeReservedMax* = 255

# UGCContentDescriptorID
const
  ugcContentDescriptorNudityOrSexualContent* = 1
  ugcContentDescriptorFrequentViolenceOrGore* = 2
  ugcContentDescriptorAdultOnlySexualContent* = 3
  ugcContentDescriptorGratuitousSexualContent* = 4
  ugcContentDescriptorAnyMatureContent* = 5

# ItemFlags
const
  itemNoTrade* = 1
  itemRemoved* = 256
  itemConsumed* = 512

# TimelineGameMode
const
  timelineGameModeInvalid* = 0
  timelineGameModePlaying* = 1
  timelineGameModeStaging* = 2
  timelineGameModeMenus* = 3
  timelineGameModeLoadingScreen* = 4
  timelineGameModeMax* = 5

# TimelineEventClipPriority
const
  timelineEventClipPriorityInvalid* = 0
  timelineEventClipPriorityNone* = 1
  timelineEventClipPriorityStandard* = 2
  timelineEventClipPriorityFeatured* = 3

# ParentalFeature
const
  featureInvalid* = 0
  featureStore* = 1
  featureCommunity* = 2
  featureProfile* = 3
  featureFriends* = 4
  featureNews* = 5
  featureTrading* = 6
  featureSettings* = 7
  featureConsole* = 8
  featureBrowser* = 9
  featureParentalSetup* = 10
  featureLibrary* = 11
  featureTest* = 12
  featureSiteLicense* = 13
  featureKioskModeDeprecated* = 14
  featureBlockAlways* = 15
  featureDesktop* = 16
  featureMax* = 17

# DeviceFormFactor
const
  deviceFormFactorUnknown* = 0
  deviceFormFactorPhone* = 1
  deviceFormFactorTablet* = 2
  deviceFormFactorComputer* = 3
  deviceFormFactorTv* = 4
  deviceFormFactorVrHeadset* = 5

# RemotePlayInputType
const
  remotePlayInputUnknown* = 0
  remotePlayInputMouseMotion* = 1
  remotePlayInputMouseButtonDown* = 2
  remotePlayInputMouseButtonUp* = 3
  remotePlayInputMouseWheel* = 4
  remotePlayInputKeyDown* = 5
  remotePlayInputKeyUp* = 6

# RemotePlayMouseButton
const
  remotePlayMouseButtonLeft* = 1
  remotePlayMouseButtonRight* = 2
  remotePlayMouseButtonMiddle* = 16
  remotePlayMouseButtonX1* = 32
  remotePlayMouseButtonX2* = 64

# RemotePlayMouseWheelDirection
const
  remotePlayMouseWheelUp* = 1
  remotePlayMouseWheelDown* = 2
  remotePlayMouseWheelLeft* = 3
  remotePlayMouseWheelRight* = 4

# RemotePlayScancode
const
  remotePlayScancodeUnknown* = 0
  remotePlayScancodeA* = 4
  remotePlayScancodeB* = 5
  remotePlayScancodeC* = 6
  remotePlayScancodeD* = 7
  remotePlayScancodeE* = 8
  remotePlayScancodeF* = 9
  remotePlayScancodeG* = 10
  remotePlayScancodeH* = 11
  remotePlayScancodeI* = 12
  remotePlayScancodeJ* = 13
  remotePlayScancodeK* = 14
  remotePlayScancodeL* = 15
  remotePlayScancodeM* = 16
  remotePlayScancodeN* = 17
  remotePlayScancodeO* = 18
  remotePlayScancodeP* = 19
  remotePlayScancodeQ* = 20
  remotePlayScancodeR* = 21
  remotePlayScancodeS* = 22
  remotePlayScancodeT* = 23
  remotePlayScancodeU* = 24
  remotePlayScancodeV* = 25
  remotePlayScancodeW* = 26
  remotePlayScancodeX* = 27
  remotePlayScancodeY* = 28
  remotePlayScancodeZ* = 29
  remotePlayScancode1* = 30
  remotePlayScancode2* = 31
  remotePlayScancode3* = 32
  remotePlayScancode4* = 33
  remotePlayScancode5* = 34
  remotePlayScancode6* = 35
  remotePlayScancode7* = 36
  remotePlayScancode8* = 37
  remotePlayScancode9* = 38
  remotePlayScancode0* = 39
  remotePlayScancodeReturn* = 40
  remotePlayScancodeEscape* = 41
  remotePlayScancodeBackspace* = 42
  remotePlayScancodeTab* = 43
  remotePlayScancodeSpace* = 44
  remotePlayScancodeMinus* = 45
  remotePlayScancodeEquals* = 46
  remotePlayScancodeLeftBracket* = 47
  remotePlayScancodeRightBracket* = 48
  remotePlayScancodeBackslash* = 49
  remotePlayScancodeSemicolon* = 51
  remotePlayScancodeApostrophe* = 52
  remotePlayScancodeGrave* = 53
  remotePlayScancodeComma* = 54
  remotePlayScancodePeriod* = 55
  remotePlayScancodeSlash* = 56
  remotePlayScancodeCapsLock* = 57
  remotePlayScancodeF1* = 58
  remotePlayScancodeF2* = 59
  remotePlayScancodeF3* = 60
  remotePlayScancodeF4* = 61
  remotePlayScancodeF5* = 62
  remotePlayScancodeF6* = 63
  remotePlayScancodeF7* = 64
  remotePlayScancodeF8* = 65
  remotePlayScancodeF9* = 66
  remotePlayScancodeF10* = 67
  remotePlayScancodeF11* = 68
  remotePlayScancodeF12* = 69
  remotePlayScancodeInsert* = 73
  remotePlayScancodeHome* = 74
  remotePlayScancodePageUp* = 75
  remotePlayScancodeDelete* = 76
  remotePlayScancodeEnd* = 77
  remotePlayScancodePageDown* = 78
  remotePlayScancodeRight* = 79
  remotePlayScancodeLeft* = 80
  remotePlayScancodeDown* = 81
  remotePlayScancodeUp* = 82
  remotePlayScancodeKeypadDivide* = 84
  remotePlayScancodeKeypadMultiply* = 85
  remotePlayScancodeKeypadMinus* = 86
  remotePlayScancodeKeypadPlus* = 87
  remotePlayScancodeKeypadEnter* = 88
  remotePlayScancodeKeypad1* = 89
  remotePlayScancodeKeypad2* = 90
  remotePlayScancodeKeypad3* = 91
  remotePlayScancodeKeypad4* = 92
  remotePlayScancodeKeypad5* = 93
  remotePlayScancodeKeypad6* = 94
  remotePlayScancodeKeypad7* = 95
  remotePlayScancodeKeypad8* = 96
  remotePlayScancodeKeypad9* = 97
  remotePlayScancodeKeypad0* = 98
  remotePlayScancodeKeypadPeriod* = 99
  remotePlayScancodeLeftControl* = 224
  remotePlayScancodeLeftShift* = 225
  remotePlayScancodeLeftAlt* = 226
  remotePlayScancodeLeftGui* = 227
  remotePlayScancodeRightControl* = 228
  remotePlayScancodeRightShift* = 229
  remotePlayScancodeRightAlt* = 230
  remotePlayScancodeRightGui* = 231

# RemotePlayKeyModifier
const
  remotePlayKeyModifierNone* = 0
  remotePlayKeyModifierLeftShift* = 1
  remotePlayKeyModifierRightShift* = 2
  remotePlayKeyModifierLeftControl* = 64
  remotePlayKeyModifierRightControl* = 128
  remotePlayKeyModifierLeftAlt* = 256
  remotePlayKeyModifierRightAlt* = 512
  remotePlayKeyModifierLeftGui* = 1024
  remotePlayKeyModifierRightGui* = 2048
  remotePlayKeyModifierNumLock* = 4096
  remotePlayKeyModifierCapsLock* = 8192
  remotePlayKeyModifierMask* = 65535

# NetworkingAvailability
const
  networkingAvailabilityCannotTry* = -102
  networkingAvailabilityFailed* = -101
  networkingAvailabilityPreviously* = -100
  networkingAvailabilityRetrying* = -10
  networkingAvailabilityNeverTried* = 1
  networkingAvailabilityWaiting* = 2
  networkingAvailabilityAttempting* = 3
  networkingAvailabilityCurrent* = 100
  networkingAvailabilityUnknown* = 0
  networkingAvailabilityForce32bit* = 2147483647

# NetworkingIdentityType
const
  networkingIdentityTypeInvalid* = 0
  networkingIdentityTypeSteamId* = 16
  networkingIdentityTypeXboxPairwiseId* = 17
  networkingIdentityTypeSonyPsn* = 18
  networkingIdentityTypeIpAddress* = 1
  networkingIdentityTypeGenericString* = 2
  networkingIdentityTypeGenericBytes* = 3
  networkingIdentityTypeUnknownType* = 4
  networkingIdentityTypeForce32bit* = 2147483647

# NetworkingFakeIPType
const
  networkingFakeIpTypeInvalid* = 0
  networkingFakeIpTypeNotFake* = 1
  networkingFakeIpTypeGlobalIpv4* = 2
  networkingFakeIpTypeLocalIpv4* = 3
  networkingFakeIpTypeForce32Bit* = 2147483647

# NetworkingConnectionState
const
  networkingConnectionStateNone* = 0
  networkingConnectionStateConnecting* = 1
  networkingConnectionStateFindingRoute* = 2
  networkingConnectionStateConnected* = 3
  networkingConnectionStateClosedByPeer* = 4
  networkingConnectionStateProblemDetectedLocally* = 5
  networkingConnectionStateFinWait* = -1
  networkingConnectionStateLinger* = -2
  networkingConnectionStateDead* = -3
  networkingConnectionStateForce32Bit* = 2147483647

# NetConnectionEnd
const
  netConnectionEndInvalid* = 0
  netConnectionEndAppMin* = 1000
  netConnectionEndAppGeneric* = 1000
  netConnectionEndAppMax* = 1999
  netConnectionEndAppExceptionMin* = 2000
  netConnectionEndAppExceptionGeneric* = 2000
  netConnectionEndAppExceptionMax* = 2999
  netConnectionEndLocalMin* = 3000
  netConnectionEndLocalOfflineMode* = 3001
  netConnectionEndLocalManyRelayConnectivity* = 3002
  netConnectionEndLocalHostedServerPrimaryRelay* = 3003
  netConnectionEndLocalNetworkConfig* = 3004
  netConnectionEndLocalRights* = 3005
  netConnectionEndLocalP2PIceNoPublicAddresses* = 3006
  netConnectionEndLocalMax* = 3999
  netConnectionEndRemoteMin* = 4000
  netConnectionEndRemoteTimeout* = 4001
  netConnectionEndRemoteBadCrypt* = 4002
  netConnectionEndRemoteBadCert* = 4003
  netConnectionEndRemoteBadProtocolVersion* = 4006
  netConnectionEndRemoteP2PIceNoPublicAddresses* = 4007
  netConnectionEndRemoteMax* = 4999
  netConnectionEndMiscMin* = 5000
  netConnectionEndMiscGeneric* = 5001
  netConnectionEndMiscInternalError* = 5002
  netConnectionEndMiscTimeout* = 5003
  netConnectionEndMiscSteamConnectivity* = 5005
  netConnectionEndMiscNoRelaySessionsToClient* = 5006
  netConnectionEndMiscP2PRendezvous* = 5008
  netConnectionEndMiscP2PNatFirewall* = 5009
  netConnectionEndMiscPeerSentNoConnection* = 5010
  netConnectionEndMiscMax* = 5999
  netConnectionEndForce32Bit* = 2147483647

# NetworkingConfigScope
const
  networkingConfigGlobal* = 1
  networkingConfigSocketsInterface* = 2
  networkingConfigListenSocket* = 3
  networkingConfigConnection* = 4
  networkingConfigScopeForce32Bit* = 2147483647

# NetworkingConfigDataType
const
  networkingConfigInt32* = 1
  networkingConfigInt64* = 2
  networkingConfigFloat* = 3
  networkingConfigString* = 4
  networkingConfigPtr* = 5
  networkingConfigDataTypeForce32Bit* = 2147483647

# NetworkingConfigValue
const
  networkingConfigInvalid* = 0
  networkingConfigTimeoutInitial* = 24
  networkingConfigTimeoutConnected* = 25
  networkingConfigSendBufferSize* = 9
  networkingConfigRecvBufferSize* = 47
  networkingConfigRecvBufferMessages* = 48
  networkingConfigRecvMaxMessageSize* = 49
  networkingConfigRecvMaxSegmentsPerPacket* = 50
  networkingConfigConnectionUserData* = 40
  networkingConfigSendRateMin* = 10
  networkingConfigSendRateMax* = 11
  networkingConfigNagleTime* = 12
  networkingConfigIpAllowWithoutAuth* = 23
  networkingConfigIpLocalHostAllowWithoutAuth* = 52
  networkingConfigMtuPacketSize* = 32
  networkingConfigMtuDataSize* = 33
  networkingConfigUnencrypted* = 34
  networkingConfigSymmetricConnect* = 37
  networkingConfigLocalVirtualPort* = 38
  networkingConfigDualWifiEnable* = 39
  networkingConfigEnableDiagnosticsUi* = 46
  networkingConfigSendTimeSincePreviousPacket* = 59
  networkingConfigFakePacketLossSend* = 2
  networkingConfigFakePacketLossRecv* = 3
  networkingConfigFakePacketLagSend* = 4
  networkingConfigFakePacketLagRecv* = 5
  networkingConfigFakePacketJitterSendAvg* = 53
  networkingConfigFakePacketJitterSendMax* = 54
  networkingConfigFakePacketJitterSendPct* = 55
  networkingConfigFakePacketJitterRecvAvg* = 56
  networkingConfigFakePacketJitterRecvMax* = 57
  networkingConfigFakePacketJitterRecvPct* = 58
  networkingConfigFakePacketReorderSend* = 6
  networkingConfigFakePacketReorderRecv* = 7
  networkingConfigFakePacketReorderTime* = 8
  networkingConfigFakePacketDupSend* = 26
  networkingConfigFakePacketDupRecv* = 27
  networkingConfigFakePacketDupTimeMax* = 28
  networkingConfigPacketTraceMaxBytes* = 41
  networkingConfigFakeRateLimitSendRate* = 42
  networkingConfigFakeRateLimitSendBurst* = 43
  networkingConfigFakeRateLimitRecvRate* = 44
  networkingConfigFakeRateLimitRecvBurst* = 45
  networkingConfigOutOfOrderCorrectionWindowMicroseconds* = 51
  networkingConfigCallbackConnectionStatusChanged* = 201
  networkingConfigCallbackAuthStatusChanged* = 202
  networkingConfigCallbackRelayNetworkStatusChanged* = 203
  networkingConfigCallbackMessagesSessionRequest* = 204
  networkingConfigCallbackMessagesSessionFailed* = 205
  networkingConfigCallbackCreateConnectionSignaling* = 206
  networkingConfigCallbackFakeIpResult* = 207
  networkingConfigP2PStunServerList* = 103
  networkingConfigP2PTransportIceEnable* = 104
  networkingConfigP2PTransportIcePenalty* = 105
  networkingConfigP2PTransportSdrPenalty* = 106
  networkingConfigP2PTurnServerList* = 107
  networkingConfigP2PTurnUserList* = 108
  networkingConfigP2PTurnPassList* = 109
  networkingConfigP2PTransportIceImplementation* = 110
  networkingConfigSdrClientConsecutitivePingTimeoutsFailInitial* = 19
  networkingConfigSdrClientConsecutitivePingTimeoutsFail* = 20
  networkingConfigSdrClientMinPingsBeforePingAccurate* = 21
  networkingConfigSdrClientSingleSocket* = 22
  networkingConfigSdrClientForceRelayCluster* = 29
  networkingConfigSdrClientDevTicket* = 30
  networkingConfigSdrClientForceProxyAddr* = 31
  networkingConfigSdrClientFakeClusterPing* = 36
  networkingConfigSdrClientLimitPingProbesToNearestN* = 60
  networkingConfigLogLevelAckRtt* = 13
  networkingConfigLogLevelPacketDecode* = 14
  networkingConfigLogLevelMessage* = 15
  networkingConfigLogLevelPacketGaps* = 16
  networkingConfigLogLevelP2Prendezvous* = 17
  networkingConfigLogLevelSdrRelayPings* = 18
  networkingConfigEcn* = 999
  networkingConfigSdrClientEnableTosProbes* = 998
  networkingConfigDeletedEnumerateDevVars* = 35
  networkingConfigValueForce32Bit* = 2147483647

# NetworkingGetConfigValueResult
const
  networkingGetConfigValueBadValue* = -1
  networkingGetConfigValueBadScopeObj* = -2
  networkingGetConfigValueBufferTooSmall* = -3
  networkingGetConfigValueOk* = 1
  networkingGetConfigValueOkInherited* = 2
  networkingGetConfigValueResultForce32Bit* = 2147483647

# NetworkingSocketsDebugOutputType
const
  networkingSocketsDebugOutputTypeNone* = 0
  networkingSocketsDebugOutputTypeBug* = 1
  networkingSocketsDebugOutputTypeError* = 2
  networkingSocketsDebugOutputTypeImportant* = 3
  networkingSocketsDebugOutputTypeWarning* = 4
  networkingSocketsDebugOutputTypeMsg* = 5
  networkingSocketsDebugOutputTypeVerbose* = 6
  networkingSocketsDebugOutputTypeDebug* = 7
  networkingSocketsDebugOutputTypeEverything* = 8
  networkingSocketsDebugOutputTypeForce32Bit* = 2147483647

# InitResult
const
  apiInitResultOk* = 0
  apiInitResultFailedGeneric* = 1
  apiInitResultNoSteamClient* = 2
  apiInitResultVersionMismatch* = 3

# ServerMode
const
  eServerModeInvalid* = 0
  eServerModeNoAuthentication* = 1
  eServerModeAuthentication* = 2
  eServerModeAuthenticationAndSecure* = 3

# HTMLMouseButton
const
  eHtmlMouseButtonLeft* = 0
  eHtmlMouseButtonRight* = 1
  eHtmlMouseButtonMiddle* = 2

# HTMLMouseCursor
const
  htmlMouseCursorUser* = 0
  htmlMouseCursorNone* = 1
  htmlMouseCursorArrow* = 2
  htmlMouseCursorIbeam* = 3
  htmlMouseCursorHourglass* = 4
  htmlMouseCursorWaitArrow* = 5
  htmlMouseCursorCrosshair* = 6
  htmlMouseCursorUp* = 7
  htmlMouseCursorSizeNw* = 8
  htmlMouseCursorSizeSe* = 9
  htmlMouseCursorSizeNe* = 10
  htmlMouseCursorSizeSw* = 11
  htmlMouseCursorSizeW* = 12
  htmlMouseCursorSizeE* = 13
  htmlMouseCursorSizeN* = 14
  htmlMouseCursorSizeS* = 15
  htmlMouseCursorSizeWe* = 16
  htmlMouseCursorSizeNs* = 17
  htmlMouseCursorSizeAll* = 18
  htmlMouseCursorNo* = 19
  htmlMouseCursorHand* = 20
  htmlMouseCursorBlank* = 21
  htmlMouseCursorMiddlePan* = 22
  htmlMouseCursorNorthPan* = 23
  htmlMouseCursorNorthEastPan* = 24
  htmlMouseCursorEastPan* = 25
  htmlMouseCursorSouthEastPan* = 26
  htmlMouseCursorSouthPan* = 27
  htmlMouseCursorSouthWestPan* = 28
  htmlMouseCursorWestPan* = 29
  htmlMouseCursorNorthWestPan* = 30
  htmlMouseCursorAlias* = 31
  htmlMouseCursorCell* = 32
  htmlMouseCursorColResize* = 33
  htmlMouseCursorCopyCur* = 34
  htmlMouseCursorVerticalText* = 35
  htmlMouseCursorRowResize* = 36
  htmlMouseCursorZoomIn* = 37
  htmlMouseCursorZoomOut* = 38
  htmlMouseCursorHelp* = 39
  htmlMouseCursorCustom* = 40
  htmlMouseCursorSizeNwse* = 41
  htmlMouseCursorSizeNesw* = 42
  htmlMouseCursorLast* = 43

# HTMLKeyModifiers
const
  eHtmlKeyModifierNone* = 0
  eHtmlKeyModifierAltDown* = 1
  eHtmlKeyModifierCtrlDown* = 2
  eHtmlKeyModifierShiftDown* = 4

# FailureType
const
  failureFlushedCallbackQueue* = 0
  failurePipeFail* = 1

# Callback IDs
const
  steamServersConnectedCallbackId* = 101
  steamServerConnectFailureCallbackId* = 102
  steamServersDisconnectedCallbackId* = 103
  clientGameServerDenyCallbackId* = 113
  ipcFailureCallbackId* = 117
  licensesUpdatedCallbackId* = 125
  validateAuthTicketResponseCallbackId* = 143
  microTxnAuthorizationResponseCallbackId* = 152
  encryptedAppTicketResponseCallbackId* = 154
  getAuthSessionTicketResponseCallbackId* = 163
  gameWebCallbackCallbackId* = 164
  storeAuthUrlResponseCallbackId* = 165
  marketEligibilityResponseCallbackId* = 166
  durationControlCallbackId* = 167
  getTicketForWebApiResponseCallbackId* = 168
  personaStateChangeCallbackId* = 304
  gameOverlayActivatedCallbackId* = 331
  gameServerChangeRequestedCallbackId* = 332
  gameLobbyJoinRequestedCallbackId* = 333
  avatarImageLoadedCallbackId* = 334
  clanOfficerListResponseCallbackId* = 335
  friendRichPresenceUpdateCallbackId* = 336
  gameRichPresenceJoinRequestedCallbackId* = 337
  gameConnectedClanChatMsgCallbackId* = 338
  gameConnectedChatJoinCallbackId* = 339
  gameConnectedChatLeaveCallbackId* = 340
  downloadClanActivityCountsResultCallbackId* = 341
  joinClanChatRoomCompletionResultCallbackId* = 342
  gameConnectedFriendChatMsgCallbackId* = 343
  friendsGetFollowerCountCallbackId* = 344
  friendsIsFollowingCallbackId* = 345
  friendsEnumerateFollowingListCallbackId* = 346
  unreadChatMessagesChangedCallbackId* = 348
  overlayBrowserProtocolNavigationCallbackId* = 349
  equippedProfileItemsChangedCallbackId* = 350
  equippedProfileItemsCallbackId* = 351
  ipCountryCallbackId* = 701
  lowBatteryPowerCallbackId* = 702
  steamApiCallCompletedCallbackId* = 703
  steamShutdownCallbackId* = 704
  checkFileSignatureCallbackId* = 705
  gamepadTextInputDismissedCallbackId* = 714
  appResumingFromSuspendCallbackId* = 736
  floatingGamepadTextInputDismissedCallbackId* = 738
  filterTextDictionaryChangedCallbackId* = 739
  favoritesListChangedCallbackId* = 502
  lobbyInviteCallbackId* = 503
  lobbyEnterCallbackId* = 504
  lobbyDataUpdateCallbackId* = 505
  lobbyChatUpdateCallbackId* = 506
  lobbyChatMsgCallbackId* = 507
  lobbyGameCreatedCallbackId* = 509
  lobbyMatchListCallbackId* = 510
  lobbyKickedCallbackId* = 512
  lobbyCreatedCallbackId* = 513
  favoritesListAccountsUpdatedCallbackId* = 516
  joinPartyCallbackCallbackId* = 5301
  createBeaconCallbackCallbackId* = 5302
  reservationNotificationCallbackCallbackId* = 5303
  changeNumOpenSlotsCallbackCallbackId* = 5304
  availableBeaconLocationsUpdatedCallbackId* = 5305
  activeBeaconsUpdatedCallbackId* = 5306
  remoteStorageFileShareResultCallbackId* = 1307
  remoteStoragePublishFileResultCallbackId* = 1309
  remoteStorageDeletePublishedFileResultCallbackId* = 1311
  remoteStorageEnumerateUserPublishedFilesResultCallbackId* = 1312
  remoteStorageSubscribePublishedFileResultCallbackId* = 1313
  remoteStorageEnumerateUserSubscribedFilesResultCallbackId* = 1314
  remoteStorageUnsubscribePublishedFileResultCallbackId* = 1315
  remoteStorageUpdatePublishedFileResultCallbackId* = 1316
  remoteStorageDownloadUgcResultCallbackId* = 1317
  remoteStorageGetPublishedFileDetailsResultCallbackId* = 1318
  remoteStorageEnumerateWorkshopFilesResultCallbackId* = 1319
  remoteStorageGetPublishedItemVoteDetailsResultCallbackId* = 1320
  remoteStoragePublishedFileSubscribedCallbackId* = 1321
  remoteStoragePublishedFileUnsubscribedCallbackId* = 1322
  remoteStoragePublishedFileDeletedCallbackId* = 1323
  remoteStorageUpdateUserPublishedItemVoteResultCallbackId* = 1324
  remoteStorageUserVoteDetailsCallbackId* = 1325
  remoteStorageEnumerateUserSharedWorkshopFilesResultCallbackId* = 1326
  remoteStorageSetUserPublishedFileActionResultCallbackId* = 1327
  remoteStorageEnumeratePublishedFilesByUserActionResultCallbackId* = 1328
  remoteStoragePublishFileProgressCallbackId* = 1329
  remoteStoragePublishedFileUpdatedCallbackId* = 1330
  remoteStorageFileWriteAsyncCompleteCallbackId* = 1331
  remoteStorageFileReadAsyncCompleteCallbackId* = 1332
  remoteStorageLocalFileChangeCallbackId* = 1333
  userStatsReceivedCallbackId* = 1101
  userStatsStoredCallbackId* = 1102
  userAchievementStoredCallbackId* = 1103
  leaderboardFindResultCallbackId* = 1104
  leaderboardScoresDownloadedCallbackId* = 1105
  leaderboardScoreUploadedCallbackId* = 1106
  numberOfCurrentPlayersCallbackId* = 1107
  userStatsUnloadedCallbackId* = 1108
  userAchievementIconFetchedCallbackId* = 1109
  globalAchievementPercentagesReadyCallbackId* = 1110
  leaderboardUgcSetCallbackId* = 1111
  globalStatsReceivedCallbackId* = 1112
  dlcInstalledCallbackId* = 1005
  newUrlLaunchParametersCallbackId* = 1014
  appProofOfPurchaseKeyResponseCallbackId* = 1021
  fileDetailsResultCallbackId* = 1023
  timedTrialStatusCallbackId* = 1030
  p2PsessionRequestCallbackId* = 1202
  p2PsessionConnectFailCallbackId* = 1203
  socketStatusCallbackCallbackId* = 1201
  screenshotReadyCallbackId* = 2301
  screenshotRequestedCallbackId* = 2302
  playbackStatusHasChangedCallbackId* = 4001
  volumeHasChangedCallbackId* = 4002
  httpRequestCompletedCallbackId* = 2101
  httpRequestHeadersReceivedCallbackId* = 2102
  httpRequestDataReceivedCallbackId* = 2103
  steamInputDeviceConnectedCallbackId* = 2801
  steamInputDeviceDisconnectedCallbackId* = 2802
  steamInputConfigurationLoadedCallbackId* = 2803
  steamInputGamepadSlotChangeCallbackId* = 2804
  steamUgcQueryCompletedCallbackId* = 3401
  steamUgcRequestUgcDetailsResultCallbackId* = 3402
  createItemResultCallbackId* = 3403
  submitItemUpdateResultCallbackId* = 3404
  itemInstalledCallbackId* = 3405
  downloadItemResultCallbackId* = 3406
  userFavoriteItemsListChangedCallbackId* = 3407
  setUserItemVoteResultCallbackId* = 3408
  getUserItemVoteResultCallbackId* = 3409
  startPlaytimeTrackingResultCallbackId* = 3410
  stopPlaytimeTrackingResultCallbackId* = 3411
  addUgcDependencyResultCallbackId* = 3412
  removeUgcDependencyResultCallbackId* = 3413
  addAppDependencyResultCallbackId* = 3414
  removeAppDependencyResultCallbackId* = 3415
  getAppDependenciesResultCallbackId* = 3416
  deleteItemResultCallbackId* = 3417
  userSubscribedItemsListChangedCallbackId* = 3418
  workshopEulaStatusCallbackId* = 3420
  htmlBrowserReadyCallbackId* = 4501
  htmlNeedsPaintCallbackId* = 4502
  htmlStartRequestCallbackId* = 4503
  htmlCloseBrowserCallbackId* = 4504
  htmlUrlChangedCallbackId* = 4505
  htmlFinishedRequestCallbackId* = 4506
  htmlOpenLinkInNewTabCallbackId* = 4507
  htmlChangedTitleCallbackId* = 4508
  htmlSearchResultsCallbackId* = 4509
  htmlCanGoBackAndForwardCallbackId* = 4510
  htmlHorizontalScrollCallbackId* = 4511
  htmlVerticalScrollCallbackId* = 4512
  htmlLinkAtPositionCallbackId* = 4513
  htmlJsAlertCallbackId* = 4514
  htmlJsConfirmCallbackId* = 4515
  htmlFileOpenDialogCallbackId* = 4516
  htmlNewWindowCallbackId* = 4521
  htmlSetCursorCallbackId* = 4522
  htmlStatusTextCallbackId* = 4523
  htmlShowToolTipCallbackId* = 4524
  htmlUpdateToolTipCallbackId* = 4525
  htmlHideToolTipCallbackId* = 4526
  htmlBrowserRestartedCallbackId* = 4527
  steamInventoryResultReadyCallbackId* = 4700
  steamInventoryFullUpdateCallbackId* = 4701
  steamInventoryDefinitionUpdateCallbackId* = 4702
  steamInventoryEligiblePromoItemDefIdsCallbackId* = 4703
  steamInventoryStartPurchaseResultCallbackId* = 4704
  steamInventoryRequestPricesResultCallbackId* = 4705
  steamTimelineGamePhaseRecordingExistsCallbackId* = 6001
  steamTimelineEventRecordingExistsCallbackId* = 6002
  getVideoUrlResultCallbackId* = 4611
  getOpfSettingsResultCallbackId* = 4624
  broadcastUploadStartCallbackId* = 4604
  broadcastUploadStopCallbackId* = 4605
  steamParentalSettingsChangedCallbackId* = 5001
  steamRemotePlaySessionConnectedCallbackId* = 5701
  steamRemotePlaySessionDisconnectedCallbackId* = 5702
  steamRemotePlayTogetherGuestInviteCallbackId* = 5703
  steamRemotePlaySessionAvatarLoadedCallbackId* = 5704
  steamNetworkingMessagesSessionRequestCallbackId* = 1251
  steamNetworkingMessagesSessionFailedCallbackId* = 1252
  steamNetConnectionStatusChangedCallbackCallbackId* = 1221
  steamNetAuthenticationStatusCallbackId* = 1222
  steamRelayNetworkStatusCallbackId* = 1281
  gsClientApproveCallbackId* = 201
  gsClientDenyCallbackId* = 202
  gsClientKickCallbackId* = 203
  gsClientAchievementStatusCallbackId* = 206
  gsPolicyResponseCallbackId* = 115
  gsGameplayStatsCallbackId* = 207
  gsClientGroupStatusCallbackId* = 208
  gsReputationCallbackId* = 209
  associateWithClanResultCallbackId* = 210
  computeNewPlayerCompatibilityResultCallbackId* = 211
  gsStatsReceivedCallbackId* = 1800
  gsStatsStoredCallbackId* = 1801
  gsStatsUnloadedCallbackId* = 1108
  steamNetworkingFakeIpResultCallbackId* = 1223

const
  initOk* = apiInitResultOk
  initFailedGeneric* = apiInitResultFailedGeneric
  initNoSteamClient* = apiInitResultNoSteamClient
  initVersionMismatch* = apiInitResultVersionMismatch

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

proc SteamUser*(): ISteamUser {.importc: "SteamAPI_SteamUser_v023".}
proc SteamFriends*(): ISteamFriends {.importc: "SteamAPI_SteamFriends_v018".}
proc SteamUtils*(): ISteamUtils {.importc: "SteamAPI_SteamUtils_v010".}
proc SteamGameServerUtils*(): ISteamUtils {.importc: "SteamAPI_SteamGameServerUtils_v010".}
proc SteamMatchmaking*(): ISteamMatchmaking {.importc: "SteamAPI_SteamMatchmaking_v009".}
proc SteamMatchmakingServers*(): ISteamMatchmakingServers {.importc: "SteamAPI_SteamMatchmakingServers_v002".}
proc SteamParties*(): ISteamParties {.importc: "SteamAPI_SteamParties_v002".}
proc SteamRemoteStorage*(): ISteamRemoteStorage {.importc: "SteamAPI_SteamRemoteStorage_v016".}
proc SteamUserStats*(): ISteamUserStats {.importc: "SteamAPI_SteamUserStats_v013".}
proc SteamApps*(): ISteamApps {.importc: "SteamAPI_SteamApps_v009".}
proc SteamNetworking*(): ISteamNetworking {.importc: "SteamAPI_SteamNetworking_v006".}
proc SteamGameServerNetworking*(): ISteamNetworking {.importc: "SteamAPI_SteamGameServerNetworking_v006".}
proc SteamScreenshots*(): ISteamScreenshots {.importc: "SteamAPI_SteamScreenshots_v003".}
proc SteamMusic*(): ISteamMusic {.importc: "SteamAPI_SteamMusic_v001".}
proc SteamHTTP*(): ISteamHTTP {.importc: "SteamAPI_SteamHTTP_v003".}
proc SteamGameServerHTTP*(): ISteamHTTP {.importc: "SteamAPI_SteamGameServerHTTP_v003".}
proc SteamInput*(): ISteamInput {.importc: "SteamAPI_SteamInput_v006".}
proc SteamController*(): ISteamController {.importc: "SteamAPI_SteamController_v008".}
proc SteamUGC*(): ISteamUGC {.importc: "SteamAPI_SteamUGC_v021".}
proc SteamGameServerUGC*(): ISteamUGC {.importc: "SteamAPI_SteamGameServerUGC_v021".}
proc SteamHTMLSurface*(): ISteamHTMLSurface {.importc: "SteamAPI_SteamHTMLSurface_v005".}
proc SteamInventory*(): ISteamInventory {.importc: "SteamAPI_SteamInventory_v003".}
proc SteamGameServerInventory*(): ISteamInventory {.importc: "SteamAPI_SteamGameServerInventory_v003".}
proc SteamTimeline*(): ISteamTimeline {.importc: "SteamAPI_SteamTimeline_v004".}
proc SteamVideo*(): ISteamVideo {.importc: "SteamAPI_SteamVideo_v007".}
proc SteamParentalSettings*(): ISteamParentalSettings {.importc: "SteamAPI_SteamParentalSettings_v001".}
proc SteamRemotePlay*(): ISteamRemotePlay {.importc: "SteamAPI_SteamRemotePlay_v004".}
proc SteamNetworkingMessages_SteamAPI*(): ISteamNetworkingMessages {.importc: "SteamAPI_SteamNetworkingMessages_SteamAPI_v002".}
proc SteamGameServerNetworkingMessages_SteamAPI*(): ISteamNetworkingMessages {.importc: "SteamAPI_SteamGameServerNetworkingMessages_SteamAPI_v002".}
proc SteamNetworkingSockets_SteamAPI*(): ISteamNetworkingSockets {.importc: "SteamAPI_SteamNetworkingSockets_SteamAPI_v012".}
proc SteamGameServerNetworkingSockets_SteamAPI*(): ISteamNetworkingSockets {.importc: "SteamAPI_SteamGameServerNetworkingSockets_SteamAPI_v012".}
proc SteamNetworkingUtils_SteamAPI*(): ISteamNetworkingUtils {.importc: "SteamAPI_SteamNetworkingUtils_SteamAPI_v004".}
proc SteamGameServer*(): ISteamGameServer {.importc: "SteamAPI_SteamGameServer_v015".}
proc SteamGameServerStats*(): ISteamGameServerStats {.importc: "SteamAPI_SteamGameServerStats_v001".}
# ISteamClient
proc createSteamPipe*(self: ISteamClient): HSteamPipe {.importc: "SteamAPI_ISteamClient_CreateSteamPipe".}
proc releaseSteamPipe*(self: ISteamClient, hSteamPipe: HSteamPipe): bool {.importc: "SteamAPI_ISteamClient_BReleaseSteamPipe".}
proc connectToGlobalUser*(self: ISteamClient, hSteamPipe: HSteamPipe): HSteamUser {.importc: "SteamAPI_ISteamClient_ConnectToGlobalUser".}
proc createLocalUser*(self: ISteamClient, phSteamPipe: ptr HSteamPipe, accountType: AccountType): HSteamUser {.importc: "SteamAPI_ISteamClient_CreateLocalUser".}
proc releaseUser*(self: ISteamClient, hSteamPipe: HSteamPipe, hUser: HSteamUser) {.importc: "SteamAPI_ISteamClient_ReleaseUser".}
proc getIsteamUserRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamUser {.importc: "SteamAPI_ISteamClient_GetISteamUser".}
proc getIsteamGameServerRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamGameServer {.importc: "SteamAPI_ISteamClient_GetISteamGameServer".}
proc setLocalIpBinding*(self: ISteamClient, ip: ptr SteamIPAddress, port: uint16) {.importc: "SteamAPI_ISteamClient_SetLocalIPBinding".}
proc getIsteamFriendsRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamFriends {.importc: "SteamAPI_ISteamClient_GetISteamFriends".}
proc getIsteamUtilsRaw(self: ISteamClient, hSteamPipe: HSteamPipe, version: cstring): ISteamUtils {.importc: "SteamAPI_ISteamClient_GetISteamUtils".}
proc getIsteamMatchmakingRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamMatchmaking {.importc: "SteamAPI_ISteamClient_GetISteamMatchmaking".}
proc getIsteamMatchmakingServersRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamMatchmakingServers {.importc: "SteamAPI_ISteamClient_GetISteamMatchmakingServers".}
proc getIsteamGenericInterfaceRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): pointer {.importc: "SteamAPI_ISteamClient_GetISteamGenericInterface".}
proc getIsteamUserStatsRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamUserStats {.importc: "SteamAPI_ISteamClient_GetISteamUserStats".}
proc getIsteamGameServerStatsRaw(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamGameServerStats {.importc: "SteamAPI_ISteamClient_GetISteamGameServerStats".}
proc getIsteamAppsRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamApps {.importc: "SteamAPI_ISteamClient_GetISteamApps".}
proc getIsteamNetworkingRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamNetworking {.importc: "SteamAPI_ISteamClient_GetISteamNetworking".}
proc getIsteamRemoteStorageRaw(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamRemoteStorage {.importc: "SteamAPI_ISteamClient_GetISteamRemoteStorage".}
proc getIsteamScreenshotsRaw(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamScreenshots {.importc: "SteamAPI_ISteamClient_GetISteamScreenshots".}
proc getIpcCallCount*(self: ISteamClient): uint32 {.importc: "SteamAPI_ISteamClient_GetIPCCallCount".}
proc setWarningMessageHook*(self: ISteamClient, function: SteamAPIWarningMessageHook) {.importc: "SteamAPI_ISteamClient_SetWarningMessageHook".}
proc shutdownIfAllPipesClosed*(self: ISteamClient): bool {.importc: "SteamAPI_ISteamClient_BShutdownIfAllPipesClosed".}
proc getIsteamHttpRaw(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamHTTP {.importc: "SteamAPI_ISteamClient_GetISteamHTTP".}
proc getIsteamControllerRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamController {.importc: "SteamAPI_ISteamClient_GetISteamController".}
proc getIsteamUgcRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamUGC {.importc: "SteamAPI_ISteamClient_GetISteamUGC".}
proc getIsteamMusicRaw(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamMusic {.importc: "SteamAPI_ISteamClient_GetISteamMusic".}
proc getIsteamHtmlSurfaceRaw(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamHTMLSurface {.importc: "SteamAPI_ISteamClient_GetISteamHTMLSurface".}
proc getIsteamInventoryRaw(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamInventory {.importc: "SteamAPI_ISteamClient_GetISteamInventory".}
proc getIsteamVideoRaw(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamVideo {.importc: "SteamAPI_ISteamClient_GetISteamVideo".}
proc getIsteamParentalSettingsRaw(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamParentalSettings {.importc: "SteamAPI_ISteamClient_GetISteamParentalSettings".}
proc getIsteamInputRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamInput {.importc: "SteamAPI_ISteamClient_GetISteamInput".}
proc getIsteamPartiesRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamParties {.importc: "SteamAPI_ISteamClient_GetISteamParties".}
proc getIsteamRemotePlayRaw(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: cstring): ISteamRemotePlay {.importc: "SteamAPI_ISteamClient_GetISteamRemotePlay".}

# ISteamUser
proc getHsteamUser*(self: ISteamUser): HSteamUser {.importc: "SteamAPI_ISteamUser_GetHSteamUser".}
proc loggedOn*(self: ISteamUser): bool {.importc: "SteamAPI_ISteamUser_BLoggedOn".}
proc getSteamId*(self: ISteamUser): SteamId {.importc: "SteamAPI_ISteamUser_GetSteamID".}
proc initiateGameConnectionDeprecated*(self: ISteamUser, authBlob: pointer, maxAuthBlob: cint, steamIdGameServer: SteamId, ipServer: uint32, portServer: uint16, secure: bool): cint {.importc: "SteamAPI_ISteamUser_InitiateGameConnection_DEPRECATED".}
proc terminateGameConnectionDeprecated*(self: ISteamUser, ipServer: uint32, portServer: uint16) {.importc: "SteamAPI_ISteamUser_TerminateGameConnection_DEPRECATED".}
proc trackAppUsageEventRaw(self: ISteamUser, gameId: GameId, appUsageEvent: cint, extraInfo: cstring) {.importc: "SteamAPI_ISteamUser_TrackAppUsageEvent".}
proc getUserDataFolderRaw(self: ISteamUser, buffer: ptr char, buffer2: cint): bool {.importc: "SteamAPI_ISteamUser_GetUserDataFolder".}
proc startVoiceRecording*(self: ISteamUser) {.importc: "SteamAPI_ISteamUser_StartVoiceRecording".}
proc stopVoiceRecording*(self: ISteamUser) {.importc: "SteamAPI_ISteamUser_StopVoiceRecording".}
proc getAvailableVoice*(self: ISteamUser, pcbCompressed: ptr uint32, pcbUncompressedDeprecated: ptr uint32, uncompressedVoiceDesiredSampleRateDeprecated: uint32): VoiceResult {.importc: "SteamAPI_ISteamUser_GetAvailableVoice".}
proc getVoice*(self: ISteamUser, wantCompressed: bool, destBuffer: pointer, destBufferSize: uint32, bytesWritten: ptr uint32, wantUncompressedDeprecated: bool, uncompressedDestBufferDeprecated: pointer, uncompressedDestBufferSizeDeprecated: uint32, uncompressBytesWrittenDeprecated: ptr uint32, uncompressedVoiceDesiredSampleRateDeprecated: uint32): VoiceResult {.importc: "SteamAPI_ISteamUser_GetVoice".}
proc decompressVoice*(self: ISteamUser, compressed: pointer, compressed2: uint32, destBuffer: pointer, destBufferSize: uint32, bytesWritten: ptr uint32, desiredSampleRate: uint32): VoiceResult {.importc: "SteamAPI_ISteamUser_DecompressVoice".}
proc getVoiceOptimalSampleRate*(self: ISteamUser): uint32 {.importc: "SteamAPI_ISteamUser_GetVoiceOptimalSampleRate".}
proc getAuthSessionTicket*(self: ISteamUser, ticket: pointer, maxTicket: cint, pcbTicket: ptr uint32, steamNetworkingIdentity: ptr SteamNetworkingIdentity): HAuthTicket {.importc: "SteamAPI_ISteamUser_GetAuthSessionTicket".}
proc getAuthTicketForWebApiRaw(self: ISteamUser, identity: cstring): HAuthTicket {.importc: "SteamAPI_ISteamUser_GetAuthTicketForWebApi".}
proc beginAuthSession*(self: ISteamUser, authTicket: pointer, authTicket2: cint, steamId: SteamId): BeginAuthSessionResult {.importc: "SteamAPI_ISteamUser_BeginAuthSession".}
proc endAuthSession*(self: ISteamUser, steamId: SteamId) {.importc: "SteamAPI_ISteamUser_EndAuthSession".}
proc cancelAuthTicket*(self: ISteamUser, hAuthTicket: HAuthTicket) {.importc: "SteamAPI_ISteamUser_CancelAuthTicket".}
proc userHasLicenseForApp*(self: ISteamUser, steamId: SteamId, appId: AppId): UserHasLicenseForAppResult {.importc: "SteamAPI_ISteamUser_UserHasLicenseForApp".}
proc isBehindNat*(self: ISteamUser): bool {.importc: "SteamAPI_ISteamUser_BIsBehindNAT".}
proc advertiseGame*(self: ISteamUser, steamIdGameServer: SteamId, ipServer: uint32, portServer: uint16) {.importc: "SteamAPI_ISteamUser_AdvertiseGame".}
proc requestEncryptedAppTicket*(self: ISteamUser, dataToInclude: pointer, dataToInclude2: cint): SteamAPICall {.importc: "SteamAPI_ISteamUser_RequestEncryptedAppTicket".}
proc getEncryptedAppTicket*(self: ISteamUser, ticket: pointer, maxTicket: cint, pcbTicket: ptr uint32): bool {.importc: "SteamAPI_ISteamUser_GetEncryptedAppTicket".}
proc getGameBadgeLevel*(self: ISteamUser, series: cint, foil: bool): cint {.importc: "SteamAPI_ISteamUser_GetGameBadgeLevel".}
proc getPlayerSteamLevel*(self: ISteamUser): cint {.importc: "SteamAPI_ISteamUser_GetPlayerSteamLevel".}
proc requestStoreAuthUrlRaw(self: ISteamUser, redirectUrl: cstring): SteamAPICall {.importc: "SteamAPI_ISteamUser_RequestStoreAuthURL".}
proc isPhoneVerified*(self: ISteamUser): bool {.importc: "SteamAPI_ISteamUser_BIsPhoneVerified".}
proc isTwoFactorEnabled*(self: ISteamUser): bool {.importc: "SteamAPI_ISteamUser_BIsTwoFactorEnabled".}
proc isPhoneIdentifying*(self: ISteamUser): bool {.importc: "SteamAPI_ISteamUser_BIsPhoneIdentifying".}
proc isPhoneRequiringVerification*(self: ISteamUser): bool {.importc: "SteamAPI_ISteamUser_BIsPhoneRequiringVerification".}
proc getMarketEligibility*(self: ISteamUser): SteamAPICall {.importc: "SteamAPI_ISteamUser_GetMarketEligibility".}
proc getDurationControl*(self: ISteamUser): SteamAPICall {.importc: "SteamAPI_ISteamUser_GetDurationControl".}
proc setDurationControlOnlineState*(self: ISteamUser, newState: DurationControlOnlineState): bool {.importc: "SteamAPI_ISteamUser_BSetDurationControlOnlineState".}

# ISteamFriends
proc getPersonaNameRaw(self: ISteamFriends): cstring {.importc: "SteamAPI_ISteamFriends_GetPersonaName".}
proc getPersonaState*(self: ISteamFriends): PersonaState {.importc: "SteamAPI_ISteamFriends_GetPersonaState".}
proc getFriendCount*(self: ISteamFriends, friendFlags: cint): cint {.importc: "SteamAPI_ISteamFriends_GetFriendCount".}
proc getFriendByIndex*(self: ISteamFriends, friend: cint, friendFlags: cint): SteamId {.importc: "SteamAPI_ISteamFriends_GetFriendByIndex".}
proc getFriendRelationship*(self: ISteamFriends, steamIdFriend: SteamId): FriendRelationship {.importc: "SteamAPI_ISteamFriends_GetFriendRelationship".}
proc getFriendPersonaState*(self: ISteamFriends, steamIdFriend: SteamId): PersonaState {.importc: "SteamAPI_ISteamFriends_GetFriendPersonaState".}
proc getFriendPersonaNameRaw(self: ISteamFriends, steamIdFriend: SteamId): cstring {.importc: "SteamAPI_ISteamFriends_GetFriendPersonaName".}
proc getFriendGamePlayed*(self: ISteamFriends, steamIdFriend: SteamId, friendGameInfo: ptr FriendGameInfo): bool {.importc: "SteamAPI_ISteamFriends_GetFriendGamePlayed".}
proc getFriendPersonaNameHistoryRaw(self: ISteamFriends, steamIdFriend: SteamId, personaName: cint): cstring {.importc: "SteamAPI_ISteamFriends_GetFriendPersonaNameHistory".}
proc getFriendSteamLevel*(self: ISteamFriends, steamIdFriend: SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetFriendSteamLevel".}
proc getPlayerNicknameRaw(self: ISteamFriends, steamIdPlayer: SteamId): cstring {.importc: "SteamAPI_ISteamFriends_GetPlayerNickname".}
proc getFriendsGroupCount*(self: ISteamFriends): cint {.importc: "SteamAPI_ISteamFriends_GetFriendsGroupCount".}
proc getFriendsGroupIdByIndex*(self: ISteamFriends, fg: cint): FriendsGroupID {.importc: "SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex".}
proc getFriendsGroupNameRaw(self: ISteamFriends, friendsGroupId: FriendsGroupID): cstring {.importc: "SteamAPI_ISteamFriends_GetFriendsGroupName".}
proc getFriendsGroupMembersCount*(self: ISteamFriends, friendsGroupId: FriendsGroupID): cint {.importc: "SteamAPI_ISteamFriends_GetFriendsGroupMembersCount".}
proc getFriendsGroupMembersList*(self: ISteamFriends, friendsGroupId: FriendsGroupID, outSteamIdMembers: ptr SteamId, membersCount: cint) {.importc: "SteamAPI_ISteamFriends_GetFriendsGroupMembersList".}
proc hasFriend*(self: ISteamFriends, steamIdFriend: SteamId, friendFlags: cint): bool {.importc: "SteamAPI_ISteamFriends_HasFriend".}
proc getClanCount*(self: ISteamFriends): cint {.importc: "SteamAPI_ISteamFriends_GetClanCount".}
proc getClanByIndex*(self: ISteamFriends, clan: cint): SteamId {.importc: "SteamAPI_ISteamFriends_GetClanByIndex".}
proc getClanNameRaw(self: ISteamFriends, steamIdClan: SteamId): cstring {.importc: "SteamAPI_ISteamFriends_GetClanName".}
proc getClanTagRaw(self: ISteamFriends, steamIdClan: SteamId): cstring {.importc: "SteamAPI_ISteamFriends_GetClanTag".}
proc getClanActivityCounts*(self: ISteamFriends, steamIdClan: SteamId, online: ptr cint, inGame: ptr cint, chatting: ptr cint): bool {.importc: "SteamAPI_ISteamFriends_GetClanActivityCounts".}
proc downloadClanActivityCounts*(self: ISteamFriends, psteamIdClans: ptr SteamId, clansToRequest: cint): SteamAPICall {.importc: "SteamAPI_ISteamFriends_DownloadClanActivityCounts".}
proc getFriendCountFromSource*(self: ISteamFriends, steamIdSource: SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetFriendCountFromSource".}
proc getFriendFromSourceByIndex*(self: ISteamFriends, steamIdSource: SteamId, friend: cint): SteamId {.importc: "SteamAPI_ISteamFriends_GetFriendFromSourceByIndex".}
proc isUserInSource*(self: ISteamFriends, steamIdUser: SteamId, steamIdSource: SteamId): bool {.importc: "SteamAPI_ISteamFriends_IsUserInSource".}
proc setInGameVoiceSpeaking*(self: ISteamFriends, steamIdUser: SteamId, speaking: bool) {.importc: "SteamAPI_ISteamFriends_SetInGameVoiceSpeaking".}
proc activateGameOverlayRaw(self: ISteamFriends, dialog: cstring) {.importc: "SteamAPI_ISteamFriends_ActivateGameOverlay".}
proc activateGameOverlayToUserRaw(self: ISteamFriends, dialog: cstring, steamId: SteamId) {.importc: "SteamAPI_ISteamFriends_ActivateGameOverlayToUser".}
proc activateGameOverlayToWebPageRaw(self: ISteamFriends, url: cstring, mode: ActivateGameOverlayToWebPageMode) {.importc: "SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage".}
proc activateGameOverlayToStore*(self: ISteamFriends, appId: AppId, flag: OverlayToStoreFlag) {.importc: "SteamAPI_ISteamFriends_ActivateGameOverlayToStore".}
proc setPlayedWith*(self: ISteamFriends, steamIdUserPlayedWith: SteamId) {.importc: "SteamAPI_ISteamFriends_SetPlayedWith".}
proc activateGameOverlayInviteDialog*(self: ISteamFriends, steamIdLobby: SteamId) {.importc: "SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog".}
proc getSmallFriendAvatar*(self: ISteamFriends, steamIdFriend: SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetSmallFriendAvatar".}
proc getMediumFriendAvatar*(self: ISteamFriends, steamIdFriend: SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetMediumFriendAvatar".}
proc getLargeFriendAvatar*(self: ISteamFriends, steamIdFriend: SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetLargeFriendAvatar".}
proc requestUserInformation*(self: ISteamFriends, steamIdUser: SteamId, requireNameOnly: bool): bool {.importc: "SteamAPI_ISteamFriends_RequestUserInformation".}
proc requestClanOfficerList*(self: ISteamFriends, steamIdClan: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamFriends_RequestClanOfficerList".}
proc getClanOwner*(self: ISteamFriends, steamIdClan: SteamId): SteamId {.importc: "SteamAPI_ISteamFriends_GetClanOwner".}
proc getClanOfficerCount*(self: ISteamFriends, steamIdClan: SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetClanOfficerCount".}
proc getClanOfficerByIndex*(self: ISteamFriends, steamIdClan: SteamId, officer: cint): SteamId {.importc: "SteamAPI_ISteamFriends_GetClanOfficerByIndex".}
proc setRichPresenceRaw(self: ISteamFriends, key: cstring, value: cstring): bool {.importc: "SteamAPI_ISteamFriends_SetRichPresence".}
proc clearRichPresence*(self: ISteamFriends) {.importc: "SteamAPI_ISteamFriends_ClearRichPresence".}
proc getFriendRichPresenceRaw(self: ISteamFriends, steamIdFriend: SteamId, key: cstring): cstring {.importc: "SteamAPI_ISteamFriends_GetFriendRichPresence".}
proc getFriendRichPresenceKeyCount*(self: ISteamFriends, steamIdFriend: SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount".}
proc getFriendRichPresenceKeyByIndexRaw(self: ISteamFriends, steamIdFriend: SteamId, key: cint): cstring {.importc: "SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex".}
proc requestFriendRichPresence*(self: ISteamFriends, steamIdFriend: SteamId) {.importc: "SteamAPI_ISteamFriends_RequestFriendRichPresence".}
proc inviteUserToGameRaw(self: ISteamFriends, steamIdFriend: SteamId, connectString: cstring): bool {.importc: "SteamAPI_ISteamFriends_InviteUserToGame".}
proc getCoplayFriendCount*(self: ISteamFriends): cint {.importc: "SteamAPI_ISteamFriends_GetCoplayFriendCount".}
proc getCoplayFriend*(self: ISteamFriends, coplayFriend: cint): SteamId {.importc: "SteamAPI_ISteamFriends_GetCoplayFriend".}
proc getFriendCoplayTime*(self: ISteamFriends, steamIdFriend: SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetFriendCoplayTime".}
proc getFriendCoplayGame*(self: ISteamFriends, steamIdFriend: SteamId): AppId {.importc: "SteamAPI_ISteamFriends_GetFriendCoplayGame".}
proc joinClanChatRoom*(self: ISteamFriends, steamIdClan: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamFriends_JoinClanChatRoom".}
proc leaveClanChatRoom*(self: ISteamFriends, steamIdClan: SteamId): bool {.importc: "SteamAPI_ISteamFriends_LeaveClanChatRoom".}
proc getClanChatMemberCount*(self: ISteamFriends, steamIdClan: SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetClanChatMemberCount".}
proc getChatMemberByIndex*(self: ISteamFriends, steamIdClan: SteamId, user: cint): SteamId {.importc: "SteamAPI_ISteamFriends_GetChatMemberByIndex".}
proc sendClanChatMessageRaw(self: ISteamFriends, steamIdClanChat: SteamId, text: cstring): bool {.importc: "SteamAPI_ISteamFriends_SendClanChatMessage".}
proc getClanChatMessage*(self: ISteamFriends, steamIdClanChat: SteamId, message: cint, prgchText: pointer, textMax: cint, peChatEntryType: ptr ChatEntryType, psteamidChatter: ptr SteamId): cint {.importc: "SteamAPI_ISteamFriends_GetClanChatMessage".}
proc isClanChatAdmin*(self: ISteamFriends, steamIdClanChat: SteamId, steamIdUser: SteamId): bool {.importc: "SteamAPI_ISteamFriends_IsClanChatAdmin".}
proc isClanChatWindowOpenInSteam*(self: ISteamFriends, steamIdClanChat: SteamId): bool {.importc: "SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam".}
proc openClanChatWindowInSteam*(self: ISteamFriends, steamIdClanChat: SteamId): bool {.importc: "SteamAPI_ISteamFriends_OpenClanChatWindowInSteam".}
proc closeClanChatWindowInSteam*(self: ISteamFriends, steamIdClanChat: SteamId): bool {.importc: "SteamAPI_ISteamFriends_CloseClanChatWindowInSteam".}
proc setListenForFriendsMessages*(self: ISteamFriends, interceptEnabled: bool): bool {.importc: "SteamAPI_ISteamFriends_SetListenForFriendsMessages".}
proc replyToFriendMessageRaw(self: ISteamFriends, steamIdFriend: SteamId, msgToSend: cstring): bool {.importc: "SteamAPI_ISteamFriends_ReplyToFriendMessage".}
proc getFriendMessage*(self: ISteamFriends, steamIdFriend: SteamId, messageId: cint, pvData: pointer, data: cint, peChatEntryType: ptr ChatEntryType): cint {.importc: "SteamAPI_ISteamFriends_GetFriendMessage".}
proc getFollowerCount*(self: ISteamFriends, steamId: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamFriends_GetFollowerCount".}
proc isFollowing*(self: ISteamFriends, steamId: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamFriends_IsFollowing".}
proc enumerateFollowingList*(self: ISteamFriends, startIndex: uint32): SteamAPICall {.importc: "SteamAPI_ISteamFriends_EnumerateFollowingList".}
proc isClanPublic*(self: ISteamFriends, steamIdClan: SteamId): bool {.importc: "SteamAPI_ISteamFriends_IsClanPublic".}
proc isClanOfficialGameGroup*(self: ISteamFriends, steamIdClan: SteamId): bool {.importc: "SteamAPI_ISteamFriends_IsClanOfficialGameGroup".}
proc getNumChatsWithUnreadPriorityMessages*(self: ISteamFriends): cint {.importc: "SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages".}
proc activateGameOverlayRemotePlayTogetherInviteDialog*(self: ISteamFriends, steamIdLobby: SteamId) {.importc: "SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog".}
proc registerProtocolInOverlayBrowserRaw(self: ISteamFriends, protocol: cstring): bool {.importc: "SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser".}
proc activateGameOverlayInviteDialogConnectStringRaw(self: ISteamFriends, connectString: cstring) {.importc: "SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString".}
proc requestEquippedProfileItems*(self: ISteamFriends, steamId: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamFriends_RequestEquippedProfileItems".}
proc hasEquippedProfileItem*(self: ISteamFriends, steamId: SteamId, itemType: CommunityProfileItemType): bool {.importc: "SteamAPI_ISteamFriends_BHasEquippedProfileItem".}
proc getProfileItemPropertyStringRaw(self: ISteamFriends, steamId: SteamId, itemType: CommunityProfileItemType, prop: CommunityProfileItemProperty): cstring {.importc: "SteamAPI_ISteamFriends_GetProfileItemPropertyString".}
proc getProfileItemPropertyUint*(self: ISteamFriends, steamId: SteamId, itemType: CommunityProfileItemType, prop: CommunityProfileItemProperty): uint32 {.importc: "SteamAPI_ISteamFriends_GetProfileItemPropertyUint".}

# ISteamUtils
proc getSecondsSinceAppActive*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetSecondsSinceAppActive".}
proc getSecondsSinceComputerActive*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetSecondsSinceComputerActive".}
proc getConnectedUniverse*(self: ISteamUtils): Universe {.importc: "SteamAPI_ISteamUtils_GetConnectedUniverse".}
proc getServerRealTime*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetServerRealTime".}
proc getIpCountryRaw(self: ISteamUtils): cstring {.importc: "SteamAPI_ISteamUtils_GetIPCountry".}
proc getImageSize*(self: ISteamUtils, image: cint, width: ptr uint32, height: ptr uint32): bool {.importc: "SteamAPI_ISteamUtils_GetImageSize".}
proc getImageRgba*(self: ISteamUtils, image: cint, pubDest: ptr uint8, destBufferSize: cint): bool {.importc: "SteamAPI_ISteamUtils_GetImageRGBA".}
proc getCurrentBatteryPower*(self: ISteamUtils): uint8 {.importc: "SteamAPI_ISteamUtils_GetCurrentBatteryPower".}
proc getAppId*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetAppID".}
proc setOverlayNotificationPosition*(self: ISteamUtils, notificationPosition: NotificationPosition) {.importc: "SteamAPI_ISteamUtils_SetOverlayNotificationPosition".}
proc isApiCallCompleted*(self: ISteamUtils, hSteamApiCall: SteamAPICall, failed: ptr bool): bool {.importc: "SteamAPI_ISteamUtils_IsAPICallCompleted".}
proc getApiCallFailureReason*(self: ISteamUtils, hSteamApiCall: SteamAPICall): APICallFailure {.importc: "SteamAPI_ISteamUtils_GetAPICallFailureReason".}
proc getApiCallResult*(self: ISteamUtils, hSteamApiCall: SteamAPICall, callback: pointer, callback2: cint, callbackExpected: cint, failed: ptr bool): bool {.importc: "SteamAPI_ISteamUtils_GetAPICallResult".}
proc getIpcCallCount*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetIPCCallCount".}
proc setWarningMessageHook*(self: ISteamUtils, function: SteamAPIWarningMessageHook) {.importc: "SteamAPI_ISteamUtils_SetWarningMessageHook".}
proc isOverlayEnabled*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsOverlayEnabled".}
proc overlayNeedsPresent*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_BOverlayNeedsPresent".}
proc checkFileSignatureRaw(self: ISteamUtils, fileName: cstring): SteamAPICall {.importc: "SteamAPI_ISteamUtils_CheckFileSignature".}
proc showGamepadTextInputRaw(self: ISteamUtils, inputMode: GamepadTextInputMode, lineInputMode: GamepadTextInputLineMode, description: cstring, charMax: uint32, existingText: cstring): bool {.importc: "SteamAPI_ISteamUtils_ShowGamepadTextInput".}
proc getEnteredGamepadTextLength*(self: ISteamUtils): uint32 {.importc: "SteamAPI_ISteamUtils_GetEnteredGamepadTextLength".}
proc getEnteredGamepadTextInputRaw(self: ISteamUtils, text: ptr char, text2: uint32): bool {.importc: "SteamAPI_ISteamUtils_GetEnteredGamepadTextInput".}
proc getSteamUiLanguageRaw(self: ISteamUtils): cstring {.importc: "SteamAPI_ISteamUtils_GetSteamUILanguage".}
proc isSteamRunningInVr*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsSteamRunningInVR".}
proc setOverlayNotificationInset*(self: ISteamUtils, horizontalInset: cint, verticalInset: cint) {.importc: "SteamAPI_ISteamUtils_SetOverlayNotificationInset".}
proc isSteamInBigPictureMode*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsSteamInBigPictureMode".}
proc startVrDashboard*(self: ISteamUtils) {.importc: "SteamAPI_ISteamUtils_StartVRDashboard".}
proc isVrHeadsetStreamingEnabled*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled".}
proc setVrHeadsetStreamingEnabled*(self: ISteamUtils, enabled: bool) {.importc: "SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled".}
proc isSteamChinaLauncher*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsSteamChinaLauncher".}
proc initFilterText*(self: ISteamUtils, filterOptions: uint32): bool {.importc: "SteamAPI_ISteamUtils_InitFilterText".}
proc filterTextRaw(self: ISteamUtils, context: TextFilteringContext, sourceSteamId: SteamId, inputMessage: cstring, outFilteredText: ptr char, byteSizeOutFilteredText: uint32): cint {.importc: "SteamAPI_ISteamUtils_FilterText".}
proc getIpv6ConnectivityState*(self: ISteamUtils, protocol: IPv6ConnectivityProtocol): IPv6ConnectivityState {.importc: "SteamAPI_ISteamUtils_GetIPv6ConnectivityState".}
proc isSteamRunningOnSteamDeck*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_IsSteamRunningOnSteamDeck".}
proc showFloatingGamepadTextInput*(self: ISteamUtils, keyboardMode: FloatingGamepadTextInputMode, textFieldXposition: cint, textFieldYposition: cint, textFieldWidth: cint, textFieldHeight: cint): bool {.importc: "SteamAPI_ISteamUtils_ShowFloatingGamepadTextInput".}
proc setGameLauncherMode*(self: ISteamUtils, launcherMode: bool) {.importc: "SteamAPI_ISteamUtils_SetGameLauncherMode".}
proc dismissFloatingGamepadTextInput*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_DismissFloatingGamepadTextInput".}
proc dismissGamepadTextInput*(self: ISteamUtils): bool {.importc: "SteamAPI_ISteamUtils_DismissGamepadTextInput".}

# ISteamMatchmaking
proc getFavoriteGameCount*(self: ISteamMatchmaking): cint {.importc: "SteamAPI_ISteamMatchmaking_GetFavoriteGameCount".}
proc getFavoriteGame*(self: ISteamMatchmaking, game: cint, appId: ptr AppId, ip: ptr uint32, connPort: ptr uint16, queryPort: ptr uint16, flags: ptr uint32, rtime32LastPlayedOnServer: ptr uint32): bool {.importc: "SteamAPI_ISteamMatchmaking_GetFavoriteGame".}
proc addFavoriteGame*(self: ISteamMatchmaking, appId: AppId, ip: uint32, connPort: uint16, queryPort: uint16, flags: uint32, rTime32LastPlayedOnServer: uint32): cint {.importc: "SteamAPI_ISteamMatchmaking_AddFavoriteGame".}
proc removeFavoriteGame*(self: ISteamMatchmaking, appId: AppId, ip: uint32, connPort: uint16, queryPort: uint16, flags: uint32): bool {.importc: "SteamAPI_ISteamMatchmaking_RemoveFavoriteGame".}
proc requestLobbyList*(self: ISteamMatchmaking): SteamAPICall {.importc: "SteamAPI_ISteamMatchmaking_RequestLobbyList".}
proc addRequestLobbyListStringFilterRaw(self: ISteamMatchmaking, keyToMatch: cstring, valueToMatch: cstring, comparisonType: LobbyComparison) {.importc: "SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter".}
proc addRequestLobbyListNumericalFilterRaw(self: ISteamMatchmaking, keyToMatch: cstring, valueToMatch: cint, comparisonType: LobbyComparison) {.importc: "SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter".}
proc addRequestLobbyListNearValueFilterRaw(self: ISteamMatchmaking, keyToMatch: cstring, valueToBeCloseTo: cint) {.importc: "SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter".}
proc addRequestLobbyListFilterSlotsAvailable*(self: ISteamMatchmaking, slotsAvailable: cint) {.importc: "SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable".}
proc addRequestLobbyListDistanceFilter*(self: ISteamMatchmaking, lobbyDistanceFilter: LobbyDistanceFilter) {.importc: "SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter".}
proc addRequestLobbyListResultCountFilter*(self: ISteamMatchmaking, maxResults: cint) {.importc: "SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter".}
proc addRequestLobbyListCompatibleMembersFilter*(self: ISteamMatchmaking, steamIdLobby: SteamId) {.importc: "SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter".}
proc getLobbyByIndex*(self: ISteamMatchmaking, lobby: cint): SteamId {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyByIndex".}
proc createLobby*(self: ISteamMatchmaking, lobbyType: LobbyType, maxMembers: cint): SteamAPICall {.importc: "SteamAPI_ISteamMatchmaking_CreateLobby".}
proc joinLobby*(self: ISteamMatchmaking, steamIdLobby: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamMatchmaking_JoinLobby".}
proc leaveLobby*(self: ISteamMatchmaking, steamIdLobby: SteamId) {.importc: "SteamAPI_ISteamMatchmaking_LeaveLobby".}
proc inviteUserToLobby*(self: ISteamMatchmaking, steamIdLobby: SteamId, steamIdInvitee: SteamId): bool {.importc: "SteamAPI_ISteamMatchmaking_InviteUserToLobby".}
proc getNumLobbyMembers*(self: ISteamMatchmaking, steamIdLobby: SteamId): cint {.importc: "SteamAPI_ISteamMatchmaking_GetNumLobbyMembers".}
proc getLobbyMemberByIndex*(self: ISteamMatchmaking, steamIdLobby: SteamId, member: cint): SteamId {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex".}
proc getLobbyDataRaw(self: ISteamMatchmaking, steamIdLobby: SteamId, key: cstring): cstring {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyData".}
proc setLobbyDataRaw(self: ISteamMatchmaking, steamIdLobby: SteamId, key: cstring, value: cstring): bool {.importc: "SteamAPI_ISteamMatchmaking_SetLobbyData".}
proc getLobbyDataCount*(self: ISteamMatchmaking, steamIdLobby: SteamId): cint {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyDataCount".}
proc getLobbyDataByIndexRaw(self: ISteamMatchmaking, steamIdLobby: SteamId, lobbyData: cint, key: ptr char, keyBufferSize: cint, value: ptr char, valueBufferSize: cint): bool {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex".}
proc deleteLobbyDataRaw(self: ISteamMatchmaking, steamIdLobby: SteamId, key: cstring): bool {.importc: "SteamAPI_ISteamMatchmaking_DeleteLobbyData".}
proc getLobbyMemberDataRaw(self: ISteamMatchmaking, steamIdLobby: SteamId, steamIdUser: SteamId, key: cstring): cstring {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyMemberData".}
proc setLobbyMemberDataRaw(self: ISteamMatchmaking, steamIdLobby: SteamId, key: cstring, value: cstring) {.importc: "SteamAPI_ISteamMatchmaking_SetLobbyMemberData".}
proc sendLobbyChatMsg*(self: ISteamMatchmaking, steamIdLobby: SteamId, pvMsgBody: pointer, msgBody: cint): bool {.importc: "SteamAPI_ISteamMatchmaking_SendLobbyChatMsg".}
proc getLobbyChatEntry*(self: ISteamMatchmaking, steamIdLobby: SteamId, chatId: cint, steamIdUser: ptr SteamId, pvData: pointer, data: cint, peChatEntryType: ptr ChatEntryType): cint {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyChatEntry".}
proc requestLobbyData*(self: ISteamMatchmaking, steamIdLobby: SteamId): bool {.importc: "SteamAPI_ISteamMatchmaking_RequestLobbyData".}
proc setLobbyGameServer*(self: ISteamMatchmaking, steamIdLobby: SteamId, gameServerIp: uint32, gameServerPort: uint16, steamIdGameServer: SteamId) {.importc: "SteamAPI_ISteamMatchmaking_SetLobbyGameServer".}
proc getLobbyGameServer*(self: ISteamMatchmaking, steamIdLobby: SteamId, gameServerIp: ptr uint32, gameServerPort: ptr uint16, psteamIdGameServer: ptr SteamId): bool {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyGameServer".}
proc setLobbyMemberLimit*(self: ISteamMatchmaking, steamIdLobby: SteamId, maxMembers: cint): bool {.importc: "SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit".}
proc getLobbyMemberLimit*(self: ISteamMatchmaking, steamIdLobby: SteamId): cint {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit".}
proc setLobbyType*(self: ISteamMatchmaking, steamIdLobby: SteamId, lobbyType: LobbyType): bool {.importc: "SteamAPI_ISteamMatchmaking_SetLobbyType".}
proc setLobbyJoinable*(self: ISteamMatchmaking, steamIdLobby: SteamId, lobbyJoinable: bool): bool {.importc: "SteamAPI_ISteamMatchmaking_SetLobbyJoinable".}
proc getLobbyOwner*(self: ISteamMatchmaking, steamIdLobby: SteamId): SteamId {.importc: "SteamAPI_ISteamMatchmaking_GetLobbyOwner".}
proc setLobbyOwner*(self: ISteamMatchmaking, steamIdLobby: SteamId, steamIdNewOwner: SteamId): bool {.importc: "SteamAPI_ISteamMatchmaking_SetLobbyOwner".}
proc setLinkedLobby*(self: ISteamMatchmaking, steamIdLobby: SteamId, steamIdLobbyDependent: SteamId): bool {.importc: "SteamAPI_ISteamMatchmaking_SetLinkedLobby".}

# ISteamMatchmakingServerListResponse
proc serverResponded*(self: ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, server: cint) {.importc: "SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded".}
proc serverFailedToRespond*(self: ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, server: cint) {.importc: "SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond".}
proc refreshComplete*(self: ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, response: MatchMakingServerResponse) {.importc: "SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete".}

# ISteamMatchmakingPingResponse
proc serverResponded*(self: ISteamMatchmakingPingResponse, server: ptr GameServerItem) {.importc: "SteamAPI_ISteamMatchmakingPingResponse_ServerResponded".}
proc serverFailedToRespond*(self: ISteamMatchmakingPingResponse) {.importc: "SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond".}

# ISteamMatchmakingPlayersResponse
proc addPlayerToListRaw(self: ISteamMatchmakingPlayersResponse, name: cstring, score: cint, timePlayed: float32) {.importc: "SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList".}
proc playersFailedToRespond*(self: ISteamMatchmakingPlayersResponse) {.importc: "SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond".}
proc playersRefreshComplete*(self: ISteamMatchmakingPlayersResponse) {.importc: "SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete".}

# ISteamMatchmakingRulesResponse
proc rulesRespondedRaw(self: ISteamMatchmakingRulesResponse, rule: cstring, value: cstring) {.importc: "SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded".}
proc rulesFailedToRespond*(self: ISteamMatchmakingRulesResponse) {.importc: "SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond".}
proc rulesRefreshComplete*(self: ISteamMatchmakingRulesResponse) {.importc: "SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete".}

# ISteamMatchmakingServers
proc requestInternetServerList*(self: ISteamMatchmakingServers, app: AppId, filters: ptr ptr MatchMakingKeyValuePair, filters2: uint32, requestServersResponse: ISteamMatchmakingServerListResponse): HServerListRequest {.importc: "SteamAPI_ISteamMatchmakingServers_RequestInternetServerList".}
proc requestLanServerList*(self: ISteamMatchmakingServers, app: AppId, requestServersResponse: ISteamMatchmakingServerListResponse): HServerListRequest {.importc: "SteamAPI_ISteamMatchmakingServers_RequestLANServerList".}
proc requestFriendsServerList*(self: ISteamMatchmakingServers, app: AppId, filters: ptr ptr MatchMakingKeyValuePair, filters2: uint32, requestServersResponse: ISteamMatchmakingServerListResponse): HServerListRequest {.importc: "SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList".}
proc requestFavoritesServerList*(self: ISteamMatchmakingServers, app: AppId, filters: ptr ptr MatchMakingKeyValuePair, filters2: uint32, requestServersResponse: ISteamMatchmakingServerListResponse): HServerListRequest {.importc: "SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList".}
proc requestHistoryServerList*(self: ISteamMatchmakingServers, app: AppId, filters: ptr ptr MatchMakingKeyValuePair, filters2: uint32, requestServersResponse: ISteamMatchmakingServerListResponse): HServerListRequest {.importc: "SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList".}
proc requestSpectatorServerList*(self: ISteamMatchmakingServers, app: AppId, filters: ptr ptr MatchMakingKeyValuePair, filters2: uint32, requestServersResponse: ISteamMatchmakingServerListResponse): HServerListRequest {.importc: "SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList".}
proc releaseRequest*(self: ISteamMatchmakingServers, hServerListRequest: HServerListRequest) {.importc: "SteamAPI_ISteamMatchmakingServers_ReleaseRequest".}
proc getServerDetails*(self: ISteamMatchmakingServers, hRequest: HServerListRequest, server: cint): ptr GameServerItem {.importc: "SteamAPI_ISteamMatchmakingServers_GetServerDetails".}
proc cancelQuery*(self: ISteamMatchmakingServers, hRequest: HServerListRequest) {.importc: "SteamAPI_ISteamMatchmakingServers_CancelQuery".}
proc refreshQuery*(self: ISteamMatchmakingServers, hRequest: HServerListRequest) {.importc: "SteamAPI_ISteamMatchmakingServers_RefreshQuery".}
proc isRefreshing*(self: ISteamMatchmakingServers, hRequest: HServerListRequest): bool {.importc: "SteamAPI_ISteamMatchmakingServers_IsRefreshing".}
proc getServerCount*(self: ISteamMatchmakingServers, hRequest: HServerListRequest): cint {.importc: "SteamAPI_ISteamMatchmakingServers_GetServerCount".}
proc refreshServer*(self: ISteamMatchmakingServers, hRequest: HServerListRequest, server: cint) {.importc: "SteamAPI_ISteamMatchmakingServers_RefreshServer".}
proc pingServer*(self: ISteamMatchmakingServers, ip: uint32, port: uint16, requestServersResponse: ISteamMatchmakingPingResponse): HServerQuery {.importc: "SteamAPI_ISteamMatchmakingServers_PingServer".}
proc playerDetails*(self: ISteamMatchmakingServers, ip: uint32, port: uint16, requestServersResponse: ISteamMatchmakingPlayersResponse): HServerQuery {.importc: "SteamAPI_ISteamMatchmakingServers_PlayerDetails".}
proc serverRules*(self: ISteamMatchmakingServers, ip: uint32, port: uint16, requestServersResponse: ISteamMatchmakingRulesResponse): HServerQuery {.importc: "SteamAPI_ISteamMatchmakingServers_ServerRules".}
proc cancelServerQuery*(self: ISteamMatchmakingServers, hServerQuery: HServerQuery) {.importc: "SteamAPI_ISteamMatchmakingServers_CancelServerQuery".}

# ISteamParties
proc getNumActiveBeacons*(self: ISteamParties): uint32 {.importc: "SteamAPI_ISteamParties_GetNumActiveBeacons".}
proc getBeaconByIndex*(self: ISteamParties, index: uint32): PartyBeaconID {.importc: "SteamAPI_ISteamParties_GetBeaconByIndex".}
proc getBeaconDetailsRaw(self: ISteamParties, beaconId: PartyBeaconID, steamIdBeaconOwner: ptr SteamId, location: ptr SteamPartyBeaconLocation, metadata: ptr char, metadata2: cint): bool {.importc: "SteamAPI_ISteamParties_GetBeaconDetails".}
proc joinParty*(self: ISteamParties, beaconId: PartyBeaconID): SteamAPICall {.importc: "SteamAPI_ISteamParties_JoinParty".}
proc getNumAvailableBeaconLocations*(self: ISteamParties, puNumLocations: ptr uint32): bool {.importc: "SteamAPI_ISteamParties_GetNumAvailableBeaconLocations".}
proc getAvailableBeaconLocations*(self: ISteamParties, locationList: ptr SteamPartyBeaconLocation, maxNumLocations: uint32): bool {.importc: "SteamAPI_ISteamParties_GetAvailableBeaconLocations".}
proc createBeaconRaw(self: ISteamParties, openSlots: uint32, beaconLocation: ptr SteamPartyBeaconLocation, connectString: cstring, metadata: cstring): SteamAPICall {.importc: "SteamAPI_ISteamParties_CreateBeacon".}
proc onReservationCompleted*(self: ISteamParties, beacon: PartyBeaconID, steamIdUser: SteamId) {.importc: "SteamAPI_ISteamParties_OnReservationCompleted".}
proc cancelReservation*(self: ISteamParties, beacon: PartyBeaconID, steamIdUser: SteamId) {.importc: "SteamAPI_ISteamParties_CancelReservation".}
proc changeNumOpenSlots*(self: ISteamParties, beacon: PartyBeaconID, openSlots: uint32): SteamAPICall {.importc: "SteamAPI_ISteamParties_ChangeNumOpenSlots".}
proc destroyBeacon*(self: ISteamParties, beacon: PartyBeaconID): bool {.importc: "SteamAPI_ISteamParties_DestroyBeacon".}
proc getBeaconLocationDataRaw(self: ISteamParties, beaconLocation: SteamPartyBeaconLocation, data: PartyBeaconLocationData, dataStringOut: ptr char, dataStringOut2: cint): bool {.importc: "SteamAPI_ISteamParties_GetBeaconLocationData".}

# ISteamRemoteStorage
proc fileWriteRaw(self: ISteamRemoteStorage, file: cstring, pvData: pointer, data: int32): bool {.importc: "SteamAPI_ISteamRemoteStorage_FileWrite".}
proc fileReadRaw(self: ISteamRemoteStorage, file: cstring, pvData: pointer, dataToRead: int32): int32 {.importc: "SteamAPI_ISteamRemoteStorage_FileRead".}
proc fileWriteAsyncRaw(self: ISteamRemoteStorage, file: cstring, pvData: pointer, data: uint32): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_FileWriteAsync".}
proc fileReadAsyncRaw(self: ISteamRemoteStorage, file: cstring, offset: uint32, toRead: uint32): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_FileReadAsync".}
proc fileReadAsyncComplete*(self: ISteamRemoteStorage, hReadCall: SteamAPICall, pvBuffer: pointer, toRead: uint32): bool {.importc: "SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete".}
proc fileForgetRaw(self: ISteamRemoteStorage, file: cstring): bool {.importc: "SteamAPI_ISteamRemoteStorage_FileForget".}
proc fileDeleteRaw(self: ISteamRemoteStorage, file: cstring): bool {.importc: "SteamAPI_ISteamRemoteStorage_FileDelete".}
proc fileShareRaw(self: ISteamRemoteStorage, file: cstring): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_FileShare".}
proc setSyncPlatformsRaw(self: ISteamRemoteStorage, file: cstring, remoteStoragePlatform: RemoteStoragePlatform): bool {.importc: "SteamAPI_ISteamRemoteStorage_SetSyncPlatforms".}
proc fileWriteStreamOpenRaw(self: ISteamRemoteStorage, file: cstring): UGCFileWriteStreamHandle {.importc: "SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen".}
proc fileWriteStreamWriteChunk*(self: ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle, pvData: pointer, data: int32): bool {.importc: "SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk".}
proc fileWriteStreamClose*(self: ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle): bool {.importc: "SteamAPI_ISteamRemoteStorage_FileWriteStreamClose".}
proc fileWriteStreamCancel*(self: ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle): bool {.importc: "SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel".}
proc fileExistsRaw(self: ISteamRemoteStorage, file: cstring): bool {.importc: "SteamAPI_ISteamRemoteStorage_FileExists".}
proc filePersistedRaw(self: ISteamRemoteStorage, file: cstring): bool {.importc: "SteamAPI_ISteamRemoteStorage_FilePersisted".}
proc getFileSizeRaw(self: ISteamRemoteStorage, file: cstring): int32 {.importc: "SteamAPI_ISteamRemoteStorage_GetFileSize".}
proc getFileTimestampRaw(self: ISteamRemoteStorage, file: cstring): int64 {.importc: "SteamAPI_ISteamRemoteStorage_GetFileTimestamp".}
proc getSyncPlatformsRaw(self: ISteamRemoteStorage, file: cstring): RemoteStoragePlatform {.importc: "SteamAPI_ISteamRemoteStorage_GetSyncPlatforms".}
proc getFileCount*(self: ISteamRemoteStorage): int32 {.importc: "SteamAPI_ISteamRemoteStorage_GetFileCount".}
proc getFileNameAndSizeRaw(self: ISteamRemoteStorage, file: cint, fileSizeInBytes: ptr int32): cstring {.importc: "SteamAPI_ISteamRemoteStorage_GetFileNameAndSize".}
proc getQuota*(self: ISteamRemoteStorage, totalBytes: ptr uint64, puAvailableBytes: ptr uint64): bool {.importc: "SteamAPI_ISteamRemoteStorage_GetQuota".}
proc isCloudEnabledForAccount*(self: ISteamRemoteStorage): bool {.importc: "SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount".}
proc isCloudEnabledForApp*(self: ISteamRemoteStorage): bool {.importc: "SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp".}
proc setCloudEnabledForApp*(self: ISteamRemoteStorage, enabled: bool) {.importc: "SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp".}
proc ugcDownload*(self: ISteamRemoteStorage, hContent: UGCHandle, priority: uint32): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_UGCDownload".}
proc getUgcDownloadProgress*(self: ISteamRemoteStorage, hContent: UGCHandle, bytesDownloaded: ptr int32, bytesExpected: ptr int32): bool {.importc: "SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress".}
proc getUgcDetailsRaw(self: ISteamRemoteStorage, hContent: UGCHandle, appId: ptr AppId, name: ptr ptr char, fileSizeInBytes: ptr int32, steamIdOwner: ptr SteamId): bool {.importc: "SteamAPI_ISteamRemoteStorage_GetUGCDetails".}
proc ugcRead*(self: ISteamRemoteStorage, hContent: UGCHandle, pvData: pointer, dataToRead: int32, offset: uint32, action: UGCReadAction): int32 {.importc: "SteamAPI_ISteamRemoteStorage_UGCRead".}
proc getCachedUgcCount*(self: ISteamRemoteStorage): int32 {.importc: "SteamAPI_ISteamRemoteStorage_GetCachedUGCCount".}
proc getCachedUgcHandle*(self: ISteamRemoteStorage, cachedContent: int32): UGCHandle {.importc: "SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle".}
proc publishWorkshopFileRaw(self: ISteamRemoteStorage, file: cstring, previewFile: cstring, consumerAppId: AppId, title: cstring, description: cstring, visibility: RemoteStoragePublishedFileVisibility, tags: ptr SteamParamStringArray, workshopFileType: WorkshopFileType): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_PublishWorkshopFile".}
proc createPublishedFileUpdateRequest*(self: ISteamRemoteStorage, publishedFileId: PublishedFileId): PublishedFileUpdateHandle {.importc: "SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest".}
proc updatePublishedFileFileRaw(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, file: cstring): bool {.importc: "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile".}
proc updatePublishedFilePreviewFileRaw(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, previewFile: cstring): bool {.importc: "SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile".}
proc updatePublishedFileTitleRaw(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, title: cstring): bool {.importc: "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle".}
proc updatePublishedFileDescriptionRaw(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, description: cstring): bool {.importc: "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription".}
proc updatePublishedFileVisibility*(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, visibility: RemoteStoragePublishedFileVisibility): bool {.importc: "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility".}
proc updatePublishedFileTagsRaw(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, tags: ptr SteamParamStringArray): bool {.importc: "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags".}
proc commitPublishedFileUpdate*(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate".}
proc getPublishedFileDetails*(self: ISteamRemoteStorage, publishedFileId: PublishedFileId, maxSecondsOld: uint32): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails".}
proc deletePublishedFile*(self: ISteamRemoteStorage, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_DeletePublishedFile".}
proc enumerateUserPublishedFiles*(self: ISteamRemoteStorage, startIndex: uint32): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles".}
proc subscribePublishedFile*(self: ISteamRemoteStorage, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_SubscribePublishedFile".}
proc enumerateUserSubscribedFiles*(self: ISteamRemoteStorage, startIndex: uint32): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles".}
proc unsubscribePublishedFile*(self: ISteamRemoteStorage, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile".}
proc updatePublishedFileSetChangeDescriptionRaw(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, changeDescription: cstring): bool {.importc: "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription".}
proc getPublishedItemVoteDetails*(self: ISteamRemoteStorage, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails".}
proc updateUserPublishedItemVote*(self: ISteamRemoteStorage, publishedFileId: PublishedFileId, voteUp: bool): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote".}
proc getUserPublishedItemVoteDetails*(self: ISteamRemoteStorage, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails".}
proc enumerateUserSharedWorkshopFilesRaw(self: ISteamRemoteStorage, steamId: SteamId, startIndex: uint32, requiredTags: ptr SteamParamStringArray, excludedTags: ptr SteamParamStringArray): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles".}
proc publishVideoRaw(self: ISteamRemoteStorage, videoProvider: WorkshopVideoProvider, videoAccount: cstring, videoIdentifier: cstring, previewFile: cstring, consumerAppId: AppId, title: cstring, description: cstring, visibility: RemoteStoragePublishedFileVisibility, tags: ptr SteamParamStringArray): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_PublishVideo".}
proc setUserPublishedFileAction*(self: ISteamRemoteStorage, publishedFileId: PublishedFileId, action: WorkshopFileAction): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction".}
proc enumeratePublishedFilesByUserAction*(self: ISteamRemoteStorage, action: WorkshopFileAction, startIndex: uint32): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction".}
proc enumeratePublishedWorkshopFilesRaw(self: ISteamRemoteStorage, enumerationType: WorkshopEnumerationType, startIndex: uint32, count: uint32, days: uint32, tags: ptr SteamParamStringArray, userTags: ptr SteamParamStringArray): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles".}
proc ugcDownloadToLocationRaw(self: ISteamRemoteStorage, hContent: UGCHandle, location: cstring, priority: uint32): SteamAPICall {.importc: "SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation".}
proc getLocalFileChangeCount*(self: ISteamRemoteStorage): int32 {.importc: "SteamAPI_ISteamRemoteStorage_GetLocalFileChangeCount".}
proc getLocalFileChangeRaw(self: ISteamRemoteStorage, file: cint, echangeType: ptr RemoteStorageLocalFileChange, efilePathType: ptr RemoteStorageFilePathType): cstring {.importc: "SteamAPI_ISteamRemoteStorage_GetLocalFileChange".}
proc beginFileWriteBatch*(self: ISteamRemoteStorage): bool {.importc: "SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch".}
proc endFileWriteBatch*(self: ISteamRemoteStorage): bool {.importc: "SteamAPI_ISteamRemoteStorage_EndFileWriteBatch".}

# ISteamUserStats
proc getStatRaw(self: ISteamUserStats, name: cstring, data: ptr int32): bool {.importc: "SteamAPI_ISteamUserStats_GetStatInt32".}
proc getStatRaw(self: ISteamUserStats, name: cstring, data: ptr float32): bool {.importc: "SteamAPI_ISteamUserStats_GetStatFloat".}
proc setStatRaw(self: ISteamUserStats, name: cstring, data: int32): bool {.importc: "SteamAPI_ISteamUserStats_SetStatInt32".}
proc setStatRaw(self: ISteamUserStats, name: cstring, fData: float32): bool {.importc: "SteamAPI_ISteamUserStats_SetStatFloat".}
proc updateAvgRateStatRaw(self: ISteamUserStats, name: cstring, countThisSession: float32, dSessionLength: float64): bool {.importc: "SteamAPI_ISteamUserStats_UpdateAvgRateStat".}
proc getAchievementRaw(self: ISteamUserStats, name: cstring, achieved: ptr bool): bool {.importc: "SteamAPI_ISteamUserStats_GetAchievement".}
proc setAchievementRaw(self: ISteamUserStats, name: cstring): bool {.importc: "SteamAPI_ISteamUserStats_SetAchievement".}
proc clearAchievementRaw(self: ISteamUserStats, name: cstring): bool {.importc: "SteamAPI_ISteamUserStats_ClearAchievement".}
proc getAchievementAndUnlockTimeRaw(self: ISteamUserStats, name: cstring, achieved: ptr bool, unlockTime: ptr uint32): bool {.importc: "SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime".}
proc storeStats*(self: ISteamUserStats): bool {.importc: "SteamAPI_ISteamUserStats_StoreStats".}
proc getAchievementIconRaw(self: ISteamUserStats, name: cstring): cint {.importc: "SteamAPI_ISteamUserStats_GetAchievementIcon".}
proc getAchievementDisplayAttributeRaw(self: ISteamUserStats, name: cstring, key: cstring): cstring {.importc: "SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute".}
proc indicateAchievementProgressRaw(self: ISteamUserStats, name: cstring, curProgress: uint32, maxProgress: uint32): bool {.importc: "SteamAPI_ISteamUserStats_IndicateAchievementProgress".}
proc getNumAchievements*(self: ISteamUserStats): uint32 {.importc: "SteamAPI_ISteamUserStats_GetNumAchievements".}
proc getAchievementNameRaw(self: ISteamUserStats, achievement: uint32): cstring {.importc: "SteamAPI_ISteamUserStats_GetAchievementName".}
proc requestUserStats*(self: ISteamUserStats, steamIdUser: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_RequestUserStats".}
proc getUserStatRaw(self: ISteamUserStats, steamIdUser: SteamId, name: cstring, data: ptr int32): bool {.importc: "SteamAPI_ISteamUserStats_GetUserStatInt32".}
proc getUserStatRaw(self: ISteamUserStats, steamIdUser: SteamId, name: cstring, data: ptr float32): bool {.importc: "SteamAPI_ISteamUserStats_GetUserStatFloat".}
proc getUserAchievementRaw(self: ISteamUserStats, steamIdUser: SteamId, name: cstring, achieved: ptr bool): bool {.importc: "SteamAPI_ISteamUserStats_GetUserAchievement".}
proc getUserAchievementAndUnlockTimeRaw(self: ISteamUserStats, steamIdUser: SteamId, name: cstring, achieved: ptr bool, unlockTime: ptr uint32): bool {.importc: "SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime".}
proc resetAllStats*(self: ISteamUserStats, achievementsToo: bool): bool {.importc: "SteamAPI_ISteamUserStats_ResetAllStats".}
proc findOrCreateLeaderboardRaw(self: ISteamUserStats, leaderboardName: cstring, leaderboardSortMethod: LeaderboardSortMethod, leaderboardDisplayType: LeaderboardDisplayType): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_FindOrCreateLeaderboard".}
proc findLeaderboardRaw(self: ISteamUserStats, leaderboardName: cstring): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_FindLeaderboard".}
proc getLeaderboardNameRaw(self: ISteamUserStats, hSteamLeaderboard: SteamLeaderboard): cstring {.importc: "SteamAPI_ISteamUserStats_GetLeaderboardName".}
proc getLeaderboardEntryCount*(self: ISteamUserStats, hSteamLeaderboard: SteamLeaderboard): cint {.importc: "SteamAPI_ISteamUserStats_GetLeaderboardEntryCount".}
proc getLeaderboardSortMethod*(self: ISteamUserStats, hSteamLeaderboard: SteamLeaderboard): LeaderboardSortMethod {.importc: "SteamAPI_ISteamUserStats_GetLeaderboardSortMethod".}
proc getLeaderboardDisplayType*(self: ISteamUserStats, hSteamLeaderboard: SteamLeaderboard): LeaderboardDisplayType {.importc: "SteamAPI_ISteamUserStats_GetLeaderboardDisplayType".}
proc downloadLeaderboardEntries*(self: ISteamUserStats, hSteamLeaderboard: SteamLeaderboard, leaderboardDataRequest: LeaderboardDataRequest, rangeStart: cint, rangeEnd: cint): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_DownloadLeaderboardEntries".}
proc downloadLeaderboardEntriesForUsers*(self: ISteamUserStats, hSteamLeaderboard: SteamLeaderboard, prgUsers: ptr SteamId, users: cint): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers".}
proc getDownloadedLeaderboardEntry*(self: ISteamUserStats, hSteamLeaderboardEntries: SteamLeaderboardEntries, index: cint, leaderboardEntry: ptr LeaderboardEntry, details: ptr int32, detailsMax: cint): bool {.importc: "SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry".}
proc uploadLeaderboardScore*(self: ISteamUserStats, hSteamLeaderboard: SteamLeaderboard, leaderboardUploadScoreMethod: LeaderboardUploadScoreMethod, score: int32, scoreDetails: ptr int32, scoreDetailsCount: cint): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_UploadLeaderboardScore".}
proc attachLeaderboardUgc*(self: ISteamUserStats, hSteamLeaderboard: SteamLeaderboard, hUgc: UGCHandle): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_AttachLeaderboardUGC".}
proc getNumberOfCurrentPlayers*(self: ISteamUserStats): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers".}
proc requestGlobalAchievementPercentages*(self: ISteamUserStats): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages".}
proc getMostAchievedAchievementInfoRaw(self: ISteamUserStats, name: ptr char, nameBufLen: uint32, percent: ptr float32, achieved: ptr bool): cint {.importc: "SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo".}
proc getNextMostAchievedAchievementInfoRaw(self: ISteamUserStats, iteratorPrevious: cint, name: ptr char, nameBufLen: uint32, percent: ptr float32, achieved: ptr bool): cint {.importc: "SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo".}
proc getAchievementAchievedPercentRaw(self: ISteamUserStats, name: cstring, percent: ptr float32): bool {.importc: "SteamAPI_ISteamUserStats_GetAchievementAchievedPercent".}
proc requestGlobalStats*(self: ISteamUserStats, historyDays: cint): SteamAPICall {.importc: "SteamAPI_ISteamUserStats_RequestGlobalStats".}
proc getGlobalStatRaw(self: ISteamUserStats, statName: cstring, data: ptr int64): bool {.importc: "SteamAPI_ISteamUserStats_GetGlobalStatInt64".}
proc getGlobalStatRaw(self: ISteamUserStats, statName: cstring, data: ptr float64): bool {.importc: "SteamAPI_ISteamUserStats_GetGlobalStatDouble".}
proc getGlobalStatHistoryRaw(self: ISteamUserStats, statName: cstring, data: ptr int64, data2: uint32): int32 {.importc: "SteamAPI_ISteamUserStats_GetGlobalStatHistoryInt64".}
proc getGlobalStatHistoryRaw(self: ISteamUserStats, statName: cstring, data: ptr float64, data2: uint32): int32 {.importc: "SteamAPI_ISteamUserStats_GetGlobalStatHistoryDouble".}
proc getAchievementProgressLimitsRaw(self: ISteamUserStats, name: cstring, minProgress: ptr int32, maxProgress: ptr int32): bool {.importc: "SteamAPI_ISteamUserStats_GetAchievementProgressLimitsInt32".}
proc getAchievementProgressLimitsRaw(self: ISteamUserStats, name: cstring, pfMinProgress: ptr float32, pfMaxProgress: ptr float32): bool {.importc: "SteamAPI_ISteamUserStats_GetAchievementProgressLimitsFloat".}

# ISteamApps
proc isSubscribed*(self: ISteamApps): bool {.importc: "SteamAPI_ISteamApps_BIsSubscribed".}
proc isLowViolence*(self: ISteamApps): bool {.importc: "SteamAPI_ISteamApps_BIsLowViolence".}
proc isCybercafe*(self: ISteamApps): bool {.importc: "SteamAPI_ISteamApps_BIsCybercafe".}
proc isVacBanned*(self: ISteamApps): bool {.importc: "SteamAPI_ISteamApps_BIsVACBanned".}
proc getCurrentGameLanguageRaw(self: ISteamApps): cstring {.importc: "SteamAPI_ISteamApps_GetCurrentGameLanguage".}
proc getAvailableGameLanguagesRaw(self: ISteamApps): cstring {.importc: "SteamAPI_ISteamApps_GetAvailableGameLanguages".}
proc isSubscribedApp*(self: ISteamApps, appId: AppId): bool {.importc: "SteamAPI_ISteamApps_BIsSubscribedApp".}
proc isDlcInstalled*(self: ISteamApps, appId: AppId): bool {.importc: "SteamAPI_ISteamApps_BIsDlcInstalled".}
proc getEarliestPurchaseUnixTime*(self: ISteamApps, appId: AppId): uint32 {.importc: "SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime".}
proc isSubscribedFromFreeWeekend*(self: ISteamApps): bool {.importc: "SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend".}
proc getDlcCount*(self: ISteamApps): cint {.importc: "SteamAPI_ISteamApps_GetDLCCount".}
proc getDlcDataByIndexRaw(self: ISteamApps, dlc: cint, appId: ptr AppId, available: ptr bool, name: ptr char, nameBufferSize: cint): bool {.importc: "SteamAPI_ISteamApps_BGetDLCDataByIndex".}
proc installDlc*(self: ISteamApps, appId: AppId) {.importc: "SteamAPI_ISteamApps_InstallDLC".}
proc uninstallDlc*(self: ISteamApps, appId: AppId) {.importc: "SteamAPI_ISteamApps_UninstallDLC".}
proc requestAppProofOfPurchaseKey*(self: ISteamApps, appId: AppId) {.importc: "SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey".}
proc getCurrentBetaNameRaw(self: ISteamApps, name: ptr char, nameBufferSize: cint): bool {.importc: "SteamAPI_ISteamApps_GetCurrentBetaName".}
proc markContentCorrupt*(self: ISteamApps, missingFilesOnly: bool): bool {.importc: "SteamAPI_ISteamApps_MarkContentCorrupt".}
proc getInstalledDepots*(self: ISteamApps, appId: AppId, depots: ptr DepotId, maxDepots: uint32): uint32 {.importc: "SteamAPI_ISteamApps_GetInstalledDepots".}
proc getAppInstallDirRaw(self: ISteamApps, appId: AppId, folder: ptr char, folderBufferSize: uint32): uint32 {.importc: "SteamAPI_ISteamApps_GetAppInstallDir".}
proc isAppInstalled*(self: ISteamApps, appId: AppId): bool {.importc: "SteamAPI_ISteamApps_BIsAppInstalled".}
proc getAppOwner*(self: ISteamApps): SteamId {.importc: "SteamAPI_ISteamApps_GetAppOwner".}
proc getLaunchQueryParamRaw(self: ISteamApps, key: cstring): cstring {.importc: "SteamAPI_ISteamApps_GetLaunchQueryParam".}
proc getDlcDownloadProgress*(self: ISteamApps, appId: AppId, bytesDownloaded: ptr uint64, bytesTotal: ptr uint64): bool {.importc: "SteamAPI_ISteamApps_GetDlcDownloadProgress".}
proc getAppBuildId*(self: ISteamApps): cint {.importc: "SteamAPI_ISteamApps_GetAppBuildId".}
proc requestAllProofOfPurchaseKeys*(self: ISteamApps) {.importc: "SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys".}
proc getFileDetailsRaw(self: ISteamApps, fileName: cstring): SteamAPICall {.importc: "SteamAPI_ISteamApps_GetFileDetails".}
proc getLaunchCommandLineRaw(self: ISteamApps, commandLine: ptr char, commandLine2: cint): cint {.importc: "SteamAPI_ISteamApps_GetLaunchCommandLine".}
proc isSubscribedFromFamilySharing*(self: ISteamApps): bool {.importc: "SteamAPI_ISteamApps_BIsSubscribedFromFamilySharing".}
proc isTimedTrial*(self: ISteamApps, secondsAllowed: ptr uint32, secondsPlayed: ptr uint32): bool {.importc: "SteamAPI_ISteamApps_BIsTimedTrial".}
proc setDlcContext*(self: ISteamApps, appId: AppId): bool {.importc: "SteamAPI_ISteamApps_SetDlcContext".}
proc getNumBetas*(self: ISteamApps, available: ptr cint, private: ptr cint): cint {.importc: "SteamAPI_ISteamApps_GetNumBetas".}
proc getBetaInfoRaw(self: ISteamApps, betaIndex: cint, flags: ptr uint32, buildId: ptr uint32, betaName: ptr char, betaName2: cint, description: ptr char, description2: cint, lastUpdated: ptr uint32): bool {.importc: "SteamAPI_ISteamApps_GetBetaInfo".}
proc setActiveBetaRaw(self: ISteamApps, betaName: cstring): bool {.importc: "SteamAPI_ISteamApps_SetActiveBeta".}

# ISteamNetworking
proc sendP2Ppacket*(self: ISteamNetworking, steamIdRemote: SteamId, pubData: pointer, data: uint32, p2PsendType: P2PSend, channel: cint): bool {.importc: "SteamAPI_ISteamNetworking_SendP2PPacket".}
proc isP2PpacketAvailable*(self: ISteamNetworking, pcubMsgSize: ptr uint32, channel: cint): bool {.importc: "SteamAPI_ISteamNetworking_IsP2PPacketAvailable".}
proc readP2Ppacket*(self: ISteamNetworking, pubDest: pointer, dest: uint32, pcubMsgSize: ptr uint32, psteamIdRemote: ptr SteamId, channel: cint): bool {.importc: "SteamAPI_ISteamNetworking_ReadP2PPacket".}
proc acceptP2PsessionWithUser*(self: ISteamNetworking, steamIdRemote: SteamId): bool {.importc: "SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser".}
proc closeP2PsessionWithUser*(self: ISteamNetworking, steamIdRemote: SteamId): bool {.importc: "SteamAPI_ISteamNetworking_CloseP2PSessionWithUser".}
proc closeP2PchannelWithUser*(self: ISteamNetworking, steamIdRemote: SteamId, channel: cint): bool {.importc: "SteamAPI_ISteamNetworking_CloseP2PChannelWithUser".}
proc getP2PsessionState*(self: ISteamNetworking, steamIdRemote: SteamId, connectionState: ptr P2PSessionState): bool {.importc: "SteamAPI_ISteamNetworking_GetP2PSessionState".}
proc allowP2PpacketRelay*(self: ISteamNetworking, allow: bool): bool {.importc: "SteamAPI_ISteamNetworking_AllowP2PPacketRelay".}
proc createListenSocket*(self: ISteamNetworking, virtualP2Pport: cint, ip: SteamIPAddress, port: uint16, allowUseOfPacketRelay: bool): SNetListenSocket {.importc: "SteamAPI_ISteamNetworking_CreateListenSocket".}
proc createP2PconnectionSocket*(self: ISteamNetworking, steamIdTarget: SteamId, virtualPort: cint, timeoutSec: cint, allowUseOfPacketRelay: bool): SNetSocket {.importc: "SteamAPI_ISteamNetworking_CreateP2PConnectionSocket".}
proc createConnectionSocket*(self: ISteamNetworking, ip: SteamIPAddress, port: uint16, timeoutSec: cint): SNetSocket {.importc: "SteamAPI_ISteamNetworking_CreateConnectionSocket".}
proc destroySocket*(self: ISteamNetworking, hSocket: SNetSocket, notifyRemoteEnd: bool): bool {.importc: "SteamAPI_ISteamNetworking_DestroySocket".}
proc destroyListenSocket*(self: ISteamNetworking, hSocket: SNetListenSocket, notifyRemoteEnd: bool): bool {.importc: "SteamAPI_ISteamNetworking_DestroyListenSocket".}
proc sendDataOnSocket*(self: ISteamNetworking, hSocket: SNetSocket, pubData: pointer, data: uint32, reliable: bool): bool {.importc: "SteamAPI_ISteamNetworking_SendDataOnSocket".}
proc isDataAvailableOnSocket*(self: ISteamNetworking, hSocket: SNetSocket, pcubMsgSize: ptr uint32): bool {.importc: "SteamAPI_ISteamNetworking_IsDataAvailableOnSocket".}
proc retrieveDataFromSocket*(self: ISteamNetworking, hSocket: SNetSocket, pubDest: pointer, dest: uint32, pcubMsgSize: ptr uint32): bool {.importc: "SteamAPI_ISteamNetworking_RetrieveDataFromSocket".}
proc isDataAvailable*(self: ISteamNetworking, hListenSocket: SNetListenSocket, pcubMsgSize: ptr uint32, phSocket: ptr SNetSocket): bool {.importc: "SteamAPI_ISteamNetworking_IsDataAvailable".}
proc retrieveData*(self: ISteamNetworking, hListenSocket: SNetListenSocket, pubDest: pointer, dest: uint32, pcubMsgSize: ptr uint32, phSocket: ptr SNetSocket): bool {.importc: "SteamAPI_ISteamNetworking_RetrieveData".}
proc getSocketInfo*(self: ISteamNetworking, hSocket: SNetSocket, steamIdRemote: ptr SteamId, peSocketStatus: ptr cint, ipRemote: ptr SteamIPAddress, portRemote: ptr uint16): bool {.importc: "SteamAPI_ISteamNetworking_GetSocketInfo".}
proc getListenSocketInfo*(self: ISteamNetworking, hListenSocket: SNetListenSocket, ip: ptr SteamIPAddress, port: ptr uint16): bool {.importc: "SteamAPI_ISteamNetworking_GetListenSocketInfo".}
proc getSocketConnectionType*(self: ISteamNetworking, hSocket: SNetSocket): SNetSocketConnectionType {.importc: "SteamAPI_ISteamNetworking_GetSocketConnectionType".}
proc getMaxPacketSize*(self: ISteamNetworking, hSocket: SNetSocket): cint {.importc: "SteamAPI_ISteamNetworking_GetMaxPacketSize".}

# ISteamScreenshots
proc writeScreenshot*(self: ISteamScreenshots, pubRgb: pointer, rgb: uint32, width: cint, height: cint): ScreenshotHandle {.importc: "SteamAPI_ISteamScreenshots_WriteScreenshot".}
proc addScreenshotToLibraryRaw(self: ISteamScreenshots, filename: cstring, thumbnailFilename: cstring, width: cint, height: cint): ScreenshotHandle {.importc: "SteamAPI_ISteamScreenshots_AddScreenshotToLibrary".}
proc triggerScreenshot*(self: ISteamScreenshots) {.importc: "SteamAPI_ISteamScreenshots_TriggerScreenshot".}
proc hookScreenshots*(self: ISteamScreenshots, hook: bool) {.importc: "SteamAPI_ISteamScreenshots_HookScreenshots".}
proc setLocationRaw(self: ISteamScreenshots, hScreenshot: ScreenshotHandle, location: cstring): bool {.importc: "SteamAPI_ISteamScreenshots_SetLocation".}
proc tagUser*(self: ISteamScreenshots, hScreenshot: ScreenshotHandle, steamId: SteamId): bool {.importc: "SteamAPI_ISteamScreenshots_TagUser".}
proc tagPublishedFile*(self: ISteamScreenshots, hScreenshot: ScreenshotHandle, publishedFileId: PublishedFileId): bool {.importc: "SteamAPI_ISteamScreenshots_TagPublishedFile".}
proc isScreenshotsHooked*(self: ISteamScreenshots): bool {.importc: "SteamAPI_ISteamScreenshots_IsScreenshotsHooked".}
proc addVrScreenshotToLibraryRaw(self: ISteamScreenshots, typeValue: VRScreenshotType, filename: cstring, vrFilename: cstring): ScreenshotHandle {.importc: "SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary".}

# ISteamMusic
proc isEnabled*(self: ISteamMusic): bool {.importc: "SteamAPI_ISteamMusic_BIsEnabled".}
proc isPlaying*(self: ISteamMusic): bool {.importc: "SteamAPI_ISteamMusic_BIsPlaying".}
proc getPlaybackStatus*(self: ISteamMusic): AudioPlayback_Status {.importc: "SteamAPI_ISteamMusic_GetPlaybackStatus".}
proc play*(self: ISteamMusic) {.importc: "SteamAPI_ISteamMusic_Play".}
proc pause*(self: ISteamMusic) {.importc: "SteamAPI_ISteamMusic_Pause".}
proc playPrevious*(self: ISteamMusic) {.importc: "SteamAPI_ISteamMusic_PlayPrevious".}
proc playNext*(self: ISteamMusic) {.importc: "SteamAPI_ISteamMusic_PlayNext".}
proc setVolume*(self: ISteamMusic, volume: float32) {.importc: "SteamAPI_ISteamMusic_SetVolume".}
proc getVolume*(self: ISteamMusic): float32 {.importc: "SteamAPI_ISteamMusic_GetVolume".}

# ISteamHTTP
proc createHttpRequestRaw(self: ISteamHTTP, httpRequestMethod: HTTPMethod, absoluteUrl: cstring): HTTPRequestHandle {.importc: "SteamAPI_ISteamHTTP_CreateHTTPRequest".}
proc setHttpRequestContextValue*(self: ISteamHTTP, hRequest: HTTPRequestHandle, contextValue: uint64): bool {.importc: "SteamAPI_ISteamHTTP_SetHTTPRequestContextValue".}
proc setHttpRequestNetworkActivityTimeout*(self: ISteamHTTP, hRequest: HTTPRequestHandle, timeoutSeconds: uint32): bool {.importc: "SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout".}
proc setHttpRequestHeaderValueRaw(self: ISteamHTTP, hRequest: HTTPRequestHandle, headerName: cstring, headerValue: cstring): bool {.importc: "SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue".}
proc setHttpRequestGetOrPostParameterRaw(self: ISteamHTTP, hRequest: HTTPRequestHandle, paramName: cstring, paramValue: cstring): bool {.importc: "SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter".}
proc sendHttpRequest*(self: ISteamHTTP, hRequest: HTTPRequestHandle, callHandle: ptr SteamAPICall): bool {.importc: "SteamAPI_ISteamHTTP_SendHTTPRequest".}
proc sendHttpRequestAndStreamResponse*(self: ISteamHTTP, hRequest: HTTPRequestHandle, callHandle: ptr SteamAPICall): bool {.importc: "SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse".}
proc deferHttpRequest*(self: ISteamHTTP, hRequest: HTTPRequestHandle): bool {.importc: "SteamAPI_ISteamHTTP_DeferHTTPRequest".}
proc prioritizeHttpRequest*(self: ISteamHTTP, hRequest: HTTPRequestHandle): bool {.importc: "SteamAPI_ISteamHTTP_PrioritizeHTTPRequest".}
proc getHttpResponseHeaderSizeRaw(self: ISteamHTTP, hRequest: HTTPRequestHandle, headerName: cstring, responseHeaderSize: ptr uint32): bool {.importc: "SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize".}
proc getHttpResponseHeaderValueRaw(self: ISteamHTTP, hRequest: HTTPRequestHandle, headerName: cstring, headerValueBuffer: ptr uint8, bufferSize: uint32): bool {.importc: "SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue".}
proc getHttpResponseBodySize*(self: ISteamHTTP, hRequest: HTTPRequestHandle, bodySize: ptr uint32): bool {.importc: "SteamAPI_ISteamHTTP_GetHTTPResponseBodySize".}
proc getHttpResponseBodyData*(self: ISteamHTTP, hRequest: HTTPRequestHandle, bodyDataBuffer: ptr uint8, bufferSize: uint32): bool {.importc: "SteamAPI_ISteamHTTP_GetHTTPResponseBodyData".}
proc getHttpStreamingResponseBodyData*(self: ISteamHTTP, hRequest: HTTPRequestHandle, offset: uint32, bodyDataBuffer: ptr uint8, bufferSize: uint32): bool {.importc: "SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData".}
proc releaseHttpRequest*(self: ISteamHTTP, hRequest: HTTPRequestHandle): bool {.importc: "SteamAPI_ISteamHTTP_ReleaseHTTPRequest".}
proc getHttpDownloadProgressPct*(self: ISteamHTTP, hRequest: HTTPRequestHandle, percentOut: ptr float32): bool {.importc: "SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct".}
proc setHttpRequestRawPostBodyRaw(self: ISteamHTTP, hRequest: HTTPRequestHandle, contentType: cstring, pubBody: ptr uint8, bodyLen: uint32): bool {.importc: "SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody".}
proc createCookieContainer*(self: ISteamHTTP, allowResponsesToModify: bool): HTTPCookieContainerHandle {.importc: "SteamAPI_ISteamHTTP_CreateCookieContainer".}
proc releaseCookieContainer*(self: ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle): bool {.importc: "SteamAPI_ISteamHTTP_ReleaseCookieContainer".}
proc setCookieRaw(self: ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle, host: cstring, url: cstring, cookie: cstring): bool {.importc: "SteamAPI_ISteamHTTP_SetCookie".}
proc setHttpRequestCookieContainer*(self: ISteamHTTP, hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle): bool {.importc: "SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer".}
proc setHttpRequestUserAgentInfoRaw(self: ISteamHTTP, hRequest: HTTPRequestHandle, userAgentInfo: cstring): bool {.importc: "SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo".}
proc setHttpRequestRequiresVerifiedCertificate*(self: ISteamHTTP, hRequest: HTTPRequestHandle, requireVerifiedCertificate: bool): bool {.importc: "SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate".}
proc setHttpRequestAbsoluteTimeoutMs*(self: ISteamHTTP, hRequest: HTTPRequestHandle, milliseconds: uint32): bool {.importc: "SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS".}
proc getHttpRequestWasTimedOut*(self: ISteamHTTP, hRequest: HTTPRequestHandle, wasTimedOut: ptr bool): bool {.importc: "SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut".}

# ISteamInput
proc init*(self: ISteamInput, explicitlyCallRunFrame: bool): bool {.importc: "SteamAPI_ISteamInput_Init".}
proc shutdown*(self: ISteamInput): bool {.importc: "SteamAPI_ISteamInput_Shutdown".}
proc setInputActionManifestFilePathRaw(self: ISteamInput, inputActionManifestAbsolutePath: cstring): bool {.importc: "SteamAPI_ISteamInput_SetInputActionManifestFilePath".}
proc runFrame*(self: ISteamInput, reservedValue: bool) {.importc: "SteamAPI_ISteamInput_RunFrame".}
proc waitForData*(self: ISteamInput, waitForever: bool, timeout: uint32): bool {.importc: "SteamAPI_ISteamInput_BWaitForData".}
proc newDataAvailable*(self: ISteamInput): bool {.importc: "SteamAPI_ISteamInput_BNewDataAvailable".}
proc getConnectedControllers*(self: ISteamInput, handlesOut: ptr InputHandle): cint {.importc: "SteamAPI_ISteamInput_GetConnectedControllers".}
proc enableDeviceCallbacks*(self: ISteamInput) {.importc: "SteamAPI_ISteamInput_EnableDeviceCallbacks".}
proc enableActionEventCallbacks*(self: ISteamInput, callback: SteamInputActionEventCallbackPointer) {.importc: "SteamAPI_ISteamInput_EnableActionEventCallbacks".}
proc getActionSetHandleRaw(self: ISteamInput, actionSetName: cstring): InputActionSetHandle {.importc: "SteamAPI_ISteamInput_GetActionSetHandle".}
proc activateActionSet*(self: ISteamInput, inputHandle: InputHandle, actionSetHandle: InputActionSetHandle) {.importc: "SteamAPI_ISteamInput_ActivateActionSet".}
proc getCurrentActionSet*(self: ISteamInput, inputHandle: InputHandle): InputActionSetHandle {.importc: "SteamAPI_ISteamInput_GetCurrentActionSet".}
proc activateActionSetLayer*(self: ISteamInput, inputHandle: InputHandle, actionSetLayerHandle: InputActionSetHandle) {.importc: "SteamAPI_ISteamInput_ActivateActionSetLayer".}
proc deactivateActionSetLayer*(self: ISteamInput, inputHandle: InputHandle, actionSetLayerHandle: InputActionSetHandle) {.importc: "SteamAPI_ISteamInput_DeactivateActionSetLayer".}
proc deactivateAllActionSetLayers*(self: ISteamInput, inputHandle: InputHandle) {.importc: "SteamAPI_ISteamInput_DeactivateAllActionSetLayers".}
proc getActiveActionSetLayers*(self: ISteamInput, inputHandle: InputHandle, handlesOut: ptr InputActionSetHandle): cint {.importc: "SteamAPI_ISteamInput_GetActiveActionSetLayers".}
proc getDigitalActionHandleRaw(self: ISteamInput, actionName: cstring): InputDigitalActionHandle {.importc: "SteamAPI_ISteamInput_GetDigitalActionHandle".}
proc getDigitalActionData*(self: ISteamInput, inputHandle: InputHandle, digitalActionHandle: InputDigitalActionHandle): InputDigitalActionData {.importc: "SteamAPI_ISteamInput_GetDigitalActionData".}
proc getDigitalActionOrigins*(self: ISteamInput, inputHandle: InputHandle, actionSetHandle: InputActionSetHandle, digitalActionHandle: InputDigitalActionHandle, originsOut: ptr InputActionOrigin): cint {.importc: "SteamAPI_ISteamInput_GetDigitalActionOrigins".}
proc getStringForDigitalActionNameRaw(self: ISteamInput, actionHandle: InputDigitalActionHandle): cstring {.importc: "SteamAPI_ISteamInput_GetStringForDigitalActionName".}
proc getAnalogActionHandleRaw(self: ISteamInput, actionName: cstring): InputAnalogActionHandle {.importc: "SteamAPI_ISteamInput_GetAnalogActionHandle".}
proc getAnalogActionData*(self: ISteamInput, inputHandle: InputHandle, analogActionHandle: InputAnalogActionHandle): InputAnalogActionData {.importc: "SteamAPI_ISteamInput_GetAnalogActionData".}
proc getAnalogActionOrigins*(self: ISteamInput, inputHandle: InputHandle, actionSetHandle: InputActionSetHandle, analogActionHandle: InputAnalogActionHandle, originsOut: ptr InputActionOrigin): cint {.importc: "SteamAPI_ISteamInput_GetAnalogActionOrigins".}
proc getGlyphPngForActionOriginRaw(self: ISteamInput, origin: InputActionOrigin, size: InputGlyphSize, flags: uint32): cstring {.importc: "SteamAPI_ISteamInput_GetGlyphPNGForActionOrigin".}
proc getGlyphSvgForActionOriginRaw(self: ISteamInput, origin: InputActionOrigin, flags: uint32): cstring {.importc: "SteamAPI_ISteamInput_GetGlyphSVGForActionOrigin".}
proc getGlyphForActionOriginLegacyRaw(self: ISteamInput, origin: InputActionOrigin): cstring {.importc: "SteamAPI_ISteamInput_GetGlyphForActionOrigin_Legacy".}
proc getStringForActionOriginRaw(self: ISteamInput, origin: InputActionOrigin): cstring {.importc: "SteamAPI_ISteamInput_GetStringForActionOrigin".}
proc getStringForAnalogActionNameRaw(self: ISteamInput, actionHandle: InputAnalogActionHandle): cstring {.importc: "SteamAPI_ISteamInput_GetStringForAnalogActionName".}
proc stopAnalogActionMomentum*(self: ISteamInput, inputHandle: InputHandle, action: InputAnalogActionHandle) {.importc: "SteamAPI_ISteamInput_StopAnalogActionMomentum".}
proc getMotionData*(self: ISteamInput, inputHandle: InputHandle): InputMotionData {.importc: "SteamAPI_ISteamInput_GetMotionData".}
proc triggerVibration*(self: ISteamInput, inputHandle: InputHandle, leftSpeed: uint16, rightSpeed: uint16) {.importc: "SteamAPI_ISteamInput_TriggerVibration".}
proc triggerVibrationExtended*(self: ISteamInput, inputHandle: InputHandle, leftSpeed: uint16, rightSpeed: uint16, leftTriggerSpeed: uint16, rightTriggerSpeed: uint16) {.importc: "SteamAPI_ISteamInput_TriggerVibrationExtended".}
proc triggerSimpleHapticEvent*(self: ISteamInput, inputHandle: InputHandle, hapticLocation: ControllerHapticLocation, intensity: uint8, gainDb: char, otherIntensity: uint8, otherGainDb: char) {.importc: "SteamAPI_ISteamInput_TriggerSimpleHapticEvent".}
proc setLedColor*(self: ISteamInput, inputHandle: InputHandle, colorR: uint8, colorG: uint8, colorB: uint8, flags: uint32) {.importc: "SteamAPI_ISteamInput_SetLEDColor".}
proc legacyTriggerHapticPulse*(self: ISteamInput, inputHandle: InputHandle, targetPad: ControllerPad, durationMicroSec: uint16) {.importc: "SteamAPI_ISteamInput_Legacy_TriggerHapticPulse".}
proc legacyTriggerRepeatedHapticPulse*(self: ISteamInput, inputHandle: InputHandle, targetPad: ControllerPad, durationMicroSec: uint16, offMicroSec: uint16, repeat: uint16, flags: uint32) {.importc: "SteamAPI_ISteamInput_Legacy_TriggerRepeatedHapticPulse".}
proc showBindingPanel*(self: ISteamInput, inputHandle: InputHandle): bool {.importc: "SteamAPI_ISteamInput_ShowBindingPanel".}
proc getInputTypeForHandle*(self: ISteamInput, inputHandle: InputHandle): InputType {.importc: "SteamAPI_ISteamInput_GetInputTypeForHandle".}
proc getControllerForGamepadIndex*(self: ISteamInput, index: cint): InputHandle {.importc: "SteamAPI_ISteamInput_GetControllerForGamepadIndex".}
proc getGamepadIndexForController*(self: ISteamInput, ulinputHandle: InputHandle): cint {.importc: "SteamAPI_ISteamInput_GetGamepadIndexForController".}
proc getStringForXboxOriginRaw(self: ISteamInput, origin: XboxOrigin): cstring {.importc: "SteamAPI_ISteamInput_GetStringForXboxOrigin".}
proc getGlyphForXboxOriginRaw(self: ISteamInput, origin: XboxOrigin): cstring {.importc: "SteamAPI_ISteamInput_GetGlyphForXboxOrigin".}
proc getActionOriginFromXboxOrigin*(self: ISteamInput, inputHandle: InputHandle, origin: XboxOrigin): InputActionOrigin {.importc: "SteamAPI_ISteamInput_GetActionOriginFromXboxOrigin".}
proc translateActionOrigin*(self: ISteamInput, destinationInputType: InputType, sourceOrigin: InputActionOrigin): InputActionOrigin {.importc: "SteamAPI_ISteamInput_TranslateActionOrigin".}
proc getDeviceBindingRevision*(self: ISteamInput, inputHandle: InputHandle, major: ptr cint, minor: ptr cint): bool {.importc: "SteamAPI_ISteamInput_GetDeviceBindingRevision".}
proc getRemotePlaySessionId*(self: ISteamInput, inputHandle: InputHandle): uint32 {.importc: "SteamAPI_ISteamInput_GetRemotePlaySessionID".}
proc getSessionInputConfigurationSettings*(self: ISteamInput): uint16 {.importc: "SteamAPI_ISteamInput_GetSessionInputConfigurationSettings".}
proc setDualSenseTriggerEffect*(self: ISteamInput, inputHandle: InputHandle, param: pointer) {.importc: "SteamAPI_ISteamInput_SetDualSenseTriggerEffect".}

# ISteamController
proc init*(self: ISteamController): bool {.importc: "SteamAPI_ISteamController_Init".}
proc shutdown*(self: ISteamController): bool {.importc: "SteamAPI_ISteamController_Shutdown".}
proc runFrame*(self: ISteamController) {.importc: "SteamAPI_ISteamController_RunFrame".}
proc getConnectedControllers*(self: ISteamController, handlesOut: ptr ControllerHandle): cint {.importc: "SteamAPI_ISteamController_GetConnectedControllers".}
proc getActionSetHandleRaw(self: ISteamController, actionSetName: cstring): ControllerActionSetHandle {.importc: "SteamAPI_ISteamController_GetActionSetHandle".}
proc activateActionSet*(self: ISteamController, controllerHandle: ControllerHandle, actionSetHandle: ControllerActionSetHandle) {.importc: "SteamAPI_ISteamController_ActivateActionSet".}
proc getCurrentActionSet*(self: ISteamController, controllerHandle: ControllerHandle): ControllerActionSetHandle {.importc: "SteamAPI_ISteamController_GetCurrentActionSet".}
proc activateActionSetLayer*(self: ISteamController, controllerHandle: ControllerHandle, actionSetLayerHandle: ControllerActionSetHandle) {.importc: "SteamAPI_ISteamController_ActivateActionSetLayer".}
proc deactivateActionSetLayer*(self: ISteamController, controllerHandle: ControllerHandle, actionSetLayerHandle: ControllerActionSetHandle) {.importc: "SteamAPI_ISteamController_DeactivateActionSetLayer".}
proc deactivateAllActionSetLayers*(self: ISteamController, controllerHandle: ControllerHandle) {.importc: "SteamAPI_ISteamController_DeactivateAllActionSetLayers".}
proc getActiveActionSetLayers*(self: ISteamController, controllerHandle: ControllerHandle, handlesOut: ptr ControllerActionSetHandle): cint {.importc: "SteamAPI_ISteamController_GetActiveActionSetLayers".}
proc getDigitalActionHandleRaw(self: ISteamController, actionName: cstring): ControllerDigitalActionHandle {.importc: "SteamAPI_ISteamController_GetDigitalActionHandle".}
proc getDigitalActionData*(self: ISteamController, controllerHandle: ControllerHandle, digitalActionHandle: ControllerDigitalActionHandle): InputDigitalActionData {.importc: "SteamAPI_ISteamController_GetDigitalActionData".}
proc getDigitalActionOrigins*(self: ISteamController, controllerHandle: ControllerHandle, actionSetHandle: ControllerActionSetHandle, digitalActionHandle: ControllerDigitalActionHandle, originsOut: ptr ControllerActionOrigin): cint {.importc: "SteamAPI_ISteamController_GetDigitalActionOrigins".}
proc getAnalogActionHandleRaw(self: ISteamController, actionName: cstring): ControllerAnalogActionHandle {.importc: "SteamAPI_ISteamController_GetAnalogActionHandle".}
proc getAnalogActionData*(self: ISteamController, controllerHandle: ControllerHandle, analogActionHandle: ControllerAnalogActionHandle): InputAnalogActionData {.importc: "SteamAPI_ISteamController_GetAnalogActionData".}
proc getAnalogActionOrigins*(self: ISteamController, controllerHandle: ControllerHandle, actionSetHandle: ControllerActionSetHandle, analogActionHandle: ControllerAnalogActionHandle, originsOut: ptr ControllerActionOrigin): cint {.importc: "SteamAPI_ISteamController_GetAnalogActionOrigins".}
proc getGlyphForActionOriginRaw(self: ISteamController, origin: ControllerActionOrigin): cstring {.importc: "SteamAPI_ISteamController_GetGlyphForActionOrigin".}
proc getStringForActionOriginRaw(self: ISteamController, origin: ControllerActionOrigin): cstring {.importc: "SteamAPI_ISteamController_GetStringForActionOrigin".}
proc stopAnalogActionMomentum*(self: ISteamController, controllerHandle: ControllerHandle, action: ControllerAnalogActionHandle) {.importc: "SteamAPI_ISteamController_StopAnalogActionMomentum".}
proc getMotionData*(self: ISteamController, controllerHandle: ControllerHandle): InputMotionData {.importc: "SteamAPI_ISteamController_GetMotionData".}
proc triggerHapticPulse*(self: ISteamController, controllerHandle: ControllerHandle, targetPad: ControllerPad, durationMicroSec: uint16) {.importc: "SteamAPI_ISteamController_TriggerHapticPulse".}
proc triggerRepeatedHapticPulse*(self: ISteamController, controllerHandle: ControllerHandle, targetPad: ControllerPad, durationMicroSec: uint16, offMicroSec: uint16, repeat: uint16, flags: uint32) {.importc: "SteamAPI_ISteamController_TriggerRepeatedHapticPulse".}
proc triggerVibration*(self: ISteamController, controllerHandle: ControllerHandle, leftSpeed: uint16, rightSpeed: uint16) {.importc: "SteamAPI_ISteamController_TriggerVibration".}
proc setLedColor*(self: ISteamController, controllerHandle: ControllerHandle, colorR: uint8, colorG: uint8, colorB: uint8, flags: uint32) {.importc: "SteamAPI_ISteamController_SetLEDColor".}
proc showBindingPanel*(self: ISteamController, controllerHandle: ControllerHandle): bool {.importc: "SteamAPI_ISteamController_ShowBindingPanel".}
proc getInputTypeForHandle*(self: ISteamController, controllerHandle: ControllerHandle): InputType {.importc: "SteamAPI_ISteamController_GetInputTypeForHandle".}
proc getControllerForGamepadIndex*(self: ISteamController, index: cint): ControllerHandle {.importc: "SteamAPI_ISteamController_GetControllerForGamepadIndex".}
proc getGamepadIndexForController*(self: ISteamController, controllerHandle: ControllerHandle): cint {.importc: "SteamAPI_ISteamController_GetGamepadIndexForController".}
proc getStringForXboxOriginRaw(self: ISteamController, origin: XboxOrigin): cstring {.importc: "SteamAPI_ISteamController_GetStringForXboxOrigin".}
proc getGlyphForXboxOriginRaw(self: ISteamController, origin: XboxOrigin): cstring {.importc: "SteamAPI_ISteamController_GetGlyphForXboxOrigin".}
proc getActionOriginFromXboxOrigin*(self: ISteamController, controllerHandle: ControllerHandle, origin: XboxOrigin): ControllerActionOrigin {.importc: "SteamAPI_ISteamController_GetActionOriginFromXboxOrigin".}
proc translateActionOrigin*(self: ISteamController, destinationInputType: InputType, sourceOrigin: ControllerActionOrigin): ControllerActionOrigin {.importc: "SteamAPI_ISteamController_TranslateActionOrigin".}
proc getControllerBindingRevision*(self: ISteamController, controllerHandle: ControllerHandle, major: ptr cint, minor: ptr cint): bool {.importc: "SteamAPI_ISteamController_GetControllerBindingRevision".}

# ISteamUGC
proc createQueryUserUgcRequest*(self: ISteamUGC, accountId: AccountId, listType: UserUGCList, matchingUgcType: UGCMatchingUGCType, sortOrder: UserUGCListSortOrder, creatorAppId: AppId, consumerAppId: AppId, page: uint32): UGCQueryHandle {.importc: "SteamAPI_ISteamUGC_CreateQueryUserUGCRequest".}
proc createQueryAllUgcRequest*(self: ISteamUGC, queryType: UGCQuery, matchingeMatchingUgcTypeFileType: UGCMatchingUGCType, creatorAppId: AppId, consumerAppId: AppId, page: uint32): UGCQueryHandle {.importc: "SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage".}
proc createQueryAllUgcRequestRaw(self: ISteamUGC, queryType: UGCQuery, matchingeMatchingUgcTypeFileType: UGCMatchingUGCType, creatorAppId: AppId, consumerAppId: AppId, cursor: cstring): UGCQueryHandle {.importc: "SteamAPI_ISteamUGC_CreateQueryAllUGCRequestCursor".}
proc createQueryUgcDetailsRequest*(self: ISteamUGC, publishedFileId: ptr PublishedFileId, numPublishedFileIds: uint32): UGCQueryHandle {.importc: "SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest".}
proc sendQueryUgcRequest*(self: ISteamUGC, handle: UGCQueryHandle): SteamAPICall {.importc: "SteamAPI_ISteamUGC_SendQueryUGCRequest".}
proc getQueryUgcResult*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, details: ptr SteamUGCDetails): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCResult".}
proc getQueryUgcNumTags*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32): uint32 {.importc: "SteamAPI_ISteamUGC_GetQueryUGCNumTags".}
proc getQueryUgcTagRaw(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, indexTag: uint32, value: ptr char, valueSize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCTag".}
proc getQueryUgcTagDisplayNameRaw(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, indexTag: uint32, value: ptr char, valueSize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCTagDisplayName".}
proc getQueryUgcPreviewUrlRaw(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, url: ptr char, urlSize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCPreviewURL".}
proc getQueryUgcMetadataRaw(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, metadata: ptr char, metadatasize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCMetadata".}
proc getQueryUgcChildren*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, publishedFileId: ptr PublishedFileId, maxEntries: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCChildren".}
proc getQueryUgcStatistic*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, statType: ItemStatistic, statValue: ptr uint64): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCStatistic".}
proc getQueryUgcNumAdditionalPreviews*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32): uint32 {.importc: "SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews".}
proc getQueryUgcAdditionalPreviewRaw(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, previewIndex: uint32, urlOrVideoId: ptr char, urlSize: uint32, originalFileName: ptr char, originalFileNameSize: uint32, previewType: ptr ItemPreviewType): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview".}
proc getQueryUgcNumKeyValueTags*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32): uint32 {.importc: "SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags".}
proc getQueryUgcKeyValueTagRaw(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, keyValueTagIndex: uint32, key: ptr char, keySize: uint32, value: ptr char, valueSize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag".}
proc getQueryUgcKeyValueTagRaw(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, key: cstring, value: ptr char, valueSize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag".}
proc getNumSupportedGameVersions*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32): uint32 {.importc: "SteamAPI_ISteamUGC_GetNumSupportedGameVersions".}
proc getSupportedGameVersionDataRaw(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, versionIndex: uint32, gameBranchMin: ptr char, gameBranchMax: ptr char, gameBranchSize: uint32): bool {.importc: "SteamAPI_ISteamUGC_GetSupportedGameVersionData".}
proc getQueryUgcContentDescriptors*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, descriptors: ptr UGCContentDescriptorID, maxEntries: uint32): uint32 {.importc: "SteamAPI_ISteamUGC_GetQueryUGCContentDescriptors".}
proc releaseQueryUgcRequest*(self: ISteamUGC, handle: UGCQueryHandle): bool {.importc: "SteamAPI_ISteamUGC_ReleaseQueryUGCRequest".}
proc addRequiredTagRaw(self: ISteamUGC, handle: UGCQueryHandle, tagName: cstring): bool {.importc: "SteamAPI_ISteamUGC_AddRequiredTag".}
proc addRequiredTagGroupRaw(self: ISteamUGC, handle: UGCQueryHandle, tagGroups: ptr SteamParamStringArray): bool {.importc: "SteamAPI_ISteamUGC_AddRequiredTagGroup".}
proc addExcludedTagRaw(self: ISteamUGC, handle: UGCQueryHandle, tagName: cstring): bool {.importc: "SteamAPI_ISteamUGC_AddExcludedTag".}
proc setReturnOnlyIds*(self: ISteamUGC, handle: UGCQueryHandle, returnOnlyIds: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnOnlyIDs".}
proc setReturnKeyValueTags*(self: ISteamUGC, handle: UGCQueryHandle, returnKeyValueTags: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnKeyValueTags".}
proc setReturnLongDescription*(self: ISteamUGC, handle: UGCQueryHandle, returnLongDescription: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnLongDescription".}
proc setReturnMetadata*(self: ISteamUGC, handle: UGCQueryHandle, returnMetadata: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnMetadata".}
proc setReturnChildren*(self: ISteamUGC, handle: UGCQueryHandle, returnChildren: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnChildren".}
proc setReturnAdditionalPreviews*(self: ISteamUGC, handle: UGCQueryHandle, returnAdditionalPreviews: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnAdditionalPreviews".}
proc setReturnTotalOnly*(self: ISteamUGC, handle: UGCQueryHandle, returnTotalOnly: bool): bool {.importc: "SteamAPI_ISteamUGC_SetReturnTotalOnly".}
proc setReturnPlaytimeStats*(self: ISteamUGC, handle: UGCQueryHandle, days: uint32): bool {.importc: "SteamAPI_ISteamUGC_SetReturnPlaytimeStats".}
proc setLanguageRaw(self: ISteamUGC, handle: UGCQueryHandle, language: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetLanguage".}
proc setAllowCachedResponse*(self: ISteamUGC, handle: UGCQueryHandle, maxAgeSeconds: uint32): bool {.importc: "SteamAPI_ISteamUGC_SetAllowCachedResponse".}
proc setAdminQuery*(self: ISteamUGC, handle: UGCUpdateHandle, adminQuery: bool): bool {.importc: "SteamAPI_ISteamUGC_SetAdminQuery".}
proc setCloudFileNameFilterRaw(self: ISteamUGC, handle: UGCQueryHandle, matchCloudFileName: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetCloudFileNameFilter".}
proc setMatchAnyTag*(self: ISteamUGC, handle: UGCQueryHandle, matchAnyTag: bool): bool {.importc: "SteamAPI_ISteamUGC_SetMatchAnyTag".}
proc setSearchTextRaw(self: ISteamUGC, handle: UGCQueryHandle, searchText: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetSearchText".}
proc setRankedByTrendDays*(self: ISteamUGC, handle: UGCQueryHandle, days: uint32): bool {.importc: "SteamAPI_ISteamUGC_SetRankedByTrendDays".}
proc setTimeCreatedDateRange*(self: ISteamUGC, handle: UGCQueryHandle, rtStart: RTime32, rtEnd: RTime32): bool {.importc: "SteamAPI_ISteamUGC_SetTimeCreatedDateRange".}
proc setTimeUpdatedDateRange*(self: ISteamUGC, handle: UGCQueryHandle, rtStart: RTime32, rtEnd: RTime32): bool {.importc: "SteamAPI_ISteamUGC_SetTimeUpdatedDateRange".}
proc addRequiredKeyValueTagRaw(self: ISteamUGC, handle: UGCQueryHandle, key: cstring, value: cstring): bool {.importc: "SteamAPI_ISteamUGC_AddRequiredKeyValueTag".}
proc requestUgcDetails*(self: ISteamUGC, publishedFileId: PublishedFileId, maxAgeSeconds: uint32): SteamAPICall {.importc: "SteamAPI_ISteamUGC_RequestUGCDetails".}
proc createItem*(self: ISteamUGC, consumerAppId: AppId, fileType: WorkshopFileType): SteamAPICall {.importc: "SteamAPI_ISteamUGC_CreateItem".}
proc startItemUpdate*(self: ISteamUGC, consumerAppId: AppId, publishedFileId: PublishedFileId): UGCUpdateHandle {.importc: "SteamAPI_ISteamUGC_StartItemUpdate".}
proc setItemTitleRaw(self: ISteamUGC, handle: UGCUpdateHandle, title: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemTitle".}
proc setItemDescriptionRaw(self: ISteamUGC, handle: UGCUpdateHandle, description: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemDescription".}
proc setItemUpdateLanguageRaw(self: ISteamUGC, handle: UGCUpdateHandle, language: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemUpdateLanguage".}
proc setItemMetadataRaw(self: ISteamUGC, handle: UGCUpdateHandle, metaData: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemMetadata".}
proc setItemVisibility*(self: ISteamUGC, handle: UGCUpdateHandle, visibility: RemoteStoragePublishedFileVisibility): bool {.importc: "SteamAPI_ISteamUGC_SetItemVisibility".}
proc setItemTagsRaw(self: ISteamUGC, updateHandle: UGCUpdateHandle, tags: ptr SteamParamStringArray, allowAdminTags: bool): bool {.importc: "SteamAPI_ISteamUGC_SetItemTags".}
proc setItemContentRaw(self: ISteamUGC, handle: UGCUpdateHandle, contentFolder: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemContent".}
proc setItemPreviewRaw(self: ISteamUGC, handle: UGCUpdateHandle, previewFile: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetItemPreview".}
proc setAllowLegacyUpload*(self: ISteamUGC, handle: UGCUpdateHandle, allowLegacyUpload: bool): bool {.importc: "SteamAPI_ISteamUGC_SetAllowLegacyUpload".}
proc removeAllItemKeyValueTags*(self: ISteamUGC, handle: UGCUpdateHandle): bool {.importc: "SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags".}
proc removeItemKeyValueTagsRaw(self: ISteamUGC, handle: UGCUpdateHandle, key: cstring): bool {.importc: "SteamAPI_ISteamUGC_RemoveItemKeyValueTags".}
proc addItemKeyValueTagRaw(self: ISteamUGC, handle: UGCUpdateHandle, key: cstring, value: cstring): bool {.importc: "SteamAPI_ISteamUGC_AddItemKeyValueTag".}
proc addItemPreviewFileRaw(self: ISteamUGC, handle: UGCUpdateHandle, previewFile: cstring, typeValue: ItemPreviewType): bool {.importc: "SteamAPI_ISteamUGC_AddItemPreviewFile".}
proc addItemPreviewVideoRaw(self: ISteamUGC, handle: UGCUpdateHandle, videoId: cstring): bool {.importc: "SteamAPI_ISteamUGC_AddItemPreviewVideo".}
proc updateItemPreviewFileRaw(self: ISteamUGC, handle: UGCUpdateHandle, index: uint32, previewFile: cstring): bool {.importc: "SteamAPI_ISteamUGC_UpdateItemPreviewFile".}
proc updateItemPreviewVideoRaw(self: ISteamUGC, handle: UGCUpdateHandle, index: uint32, videoId: cstring): bool {.importc: "SteamAPI_ISteamUGC_UpdateItemPreviewVideo".}
proc removeItemPreview*(self: ISteamUGC, handle: UGCUpdateHandle, index: uint32): bool {.importc: "SteamAPI_ISteamUGC_RemoveItemPreview".}
proc addContentDescriptor*(self: ISteamUGC, handle: UGCUpdateHandle, descid: UGCContentDescriptorID): bool {.importc: "SteamAPI_ISteamUGC_AddContentDescriptor".}
proc removeContentDescriptor*(self: ISteamUGC, handle: UGCUpdateHandle, descid: UGCContentDescriptorID): bool {.importc: "SteamAPI_ISteamUGC_RemoveContentDescriptor".}
proc setRequiredGameVersionsRaw(self: ISteamUGC, handle: UGCUpdateHandle, gameBranchMin: cstring, gameBranchMax: cstring): bool {.importc: "SteamAPI_ISteamUGC_SetRequiredGameVersions".}
proc submitItemUpdateRaw(self: ISteamUGC, handle: UGCUpdateHandle, changeNote: cstring): SteamAPICall {.importc: "SteamAPI_ISteamUGC_SubmitItemUpdate".}
proc getItemUpdateProgress*(self: ISteamUGC, handle: UGCUpdateHandle, bytesProcessed: ptr uint64, bytesTotal: ptr uint64): ItemUpdateStatus {.importc: "SteamAPI_ISteamUGC_GetItemUpdateProgress".}
proc setUserItemVote*(self: ISteamUGC, publishedFileId: PublishedFileId, voteUp: bool): SteamAPICall {.importc: "SteamAPI_ISteamUGC_SetUserItemVote".}
proc getUserItemVote*(self: ISteamUGC, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_GetUserItemVote".}
proc addItemToFavorites*(self: ISteamUGC, appId: AppId, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_AddItemToFavorites".}
proc removeItemFromFavorites*(self: ISteamUGC, appId: AppId, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_RemoveItemFromFavorites".}
proc subscribeItem*(self: ISteamUGC, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_SubscribeItem".}
proc unsubscribeItem*(self: ISteamUGC, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_UnsubscribeItem".}
proc getNumSubscribedItems*(self: ISteamUGC, includeLocallyDisabled: bool): uint32 {.importc: "SteamAPI_ISteamUGC_GetNumSubscribedItems".}
proc getSubscribedItems*(self: ISteamUGC, publishedFileId: ptr PublishedFileId, maxEntries: uint32, includeLocallyDisabled: bool): uint32 {.importc: "SteamAPI_ISteamUGC_GetSubscribedItems".}
proc getItemState*(self: ISteamUGC, publishedFileId: PublishedFileId): uint32 {.importc: "SteamAPI_ISteamUGC_GetItemState".}
proc getItemInstallInfoRaw(self: ISteamUGC, publishedFileId: PublishedFileId, sizeOnDisk: ptr uint64, folder: ptr char, folderSize: uint32, timeStamp: ptr uint32): bool {.importc: "SteamAPI_ISteamUGC_GetItemInstallInfo".}
proc getItemDownloadInfo*(self: ISteamUGC, publishedFileId: PublishedFileId, bytesDownloaded: ptr uint64, bytesTotal: ptr uint64): bool {.importc: "SteamAPI_ISteamUGC_GetItemDownloadInfo".}
proc downloadItem*(self: ISteamUGC, publishedFileId: PublishedFileId, highPriority: bool): bool {.importc: "SteamAPI_ISteamUGC_DownloadItem".}
proc initWorkshopForGameServerRaw(self: ISteamUGC, workshopDepotId: DepotId, folder: cstring): bool {.importc: "SteamAPI_ISteamUGC_BInitWorkshopForGameServer".}
proc suspendDownloads*(self: ISteamUGC, suspend: bool) {.importc: "SteamAPI_ISteamUGC_SuspendDownloads".}
proc startPlaytimeTracking*(self: ISteamUGC, publishedFileId: ptr PublishedFileId, numPublishedFileIds: uint32): SteamAPICall {.importc: "SteamAPI_ISteamUGC_StartPlaytimeTracking".}
proc stopPlaytimeTracking*(self: ISteamUGC, publishedFileId: ptr PublishedFileId, numPublishedFileIds: uint32): SteamAPICall {.importc: "SteamAPI_ISteamUGC_StopPlaytimeTracking".}
proc stopPlaytimeTrackingForAllItems*(self: ISteamUGC): SteamAPICall {.importc: "SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems".}
proc addDependency*(self: ISteamUGC, parentPublishedFileId: PublishedFileId, childPublishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_AddDependency".}
proc removeDependency*(self: ISteamUGC, parentPublishedFileId: PublishedFileId, childPublishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_RemoveDependency".}
proc addAppDependency*(self: ISteamUGC, publishedFileId: PublishedFileId, appId: AppId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_AddAppDependency".}
proc removeAppDependency*(self: ISteamUGC, publishedFileId: PublishedFileId, appId: AppId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_RemoveAppDependency".}
proc getAppDependencies*(self: ISteamUGC, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_GetAppDependencies".}
proc deleteItem*(self: ISteamUGC, publishedFileId: PublishedFileId): SteamAPICall {.importc: "SteamAPI_ISteamUGC_DeleteItem".}
proc showWorkshopEula*(self: ISteamUGC): bool {.importc: "SteamAPI_ISteamUGC_ShowWorkshopEULA".}
proc getWorkshopEulaStatus*(self: ISteamUGC): SteamAPICall {.importc: "SteamAPI_ISteamUGC_GetWorkshopEULAStatus".}
proc getUserContentDescriptorPreferences*(self: ISteamUGC, descriptors: ptr UGCContentDescriptorID, maxEntries: uint32): uint32 {.importc: "SteamAPI_ISteamUGC_GetUserContentDescriptorPreferences".}
proc setItemsDisabledLocally*(self: ISteamUGC, publishedFileIds: ptr PublishedFileId, numPublishedFileIds: uint32, disabledLocally: bool): bool {.importc: "SteamAPI_ISteamUGC_SetItemsDisabledLocally".}
proc setSubscriptionsLoadOrder*(self: ISteamUGC, publishedFileIds: ptr PublishedFileId, numPublishedFileIds: uint32): bool {.importc: "SteamAPI_ISteamUGC_SetSubscriptionsLoadOrder".}
proc markDownloadedItemAsUnused*(self: ISteamUGC, publishedFileId: PublishedFileId): bool {.importc: "SteamAPI_ISteamUGC_MarkDownloadedItemAsUnused".}
proc getNumDownloadedItems*(self: ISteamUGC): uint32 {.importc: "SteamAPI_ISteamUGC_GetNumDownloadedItems".}
proc getDownloadedItems*(self: ISteamUGC, publishedFileIds: ptr PublishedFileId, maxEntries: uint32): uint32 {.importc: "SteamAPI_ISteamUGC_GetDownloadedItems".}

# ISteamHTMLSurface
proc init*(self: ISteamHTMLSurface): bool {.importc: "SteamAPI_ISteamHTMLSurface_Init".}
proc shutdown*(self: ISteamHTMLSurface): bool {.importc: "SteamAPI_ISteamHTMLSurface_Shutdown".}
proc createBrowserRaw(self: ISteamHTMLSurface, userAgent: cstring, userCss: cstring): SteamAPICall {.importc: "SteamAPI_ISteamHTMLSurface_CreateBrowser".}
proc removeBrowser*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_RemoveBrowser".}
proc loadUrlRaw(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, url: cstring, postData: cstring) {.importc: "SteamAPI_ISteamHTMLSurface_LoadURL".}
proc setSize*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, width: uint32, height: uint32) {.importc: "SteamAPI_ISteamHTMLSurface_SetSize".}
proc stopLoad*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_StopLoad".}
proc reload*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_Reload".}
proc goBack*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_GoBack".}
proc goForward*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_GoForward".}
proc addHeaderRaw(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, key: cstring, value: cstring) {.importc: "SteamAPI_ISteamHTMLSurface_AddHeader".}
proc executeJavascriptRaw(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, script: cstring) {.importc: "SteamAPI_ISteamHTMLSurface_ExecuteJavascript".}
proc mouseUp*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, mouseButton: HTMLMouseButton) {.importc: "SteamAPI_ISteamHTMLSurface_MouseUp".}
proc mouseDown*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, mouseButton: HTMLMouseButton) {.importc: "SteamAPI_ISteamHTMLSurface_MouseDown".}
proc mouseDoubleClick*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, mouseButton: HTMLMouseButton) {.importc: "SteamAPI_ISteamHTMLSurface_MouseDoubleClick".}
proc mouseMove*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, x: cint, y: cint) {.importc: "SteamAPI_ISteamHTMLSurface_MouseMove".}
proc mouseWheel*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, delta: int32) {.importc: "SteamAPI_ISteamHTMLSurface_MouseWheel".}
proc keyDown*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, nativeKeyCode: uint32, htmlKeyModifiers: HTMLKeyModifiers, isSystemKey: bool) {.importc: "SteamAPI_ISteamHTMLSurface_KeyDown".}
proc keyUp*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, nativeKeyCode: uint32, htmlKeyModifiers: HTMLKeyModifiers) {.importc: "SteamAPI_ISteamHTMLSurface_KeyUp".}
proc keyChar*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, unicodeChar: uint32, htmlKeyModifiers: HTMLKeyModifiers) {.importc: "SteamAPI_ISteamHTMLSurface_KeyChar".}
proc setHorizontalScroll*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, absolutePixelScroll: uint32) {.importc: "SteamAPI_ISteamHTMLSurface_SetHorizontalScroll".}
proc setVerticalScroll*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, absolutePixelScroll: uint32) {.importc: "SteamAPI_ISteamHTMLSurface_SetVerticalScroll".}
proc setKeyFocus*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, hasKeyFocus: bool) {.importc: "SteamAPI_ISteamHTMLSurface_SetKeyFocus".}
proc viewSource*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_ViewSource".}
proc copyToClipboard*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_CopyToClipboard".}
proc pasteFromClipboard*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_PasteFromClipboard".}
proc findRaw(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, searchStr: cstring, currentlyInFind: bool, reverse: bool) {.importc: "SteamAPI_ISteamHTMLSurface_Find".}
proc stopFind*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_StopFind".}
proc getLinkAtPosition*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, x: cint, y: cint) {.importc: "SteamAPI_ISteamHTMLSurface_GetLinkAtPosition".}
proc setCookieRaw(self: ISteamHTMLSurface, hostname: cstring, key: cstring, value: cstring, path: cstring, expires: RTime32, secure: bool, httpOnly: bool) {.importc: "SteamAPI_ISteamHTMLSurface_SetCookie".}
proc setPageScaleFactor*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, zoom: float32, pointX: cint, pointY: cint) {.importc: "SteamAPI_ISteamHTMLSurface_SetPageScaleFactor".}
proc setBackgroundMode*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, backgroundMode: bool) {.importc: "SteamAPI_ISteamHTMLSurface_SetBackgroundMode".}
proc setDpiScalingFactor*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, dpiScaling: float32) {.importc: "SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor".}
proc openDeveloperTools*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser) {.importc: "SteamAPI_ISteamHTMLSurface_OpenDeveloperTools".}
proc allowStartRequest*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, allowed: bool) {.importc: "SteamAPI_ISteamHTMLSurface_AllowStartRequest".}
proc jsDialogResponse*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, resultValue: bool) {.importc: "SteamAPI_ISteamHTMLSurface_JSDialogResponse".}
proc fileLoadDialogResponseRaw(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, selectedFiles: ptr cstring) {.importc: "SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse".}

# ISteamInventory
proc getResultStatus*(self: ISteamInventory, resultHandle: SteamInventoryResult): Result {.importc: "SteamAPI_ISteamInventory_GetResultStatus".}
proc getResultItems*(self: ISteamInventory, resultHandle: SteamInventoryResult, outItemsArray: ptr SteamItemDetails, outItemsArraySize: ptr uint32): bool {.importc: "SteamAPI_ISteamInventory_GetResultItems".}
proc getResultItemPropertyRaw(self: ISteamInventory, resultHandle: SteamInventoryResult, itemIndex: uint32, propertyName: cstring, valueBuffer: ptr char, valueBufferSizeOut: ptr uint32): bool {.importc: "SteamAPI_ISteamInventory_GetResultItemProperty".}
proc getResultTimestamp*(self: ISteamInventory, resultHandle: SteamInventoryResult): uint32 {.importc: "SteamAPI_ISteamInventory_GetResultTimestamp".}
proc checkResultSteamId*(self: ISteamInventory, resultHandle: SteamInventoryResult, steamIdExpected: SteamId): bool {.importc: "SteamAPI_ISteamInventory_CheckResultSteamID".}
proc destroyResult*(self: ISteamInventory, resultHandle: SteamInventoryResult) {.importc: "SteamAPI_ISteamInventory_DestroyResult".}
proc getAllItems*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult): bool {.importc: "SteamAPI_ISteamInventory_GetAllItems".}
proc getItemsById*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, instanceIds: ptr SteamItemInstanceID, countInstanceIds: uint32): bool {.importc: "SteamAPI_ISteamInventory_GetItemsByID".}
proc serializeResult*(self: ISteamInventory, resultHandle: SteamInventoryResult, outBuffer: pointer, outBufferSize: ptr uint32): bool {.importc: "SteamAPI_ISteamInventory_SerializeResult".}
proc deserializeResult*(self: ISteamInventory, outResultHandle: ptr SteamInventoryResult, buffer: pointer, bufferSize: uint32, reservedMustBeFalse: bool): bool {.importc: "SteamAPI_ISteamInventory_DeserializeResult".}
proc generateItems*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, arrayItemDefs: ptr SteamItemDef, arrayQuantity: ptr uint32, arrayLength: uint32): bool {.importc: "SteamAPI_ISteamInventory_GenerateItems".}
proc grantPromoItems*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult): bool {.importc: "SteamAPI_ISteamInventory_GrantPromoItems".}
proc addPromoItem*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, itemDef: SteamItemDef): bool {.importc: "SteamAPI_ISteamInventory_AddPromoItem".}
proc addPromoItems*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, arrayItemDefs: ptr SteamItemDef, arrayLength: uint32): bool {.importc: "SteamAPI_ISteamInventory_AddPromoItems".}
proc consumeItem*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, itemConsume: SteamItemInstanceID, quantity: uint32): bool {.importc: "SteamAPI_ISteamInventory_ConsumeItem".}
proc exchangeItems*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, arrayGenerate: ptr SteamItemDef, arrayGenerateQuantity: ptr uint32, arrayGenerateLength: uint32, arrayDestroy: ptr SteamItemInstanceID, arrayDestroyQuantity: ptr uint32, arrayDestroyLength: uint32): bool {.importc: "SteamAPI_ISteamInventory_ExchangeItems".}
proc transferItemQuantity*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, itemIdSource: SteamItemInstanceID, quantity: uint32, itemIdDest: SteamItemInstanceID): bool {.importc: "SteamAPI_ISteamInventory_TransferItemQuantity".}
proc sendItemDropHeartbeat*(self: ISteamInventory) {.importc: "SteamAPI_ISteamInventory_SendItemDropHeartbeat".}
proc triggerItemDrop*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, dropListDefinition: SteamItemDef): bool {.importc: "SteamAPI_ISteamInventory_TriggerItemDrop".}
proc tradeItems*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, steamIdTradePartner: SteamId, arrayGive: ptr SteamItemInstanceID, arrayGiveQuantity: ptr uint32, arrayGiveLength: uint32, arrayGet: ptr SteamItemInstanceID, arrayGetQuantity: ptr uint32, arrayGetLength: uint32): bool {.importc: "SteamAPI_ISteamInventory_TradeItems".}
proc loadItemDefinitions*(self: ISteamInventory): bool {.importc: "SteamAPI_ISteamInventory_LoadItemDefinitions".}
proc getItemDefinitionIds*(self: ISteamInventory, itemDefIds: ptr SteamItemDef, itemDefIdsArraySize: ptr uint32): bool {.importc: "SteamAPI_ISteamInventory_GetItemDefinitionIDs".}
proc getItemDefinitionPropertyRaw(self: ISteamInventory, definition: SteamItemDef, propertyName: cstring, valueBuffer: ptr char, valueBufferSizeOut: ptr uint32): bool {.importc: "SteamAPI_ISteamInventory_GetItemDefinitionProperty".}
proc requestEligiblePromoItemDefinitionsIds*(self: ISteamInventory, steamId: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs".}
proc getEligiblePromoItemDefinitionIds*(self: ISteamInventory, steamId: SteamId, itemDefIds: ptr SteamItemDef, itemDefIdsArraySize: ptr uint32): bool {.importc: "SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs".}
proc startPurchase*(self: ISteamInventory, arrayItemDefs: ptr SteamItemDef, arrayQuantity: ptr uint32, arrayLength: uint32): SteamAPICall {.importc: "SteamAPI_ISteamInventory_StartPurchase".}
proc requestPrices*(self: ISteamInventory): SteamAPICall {.importc: "SteamAPI_ISteamInventory_RequestPrices".}
proc getNumItemsWithPrices*(self: ISteamInventory): uint32 {.importc: "SteamAPI_ISteamInventory_GetNumItemsWithPrices".}
proc getItemsWithPrices*(self: ISteamInventory, arrayItemDefs: ptr SteamItemDef, currentPrices: ptr uint64, basePrices: ptr uint64, arrayLength: uint32): bool {.importc: "SteamAPI_ISteamInventory_GetItemsWithPrices".}
proc getItemPrice*(self: ISteamInventory, definition: SteamItemDef, currentPrice: ptr uint64, basePrice: ptr uint64): bool {.importc: "SteamAPI_ISteamInventory_GetItemPrice".}
proc startUpdateProperties*(self: ISteamInventory): SteamInventoryUpdateHandle {.importc: "SteamAPI_ISteamInventory_StartUpdateProperties".}
proc removePropertyRaw(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: cstring): bool {.importc: "SteamAPI_ISteamInventory_RemoveProperty".}
proc setPropertyRaw(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: cstring, propertyValue: cstring): bool {.importc: "SteamAPI_ISteamInventory_SetPropertyString".}
proc setPropertyRaw(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: cstring, value: bool): bool {.importc: "SteamAPI_ISteamInventory_SetPropertyBool".}
proc setPropertyRaw(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: cstring, value: int64): bool {.importc: "SteamAPI_ISteamInventory_SetPropertyInt64".}
proc setPropertyRaw(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: cstring, value: float32): bool {.importc: "SteamAPI_ISteamInventory_SetPropertyFloat".}
proc submitUpdateProperties*(self: ISteamInventory, handle: SteamInventoryUpdateHandle, resultHandle: ptr SteamInventoryResult): bool {.importc: "SteamAPI_ISteamInventory_SubmitUpdateProperties".}
proc inspectItemRaw(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, itemToken: cstring): bool {.importc: "SteamAPI_ISteamInventory_InspectItem".}

# ISteamTimeline
proc setTimelineTooltipRaw(self: ISteamTimeline, description: cstring, timeDelta: float32) {.importc: "SteamAPI_ISteamTimeline_SetTimelineTooltip".}
proc clearTimelineTooltip*(self: ISteamTimeline, timeDelta: float32) {.importc: "SteamAPI_ISteamTimeline_ClearTimelineTooltip".}
proc setTimelineGameMode*(self: ISteamTimeline, mode: TimelineGameMode) {.importc: "SteamAPI_ISteamTimeline_SetTimelineGameMode".}
proc addInstantaneousTimelineEventRaw(self: ISteamTimeline, title: cstring, description: cstring, icon: cstring, iconPriority: uint32, startOffsetSeconds: float32, possibleClip: TimelineEventClipPriority): TimelineEventHandle {.importc: "SteamAPI_ISteamTimeline_AddInstantaneousTimelineEvent".}
proc addRangeTimelineEventRaw(self: ISteamTimeline, title: cstring, description: cstring, icon: cstring, iconPriority: uint32, startOffsetSeconds: float32, duration: float32, possibleClip: TimelineEventClipPriority): TimelineEventHandle {.importc: "SteamAPI_ISteamTimeline_AddRangeTimelineEvent".}
proc startRangeTimelineEventRaw(self: ISteamTimeline, title: cstring, description: cstring, icon: cstring, priority: uint32, startOffsetSeconds: float32, possibleClip: TimelineEventClipPriority): TimelineEventHandle {.importc: "SteamAPI_ISteamTimeline_StartRangeTimelineEvent".}
proc updateRangeTimelineEventRaw(self: ISteamTimeline, event: TimelineEventHandle, title: cstring, description: cstring, icon: cstring, priority: uint32, possibleClip: TimelineEventClipPriority) {.importc: "SteamAPI_ISteamTimeline_UpdateRangeTimelineEvent".}
proc endRangeTimelineEvent*(self: ISteamTimeline, event: TimelineEventHandle, endOffsetSeconds: float32) {.importc: "SteamAPI_ISteamTimeline_EndRangeTimelineEvent".}
proc removeTimelineEvent*(self: ISteamTimeline, event: TimelineEventHandle) {.importc: "SteamAPI_ISteamTimeline_RemoveTimelineEvent".}
proc doesEventRecordingExist*(self: ISteamTimeline, event: TimelineEventHandle): SteamAPICall {.importc: "SteamAPI_ISteamTimeline_DoesEventRecordingExist".}
proc startGamePhase*(self: ISteamTimeline) {.importc: "SteamAPI_ISteamTimeline_StartGamePhase".}
proc endGamePhase*(self: ISteamTimeline) {.importc: "SteamAPI_ISteamTimeline_EndGamePhase".}
proc setGamePhaseIdRaw(self: ISteamTimeline, phaseId: cstring) {.importc: "SteamAPI_ISteamTimeline_SetGamePhaseID".}
proc doesGamePhaseRecordingExistRaw(self: ISteamTimeline, phaseId: cstring): SteamAPICall {.importc: "SteamAPI_ISteamTimeline_DoesGamePhaseRecordingExist".}
proc addGamePhaseTagRaw(self: ISteamTimeline, tagName: cstring, tagIcon: cstring, tagGroup: cstring, priority: uint32) {.importc: "SteamAPI_ISteamTimeline_AddGamePhaseTag".}
proc setGamePhaseAttributeRaw(self: ISteamTimeline, attributeGroup: cstring, attributeValue: cstring, priority: uint32) {.importc: "SteamAPI_ISteamTimeline_SetGamePhaseAttribute".}
proc openOverlayToGamePhaseRaw(self: ISteamTimeline, phaseId: cstring) {.importc: "SteamAPI_ISteamTimeline_OpenOverlayToGamePhase".}
proc openOverlayToTimelineEvent*(self: ISteamTimeline, event: TimelineEventHandle) {.importc: "SteamAPI_ISteamTimeline_OpenOverlayToTimelineEvent".}

# ISteamVideo
proc getVideoUrl*(self: ISteamVideo, videoAppId: AppId) {.importc: "SteamAPI_ISteamVideo_GetVideoURL".}
proc isBroadcasting*(self: ISteamVideo, numViewers: ptr cint): bool {.importc: "SteamAPI_ISteamVideo_IsBroadcasting".}
proc getOpfSettings*(self: ISteamVideo, videoAppId: AppId) {.importc: "SteamAPI_ISteamVideo_GetOPFSettings".}
proc getOpfStringForAppRaw(self: ISteamVideo, videoAppId: AppId, buffer: ptr char, bufferSize: ptr int32): bool {.importc: "SteamAPI_ISteamVideo_GetOPFStringForApp".}

# ISteamParentalSettings
proc isParentalLockEnabled*(self: ISteamParentalSettings): bool {.importc: "SteamAPI_ISteamParentalSettings_BIsParentalLockEnabled".}
proc isParentalLockLocked*(self: ISteamParentalSettings): bool {.importc: "SteamAPI_ISteamParentalSettings_BIsParentalLockLocked".}
proc isAppBlocked*(self: ISteamParentalSettings, appId: AppId): bool {.importc: "SteamAPI_ISteamParentalSettings_BIsAppBlocked".}
proc isAppInBlockList*(self: ISteamParentalSettings, appId: AppId): bool {.importc: "SteamAPI_ISteamParentalSettings_BIsAppInBlockList".}
proc isFeatureBlocked*(self: ISteamParentalSettings, feature: ParentalFeature): bool {.importc: "SteamAPI_ISteamParentalSettings_BIsFeatureBlocked".}
proc isFeatureInBlockList*(self: ISteamParentalSettings, feature: ParentalFeature): bool {.importc: "SteamAPI_ISteamParentalSettings_BIsFeatureInBlockList".}

# ISteamRemotePlay
proc getSessionCount*(self: ISteamRemotePlay): uint32 {.importc: "SteamAPI_ISteamRemotePlay_GetSessionCount".}
proc getSessionId*(self: ISteamRemotePlay, sessionIndex: cint): RemotePlaySessionID {.importc: "SteamAPI_ISteamRemotePlay_GetSessionID".}
proc sessionRemotePlayTogether*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID): bool {.importc: "SteamAPI_ISteamRemotePlay_BSessionRemotePlayTogether".}
proc getSessionSteamId*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID): SteamId {.importc: "SteamAPI_ISteamRemotePlay_GetSessionSteamID".}
proc getSessionGuestId*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID): uint32 {.importc: "SteamAPI_ISteamRemotePlay_GetSessionGuestID".}
proc getSmallSessionAvatar*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID): cint {.importc: "SteamAPI_ISteamRemotePlay_GetSmallSessionAvatar".}
proc getMediumSessionAvatar*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID): cint {.importc: "SteamAPI_ISteamRemotePlay_GetMediumSessionAvatar".}
proc getLargeSessionAvatar*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID): cint {.importc: "SteamAPI_ISteamRemotePlay_GetLargeSessionAvatar".}
proc getSessionClientNameRaw(self: ISteamRemotePlay, sessionId: RemotePlaySessionID): cstring {.importc: "SteamAPI_ISteamRemotePlay_GetSessionClientName".}
proc getSessionClientFormFactor*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID): DeviceFormFactor {.importc: "SteamAPI_ISteamRemotePlay_GetSessionClientFormFactor".}
proc getSessionClientResolution*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID, resolutionX: ptr cint, resolutionY: ptr cint): bool {.importc: "SteamAPI_ISteamRemotePlay_BGetSessionClientResolution".}
proc showRemotePlayTogetherUi*(self: ISteamRemotePlay): bool {.importc: "SteamAPI_ISteamRemotePlay_ShowRemotePlayTogetherUI".}
proc sendRemotePlayTogetherInvite*(self: ISteamRemotePlay, steamIdFriend: SteamId): bool {.importc: "SteamAPI_ISteamRemotePlay_BSendRemotePlayTogetherInvite".}
proc enableRemotePlayTogetherDirectInput*(self: ISteamRemotePlay): bool {.importc: "SteamAPI_ISteamRemotePlay_BEnableRemotePlayTogetherDirectInput".}
proc disableRemotePlayTogetherDirectInput*(self: ISteamRemotePlay) {.importc: "SteamAPI_ISteamRemotePlay_DisableRemotePlayTogetherDirectInput".}
proc getInput*(self: ISteamRemotePlay, input: ptr RemotePlayInput, maxEvents: uint32): uint32 {.importc: "SteamAPI_ISteamRemotePlay_GetInput".}
proc setMouseVisibility*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID, visible: bool) {.importc: "SteamAPI_ISteamRemotePlay_SetMouseVisibility".}
proc setMousePosition*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID, normalizedX: float32, normalizedY: float32) {.importc: "SteamAPI_ISteamRemotePlay_SetMousePosition".}
proc createMouseCursor*(self: ISteamRemotePlay, width: cint, height: cint, hotX: cint, hotY: cint, bgra: pointer, pitch: cint): RemotePlayCursorID {.importc: "SteamAPI_ISteamRemotePlay_CreateMouseCursor".}
proc setMouseCursor*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID, cursorId: RemotePlayCursorID) {.importc: "SteamAPI_ISteamRemotePlay_SetMouseCursor".}

# ISteamNetworkingMessages
proc sendMessageToUser*(self: ISteamNetworkingMessages, identityRemote: ptr SteamNetworkingIdentity, pubData: pointer, data: uint32, sendFlags: cint, remoteChannel: cint): Result {.importc: "SteamAPI_ISteamNetworkingMessages_SendMessageToUser".}
proc receiveMessagesOnChannel*(self: ISteamNetworkingMessages, localChannel: cint, outMessages: ptr ptr SteamNetworkingMessage, maxMessages: cint): cint {.importc: "SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel".}
proc acceptSessionWithUser*(self: ISteamNetworkingMessages, identityRemote: ptr SteamNetworkingIdentity): bool {.importc: "SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser".}
proc closeSessionWithUser*(self: ISteamNetworkingMessages, identityRemote: ptr SteamNetworkingIdentity): bool {.importc: "SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser".}
proc closeChannelWithUser*(self: ISteamNetworkingMessages, identityRemote: ptr SteamNetworkingIdentity, localChannel: cint): bool {.importc: "SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser".}
proc getSessionConnectionInfo*(self: ISteamNetworkingMessages, identityRemote: ptr SteamNetworkingIdentity, connectionInfo: ptr SteamNetConnectionInfo, quickStatus: ptr SteamNetConnectionRealTimeStatus): NetworkingConnectionState {.importc: "SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo".}

# ISteamNetworkingSockets
proc createListenSocketIp*(self: ISteamNetworkingSockets, localAddress: ptr SteamNetworkingIPAddr, options: cint, options2: ptr SteamNetworkingConfigValue): HSteamListenSocket {.importc: "SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP".}
proc connectByIpAddress*(self: ISteamNetworkingSockets, address: ptr SteamNetworkingIPAddr, options: cint, options2: ptr SteamNetworkingConfigValue): HSteamNetConnection {.importc: "SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress".}
proc createListenSocketP2P*(self: ISteamNetworkingSockets, localVirtualPort: cint, options: cint, options2: ptr SteamNetworkingConfigValue): HSteamListenSocket {.importc: "SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P".}
proc connectP2P*(self: ISteamNetworkingSockets, identityRemote: ptr SteamNetworkingIdentity, remoteVirtualPort: cint, options: cint, options2: ptr SteamNetworkingConfigValue): HSteamNetConnection {.importc: "SteamAPI_ISteamNetworkingSockets_ConnectP2P".}
proc acceptConnection*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection): Result {.importc: "SteamAPI_ISteamNetworkingSockets_AcceptConnection".}
proc closeConnectionRaw(self: ISteamNetworkingSockets, hPeer: HSteamNetConnection, reason: cint, debug: cstring, enableLinger: bool): bool {.importc: "SteamAPI_ISteamNetworkingSockets_CloseConnection".}
proc closeListenSocket*(self: ISteamNetworkingSockets, hSocket: HSteamListenSocket): bool {.importc: "SteamAPI_ISteamNetworkingSockets_CloseListenSocket".}
proc setConnectionUserData*(self: ISteamNetworkingSockets, hPeer: HSteamNetConnection, userData: int64): bool {.importc: "SteamAPI_ISteamNetworkingSockets_SetConnectionUserData".}
proc getConnectionUserData*(self: ISteamNetworkingSockets, hPeer: HSteamNetConnection): int64 {.importc: "SteamAPI_ISteamNetworkingSockets_GetConnectionUserData".}
proc setConnectionNameRaw(self: ISteamNetworkingSockets, hPeer: HSteamNetConnection, name: cstring) {.importc: "SteamAPI_ISteamNetworkingSockets_SetConnectionName".}
proc getConnectionNameRaw(self: ISteamNetworkingSockets, hPeer: HSteamNetConnection, name: ptr char, maxLen: cint): bool {.importc: "SteamAPI_ISteamNetworkingSockets_GetConnectionName".}
proc sendMessageToConnection*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection, data: pointer, data2: uint32, sendFlags: cint, outMessageNumber: ptr int64): Result {.importc: "SteamAPI_ISteamNetworkingSockets_SendMessageToConnection".}
proc sendMessages*(self: ISteamNetworkingSockets, messages: cint, messages2: pointer, outMessageNumberOrResult: ptr int64) {.importc: "SteamAPI_ISteamNetworkingSockets_SendMessages".}
proc flushMessagesOnConnection*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection): Result {.importc: "SteamAPI_ISteamNetworkingSockets_FlushMessagesOnConnection".}
proc receiveMessagesOnConnection*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection, outMessages: ptr ptr SteamNetworkingMessage, maxMessages: cint): cint {.importc: "SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection".}
proc getConnectionInfo*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection, info: ptr SteamNetConnectionInfo): bool {.importc: "SteamAPI_ISteamNetworkingSockets_GetConnectionInfo".}
proc getConnectionRealTimeStatus*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection, status: ptr SteamNetConnectionRealTimeStatus, lanes: cint, lanes2: ptr SteamNetConnectionRealTimeLaneStatus): Result {.importc: "SteamAPI_ISteamNetworkingSockets_GetConnectionRealTimeStatus".}
proc getDetailedConnectionStatusRaw(self: ISteamNetworkingSockets, hConn: HSteamNetConnection, buf: ptr char, buf2: cint): cint {.importc: "SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus".}
proc getListenSocketAddress*(self: ISteamNetworkingSockets, hSocket: HSteamListenSocket, address: ptr SteamNetworkingIPAddr): bool {.importc: "SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress".}
proc createSocketPair*(self: ISteamNetworkingSockets, outConnection1: ptr HSteamNetConnection, outConnection2: ptr HSteamNetConnection, useNetworkLoopback: bool, identity1: ptr SteamNetworkingIdentity, identity2: ptr SteamNetworkingIdentity): bool {.importc: "SteamAPI_ISteamNetworkingSockets_CreateSocketPair".}
proc configureConnectionLanes*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection, numLanes: cint, lanePriorities: ptr cint, laneWeights: ptr uint16): Result {.importc: "SteamAPI_ISteamNetworkingSockets_ConfigureConnectionLanes".}
proc getIdentity*(self: ISteamNetworkingSockets, identity: ptr SteamNetworkingIdentity): bool {.importc: "SteamAPI_ISteamNetworkingSockets_GetIdentity".}
proc initAuthentication*(self: ISteamNetworkingSockets): NetworkingAvailability {.importc: "SteamAPI_ISteamNetworkingSockets_InitAuthentication".}
proc getAuthenticationStatus*(self: ISteamNetworkingSockets, details: ptr SteamNetAuthenticationStatus): NetworkingAvailability {.importc: "SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus".}
proc createPollGroup*(self: ISteamNetworkingSockets): HSteamNetPollGroup {.importc: "SteamAPI_ISteamNetworkingSockets_CreatePollGroup".}
proc destroyPollGroup*(self: ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup): bool {.importc: "SteamAPI_ISteamNetworkingSockets_DestroyPollGroup".}
proc setConnectionPollGroup*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup): bool {.importc: "SteamAPI_ISteamNetworkingSockets_SetConnectionPollGroup".}
proc receiveMessagesOnPollGroup*(self: ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup, outMessages: ptr ptr SteamNetworkingMessage, maxMessages: cint): cint {.importc: "SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup".}
proc receivedRelayAuthTicket*(self: ISteamNetworkingSockets, pvTicket: pointer, ticket: cint, outParsedTicket: pointer): bool {.importc: "SteamAPI_ISteamNetworkingSockets_ReceivedRelayAuthTicket".}
proc findRelayAuthTicketForServer*(self: ISteamNetworkingSockets, identityGameServer: ptr SteamNetworkingIdentity, remoteVirtualPort: cint, outParsedTicket: pointer): cint {.importc: "SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer".}
proc connectToHostedDedicatedServer*(self: ISteamNetworkingSockets, identityTarget: ptr SteamNetworkingIdentity, remoteVirtualPort: cint, options: cint, options2: ptr SteamNetworkingConfigValue): HSteamNetConnection {.importc: "SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer".}
proc getHostedDedicatedServerPort*(self: ISteamNetworkingSockets): uint16 {.importc: "SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPort".}
proc getHostedDedicatedServerPopid*(self: ISteamNetworkingSockets): SteamNetworkingPOPID {.importc: "SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPOPID".}
proc getHostedDedicatedServerAddress*(self: ISteamNetworkingSockets, routing: ptr SteamDatagramHostedAddress): Result {.importc: "SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerAddress".}
proc createHostedDedicatedServerListenSocket*(self: ISteamNetworkingSockets, localVirtualPort: cint, options: cint, options2: ptr SteamNetworkingConfigValue): HSteamListenSocket {.importc: "SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket".}
proc getGameCoordinatorServerLogin*(self: ISteamNetworkingSockets, loginInfo: ptr SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: ptr cint, blob: pointer): Result {.importc: "SteamAPI_ISteamNetworkingSockets_GetGameCoordinatorServerLogin".}
proc connectP2PcustomSignaling*(self: ISteamNetworkingSockets, signaling: pointer, peerIdentity: ptr SteamNetworkingIdentity, remoteVirtualPort: cint, options: cint, options2: ptr SteamNetworkingConfigValue): HSteamNetConnection {.importc: "SteamAPI_ISteamNetworkingSockets_ConnectP2PCustomSignaling".}
proc receivedP2PcustomSignal*(self: ISteamNetworkingSockets, msg: pointer, msg2: cint, context: pointer): bool {.importc: "SteamAPI_ISteamNetworkingSockets_ReceivedP2PCustomSignal".}
proc getCertificateRequest*(self: ISteamNetworkingSockets, pcbBlob: ptr cint, blob: pointer, errMsg: ptr SteamNetworkingErrMsg): bool {.importc: "SteamAPI_ISteamNetworkingSockets_GetCertificateRequest".}
proc setCertificate*(self: ISteamNetworkingSockets, certificate: pointer, certificate2: cint, errMsg: ptr SteamNetworkingErrMsg): bool {.importc: "SteamAPI_ISteamNetworkingSockets_SetCertificate".}
proc resetIdentity*(self: ISteamNetworkingSockets, identity: ptr SteamNetworkingIdentity) {.importc: "SteamAPI_ISteamNetworkingSockets_ResetIdentity".}
proc runCallbacks*(self: ISteamNetworkingSockets) {.importc: "SteamAPI_ISteamNetworkingSockets_RunCallbacks".}
proc beginAsyncRequestFakeIp*(self: ISteamNetworkingSockets, numPorts: cint): bool {.importc: "SteamAPI_ISteamNetworkingSockets_BeginAsyncRequestFakeIP".}
proc getFakeIp*(self: ISteamNetworkingSockets, idxFirstPort: cint, info: ptr SteamNetworkingFakeIPResult) {.importc: "SteamAPI_ISteamNetworkingSockets_GetFakeIP".}
proc createListenSocketP2PfakeIp*(self: ISteamNetworkingSockets, idxFakePort: cint, options: cint, options2: ptr SteamNetworkingConfigValue): HSteamListenSocket {.importc: "SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2PFakeIP".}
proc getRemoteFakeIpForConnection*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection, outAddr: ptr SteamNetworkingIPAddr): Result {.importc: "SteamAPI_ISteamNetworkingSockets_GetRemoteFakeIPForConnection".}
proc createFakeUdpPort*(self: ISteamNetworkingSockets, idxFakeServerPort: cint): ISteamNetworkingFakeUDPPort {.importc: "SteamAPI_ISteamNetworkingSockets_CreateFakeUDPPort".}

# ISteamNetworkingUtils
proc allocateMessage*(self: ISteamNetworkingUtils, allocateBuffer: cint): ptr SteamNetworkingMessage {.importc: "SteamAPI_ISteamNetworkingUtils_AllocateMessage".}
proc initRelayNetworkAccess*(self: ISteamNetworkingUtils) {.importc: "SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess".}
proc getRelayNetworkStatus*(self: ISteamNetworkingUtils, details: ptr SteamRelayNetworkStatus): NetworkingAvailability {.importc: "SteamAPI_ISteamNetworkingUtils_GetRelayNetworkStatus".}
proc getLocalPingLocation*(self: ISteamNetworkingUtils, resultValue: ptr SteamNetworkPingLocation): float32 {.importc: "SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation".}
proc estimatePingTimeBetweenTwoLocations*(self: ISteamNetworkingUtils, location1: ptr SteamNetworkPingLocation, location2: ptr SteamNetworkPingLocation): cint {.importc: "SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations".}
proc estimatePingTimeFromLocalHost*(self: ISteamNetworkingUtils, remoteLocation: ptr SteamNetworkPingLocation): cint {.importc: "SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost".}
proc convertPingLocationToStringRaw(self: ISteamNetworkingUtils, location: ptr SteamNetworkPingLocation, buf: ptr char, bufSize: cint) {.importc: "SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString".}
proc parsePingLocationStringRaw(self: ISteamNetworkingUtils, string: cstring, resultValue: ptr SteamNetworkPingLocation): bool {.importc: "SteamAPI_ISteamNetworkingUtils_ParsePingLocationString".}
proc checkPingDataUpToDate*(self: ISteamNetworkingUtils, maxAgeSeconds: float32): bool {.importc: "SteamAPI_ISteamNetworkingUtils_CheckPingDataUpToDate".}
proc getPingToDataCenter*(self: ISteamNetworkingUtils, popId: SteamNetworkingPOPID, viaRelayPoP: ptr SteamNetworkingPOPID): cint {.importc: "SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter".}
proc getDirectPingToPop*(self: ISteamNetworkingUtils, popId: SteamNetworkingPOPID): cint {.importc: "SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP".}
proc getPopCount*(self: ISteamNetworkingUtils): cint {.importc: "SteamAPI_ISteamNetworkingUtils_GetPOPCount".}
proc getPopList*(self: ISteamNetworkingUtils, list: ptr SteamNetworkingPOPID, listSz: cint): cint {.importc: "SteamAPI_ISteamNetworkingUtils_GetPOPList".}
proc getLocalTimestamp*(self: ISteamNetworkingUtils): SteamNetworkingMicroseconds {.importc: "SteamAPI_ISteamNetworkingUtils_GetLocalTimestamp".}
proc setDebugOutputFunction*(self: ISteamNetworkingUtils, detailLevel: NetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) {.importc: "SteamAPI_ISteamNetworkingUtils_SetDebugOutputFunction".}
proc isFakeIpv4*(self: ISteamNetworkingUtils, ipv4: uint32): bool {.importc: "SteamAPI_ISteamNetworkingUtils_IsFakeIPv4".}
proc getIpv4FakeIpType*(self: ISteamNetworkingUtils, ipv4: uint32): NetworkingFakeIPType {.importc: "SteamAPI_ISteamNetworkingUtils_GetIPv4FakeIPType".}
proc getRealIdentityForFakeIp*(self: ISteamNetworkingUtils, fakeIp: ptr SteamNetworkingIPAddr, outRealIdentity: ptr SteamNetworkingIdentity): Result {.importc: "SteamAPI_ISteamNetworkingUtils_GetRealIdentityForFakeIP".}
proc setGlobalConfigValueInt32*(self: ISteamNetworkingUtils, value: NetworkingConfigValue, val: int32): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueInt32".}
proc setGlobalConfigValueFloat*(self: ISteamNetworkingUtils, value: NetworkingConfigValue, val: float32): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueFloat".}
proc setGlobalConfigValueStringRaw(self: ISteamNetworkingUtils, value: NetworkingConfigValue, val: cstring): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueString".}
proc setGlobalConfigValuePtr*(self: ISteamNetworkingUtils, value: NetworkingConfigValue, val: pointer): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValuePtr".}
proc setConnectionConfigValueInt32*(self: ISteamNetworkingUtils, hConn: HSteamNetConnection, value: NetworkingConfigValue, val: int32): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueInt32".}
proc setConnectionConfigValueFloat*(self: ISteamNetworkingUtils, hConn: HSteamNetConnection, value: NetworkingConfigValue, val: float32): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueFloat".}
proc setConnectionConfigValueStringRaw(self: ISteamNetworkingUtils, hConn: HSteamNetConnection, value: NetworkingConfigValue, val: cstring): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueString".}
proc setGlobalCallbackSteamNetConnectionStatusChanged*(self: ISteamNetworkingUtils, fnCallback: FnSteamNetConnectionStatusChanged): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged".}
proc setGlobalCallbackSteamNetAuthenticationStatusChanged*(self: ISteamNetworkingUtils, fnCallback: FnSteamNetAuthenticationStatusChanged): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged".}
proc setGlobalCallbackSteamRelayNetworkStatusChanged*(self: ISteamNetworkingUtils, fnCallback: FnSteamRelayNetworkStatusChanged): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged".}
proc setGlobalCallbackFakeIpResult*(self: ISteamNetworkingUtils, fnCallback: FnSteamNetworkingFakeIPResult): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_FakeIPResult".}
proc setGlobalCallbackMessagesSessionRequest*(self: ISteamNetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionRequest): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionRequest".}
proc setGlobalCallbackMessagesSessionFailed*(self: ISteamNetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionFailed): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionFailed".}
proc setConfigValue*(self: ISteamNetworkingUtils, value: NetworkingConfigValue, scopeType: NetworkingConfigScope, scopeObj: int, dataType: NetworkingConfigDataType, arg: pointer): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetConfigValue".}
proc setConfigValueStruct*(self: ISteamNetworkingUtils, opt: ptr SteamNetworkingConfigValue, scopeType: NetworkingConfigScope, scopeObj: int): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct".}
proc getConfigValue*(self: ISteamNetworkingUtils, value: NetworkingConfigValue, scopeType: NetworkingConfigScope, scopeObj: int, outDataType: ptr NetworkingConfigDataType, resultValue: pointer, resultValue2: ptr csize_t): NetworkingGetConfigValueResult {.importc: "SteamAPI_ISteamNetworkingUtils_GetConfigValue".}
proc getConfigValueInfoRaw(self: ISteamNetworkingUtils, value: NetworkingConfigValue, outDataType: ptr NetworkingConfigDataType, outScope: ptr NetworkingConfigScope): cstring {.importc: "SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo".}
proc iterateGenericEditableConfigValues*(self: ISteamNetworkingUtils, current: NetworkingConfigValue, enumerateDevVars: bool): NetworkingConfigValue {.importc: "SteamAPI_ISteamNetworkingUtils_IterateGenericEditableConfigValues".}
proc steamNetworkingIpAddrToStringRaw(self: ISteamNetworkingUtils, addrValue: ptr SteamNetworkingIPAddr, buf: ptr char, buf2: uint32, withPort: bool) {.importc: "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString".}
proc steamNetworkingIpAddrParseStringRaw(self: ISteamNetworkingUtils, addrValue: ptr SteamNetworkingIPAddr, str: cstring): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ParseString".}
proc steamNetworkingIpAddrGetFakeIpType*(self: ISteamNetworkingUtils, addrValue: ptr SteamNetworkingIPAddr): NetworkingFakeIPType {.importc: "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType".}
proc steamNetworkingIdentityToStringRaw(self: ISteamNetworkingUtils, identity: ptr SteamNetworkingIdentity, buf: ptr char, buf2: uint32) {.importc: "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString".}
proc steamNetworkingIdentityParseStringRaw(self: ISteamNetworkingUtils, identity: ptr SteamNetworkingIdentity, str: cstring): bool {.importc: "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ParseString".}

# ISteamGameServer
proc setProductRaw(self: ISteamGameServer, product: cstring) {.importc: "SteamAPI_ISteamGameServer_SetProduct".}
proc setGameDescriptionRaw(self: ISteamGameServer, gameDescription: cstring) {.importc: "SteamAPI_ISteamGameServer_SetGameDescription".}
proc setModDirRaw(self: ISteamGameServer, modDir: cstring) {.importc: "SteamAPI_ISteamGameServer_SetModDir".}
proc setDedicatedServer*(self: ISteamGameServer, dedicated: bool) {.importc: "SteamAPI_ISteamGameServer_SetDedicatedServer".}
proc logOnRaw(self: ISteamGameServer, token: cstring) {.importc: "SteamAPI_ISteamGameServer_LogOn".}
proc logOnAnonymous*(self: ISteamGameServer) {.importc: "SteamAPI_ISteamGameServer_LogOnAnonymous".}
proc logOff*(self: ISteamGameServer) {.importc: "SteamAPI_ISteamGameServer_LogOff".}
proc loggedOn*(self: ISteamGameServer): bool {.importc: "SteamAPI_ISteamGameServer_BLoggedOn".}
proc secure*(self: ISteamGameServer): bool {.importc: "SteamAPI_ISteamGameServer_BSecure".}
proc getSteamId*(self: ISteamGameServer): SteamId {.importc: "SteamAPI_ISteamGameServer_GetSteamID".}
proc wasRestartRequested*(self: ISteamGameServer): bool {.importc: "SteamAPI_ISteamGameServer_WasRestartRequested".}
proc setMaxPlayerCount*(self: ISteamGameServer, playersMax: cint) {.importc: "SteamAPI_ISteamGameServer_SetMaxPlayerCount".}
proc setBotPlayerCount*(self: ISteamGameServer, botplayers: cint) {.importc: "SteamAPI_ISteamGameServer_SetBotPlayerCount".}
proc setServerNameRaw(self: ISteamGameServer, serverName: cstring) {.importc: "SteamAPI_ISteamGameServer_SetServerName".}
proc setMapNameRaw(self: ISteamGameServer, mapName: cstring) {.importc: "SteamAPI_ISteamGameServer_SetMapName".}
proc setPasswordProtected*(self: ISteamGameServer, passwordProtected: bool) {.importc: "SteamAPI_ISteamGameServer_SetPasswordProtected".}
proc setSpectatorPort*(self: ISteamGameServer, spectatorPort: uint16) {.importc: "SteamAPI_ISteamGameServer_SetSpectatorPort".}
proc setSpectatorServerNameRaw(self: ISteamGameServer, spectatorServerName: cstring) {.importc: "SteamAPI_ISteamGameServer_SetSpectatorServerName".}
proc clearAllKeyValues*(self: ISteamGameServer) {.importc: "SteamAPI_ISteamGameServer_ClearAllKeyValues".}
proc setKeyValueRaw(self: ISteamGameServer, key: cstring, value: cstring) {.importc: "SteamAPI_ISteamGameServer_SetKeyValue".}
proc setGameTagsRaw(self: ISteamGameServer, gameTags: cstring) {.importc: "SteamAPI_ISteamGameServer_SetGameTags".}
proc setGameDataRaw(self: ISteamGameServer, gameData: cstring) {.importc: "SteamAPI_ISteamGameServer_SetGameData".}
proc setRegionRaw(self: ISteamGameServer, region: cstring) {.importc: "SteamAPI_ISteamGameServer_SetRegion".}
proc setAdvertiseServerActive*(self: ISteamGameServer, active: bool) {.importc: "SteamAPI_ISteamGameServer_SetAdvertiseServerActive".}
proc getAuthSessionTicket*(self: ISteamGameServer, ticket: pointer, maxTicket: cint, pcbTicket: ptr uint32, snid: ptr SteamNetworkingIdentity): HAuthTicket {.importc: "SteamAPI_ISteamGameServer_GetAuthSessionTicket".}
proc beginAuthSession*(self: ISteamGameServer, authTicket: pointer, authTicket2: cint, steamId: SteamId): BeginAuthSessionResult {.importc: "SteamAPI_ISteamGameServer_BeginAuthSession".}
proc endAuthSession*(self: ISteamGameServer, steamId: SteamId) {.importc: "SteamAPI_ISteamGameServer_EndAuthSession".}
proc cancelAuthTicket*(self: ISteamGameServer, hAuthTicket: HAuthTicket) {.importc: "SteamAPI_ISteamGameServer_CancelAuthTicket".}
proc userHasLicenseForApp*(self: ISteamGameServer, steamId: SteamId, appId: AppId): UserHasLicenseForAppResult {.importc: "SteamAPI_ISteamGameServer_UserHasLicenseForApp".}
proc requestUserGroupStatus*(self: ISteamGameServer, steamIdUser: SteamId, steamIdGroup: SteamId): bool {.importc: "SteamAPI_ISteamGameServer_RequestUserGroupStatus".}
proc getGameplayStats*(self: ISteamGameServer) {.importc: "SteamAPI_ISteamGameServer_GetGameplayStats".}
proc getServerReputation*(self: ISteamGameServer): SteamAPICall {.importc: "SteamAPI_ISteamGameServer_GetServerReputation".}
proc getPublicIp*(self: ISteamGameServer): SteamIPAddress {.importc: "SteamAPI_ISteamGameServer_GetPublicIP".}
proc handleIncomingPacket*(self: ISteamGameServer, data: pointer, data2: cint, srcIp: uint32, srcPort: uint16): bool {.importc: "SteamAPI_ISteamGameServer_HandleIncomingPacket".}
proc getNextOutgoingPacket*(self: ISteamGameServer, outValue: pointer, maxOut: cint, netAdr: ptr uint32, port: ptr uint16): cint {.importc: "SteamAPI_ISteamGameServer_GetNextOutgoingPacket".}
proc associateWithClan*(self: ISteamGameServer, steamIdClan: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamGameServer_AssociateWithClan".}
proc computeNewPlayerCompatibility*(self: ISteamGameServer, steamIdNewPlayer: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility".}
proc sendUserConnectAndAuthenticateDeprecated*(self: ISteamGameServer, ipClient: uint32, pvAuthBlob: pointer, authBlobSize: uint32, steamIdUser: ptr SteamId): bool {.importc: "SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate_DEPRECATED".}
proc createUnauthenticatedUserConnection*(self: ISteamGameServer): SteamId {.importc: "SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection".}
proc sendUserDisconnectDeprecated*(self: ISteamGameServer, steamIdUser: SteamId) {.importc: "SteamAPI_ISteamGameServer_SendUserDisconnect_DEPRECATED".}
proc updateUserDataRaw(self: ISteamGameServer, steamIdUser: SteamId, playerName: cstring, score: uint32): bool {.importc: "SteamAPI_ISteamGameServer_BUpdateUserData".}

# ISteamGameServerStats
proc requestUserStats*(self: ISteamGameServerStats, steamIdUser: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamGameServerStats_RequestUserStats".}
proc getUserStatRaw(self: ISteamGameServerStats, steamIdUser: SteamId, name: cstring, data: ptr int32): bool {.importc: "SteamAPI_ISteamGameServerStats_GetUserStatInt32".}
proc getUserStatRaw(self: ISteamGameServerStats, steamIdUser: SteamId, name: cstring, data: ptr float32): bool {.importc: "SteamAPI_ISteamGameServerStats_GetUserStatFloat".}
proc getUserAchievementRaw(self: ISteamGameServerStats, steamIdUser: SteamId, name: cstring, achieved: ptr bool): bool {.importc: "SteamAPI_ISteamGameServerStats_GetUserAchievement".}
proc setUserStatRaw(self: ISteamGameServerStats, steamIdUser: SteamId, name: cstring, data: int32): bool {.importc: "SteamAPI_ISteamGameServerStats_SetUserStatInt32".}
proc setUserStatRaw(self: ISteamGameServerStats, steamIdUser: SteamId, name: cstring, fData: float32): bool {.importc: "SteamAPI_ISteamGameServerStats_SetUserStatFloat".}
proc updateUserAvgRateStatRaw(self: ISteamGameServerStats, steamIdUser: SteamId, name: cstring, countThisSession: float32, dSessionLength: float64): bool {.importc: "SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat".}
proc setUserAchievementRaw(self: ISteamGameServerStats, steamIdUser: SteamId, name: cstring): bool {.importc: "SteamAPI_ISteamGameServerStats_SetUserAchievement".}
proc clearUserAchievementRaw(self: ISteamGameServerStats, steamIdUser: SteamId, name: cstring): bool {.importc: "SteamAPI_ISteamGameServerStats_ClearUserAchievement".}
proc storeUserStats*(self: ISteamGameServerStats, steamIdUser: SteamId): SteamAPICall {.importc: "SteamAPI_ISteamGameServerStats_StoreUserStats".}

# ISteamNetworkingFakeUDPPort
proc destroyFakeUdpPort*(self: ISteamNetworkingFakeUDPPort) {.importc: "SteamAPI_ISteamNetworkingFakeUDPPort_DestroyFakeUDPPort".}
proc sendMessageToFakeIp*(self: ISteamNetworkingFakeUDPPort, remoteAddress: ptr SteamNetworkingIPAddr, data: pointer, data2: uint32, sendFlags: cint): Result {.importc: "SteamAPI_ISteamNetworkingFakeUDPPort_SendMessageToFakeIP".}
proc receiveMessages*(self: ISteamNetworkingFakeUDPPort, outMessages: ptr ptr SteamNetworkingMessage, maxMessages: cint): cint {.importc: "SteamAPI_ISteamNetworkingFakeUDPPort_ReceiveMessages".}
proc scheduleCleanup*(self: ISteamNetworkingFakeUDPPort, remoteAddress: ptr SteamNetworkingIPAddr) {.importc: "SteamAPI_ISteamNetworkingFakeUDPPort_ScheduleCleanup".}
# SteamIPAddress
proc isSet*(self: ptr SteamIPAddress): bool {.importc: "SteamAPI_SteamIPAddress_t_IsSet".}

# MatchMakingKeyValuePair
proc construct*(self: ptr MatchMakingKeyValuePair) {.importc: "SteamAPI_MatchMakingKeyValuePair_t_Construct".}

# ServerNetAdr
proc construct*(self: ptr ServerNetAdr) {.importc: "SteamAPI_servernetadr_t_Construct".}
proc init*(self: ptr ServerNetAdr, ip: uint32, queryPort: uint16, connectionPort: uint16) {.importc: "SteamAPI_servernetadr_t_Init".}
proc getQueryPort*(self: ptr ServerNetAdr): uint16 {.importc: "SteamAPI_servernetadr_t_GetQueryPort".}
proc setQueryPort*(self: ptr ServerNetAdr, port: uint16) {.importc: "SteamAPI_servernetadr_t_SetQueryPort".}
proc getConnectionPort*(self: ptr ServerNetAdr): uint16 {.importc: "SteamAPI_servernetadr_t_GetConnectionPort".}
proc setConnectionPort*(self: ptr ServerNetAdr, port: uint16) {.importc: "SteamAPI_servernetadr_t_SetConnectionPort".}
proc getIp*(self: ptr ServerNetAdr): uint32 {.importc: "SteamAPI_servernetadr_t_GetIP".}
proc setIp*(self: ptr ServerNetAdr, ip: uint32) {.importc: "SteamAPI_servernetadr_t_SetIP".}
proc getConnectionAddressStringRaw(self: ptr ServerNetAdr): cstring {.importc: "SteamAPI_servernetadr_t_GetConnectionAddressString".}
proc getQueryAddressStringRaw(self: ptr ServerNetAdr): cstring {.importc: "SteamAPI_servernetadr_t_GetQueryAddressString".}
proc isLessThan*(self: ptr ServerNetAdr, netadr: ptr ServerNetAdr): bool {.importc: "SteamAPI_servernetadr_t_IsLessThan".}
proc assign*(self: ptr ServerNetAdr, that: ptr ServerNetAdr) {.importc: "SteamAPI_servernetadr_t_Assign".}

# GameServerItem
proc construct*(self: ptr GameServerItem) {.importc: "SteamAPI_gameserveritem_t_Construct".}
proc getNameRaw(self: ptr GameServerItem): cstring {.importc: "SteamAPI_gameserveritem_t_GetName".}
proc setNameRaw(self: ptr GameServerItem, name: cstring) {.importc: "SteamAPI_gameserveritem_t_SetName".}

# SteamNetworkingIPAddr
proc clear*(self: ptr SteamNetworkingIPAddr) {.importc: "SteamAPI_SteamNetworkingIPAddr_Clear".}
proc isIpv6AllZeros*(self: ptr SteamNetworkingIPAddr): bool {.importc: "SteamAPI_SteamNetworkingIPAddr_IsIPv6AllZeros".}
proc setIpv6*(self: ptr SteamNetworkingIPAddr, ipv6: ptr uint8, port: uint16) {.importc: "SteamAPI_SteamNetworkingIPAddr_SetIPv6".}
proc setIpv4*(self: ptr SteamNetworkingIPAddr, ip: uint32, port: uint16) {.importc: "SteamAPI_SteamNetworkingIPAddr_SetIPv4".}
proc isIpv4*(self: ptr SteamNetworkingIPAddr): bool {.importc: "SteamAPI_SteamNetworkingIPAddr_IsIPv4".}
proc getIpv4*(self: ptr SteamNetworkingIPAddr): uint32 {.importc: "SteamAPI_SteamNetworkingIPAddr_GetIPv4".}
proc setIpv6LocalHost*(self: ptr SteamNetworkingIPAddr, port: uint16) {.importc: "SteamAPI_SteamNetworkingIPAddr_SetIPv6LocalHost".}
proc isLocalHost*(self: ptr SteamNetworkingIPAddr): bool {.importc: "SteamAPI_SteamNetworkingIPAddr_IsLocalHost".}
proc toStringRaw(self: ptr SteamNetworkingIPAddr, buf: ptr char, buf2: uint32, withPort: bool) {.importc: "SteamAPI_SteamNetworkingIPAddr_ToString".}
proc parseStringRaw(self: ptr SteamNetworkingIPAddr, str: cstring): bool {.importc: "SteamAPI_SteamNetworkingIPAddr_ParseString".}
proc isEqualTo*(self: ptr SteamNetworkingIPAddr, x: ptr SteamNetworkingIPAddr): bool {.importc: "SteamAPI_SteamNetworkingIPAddr_IsEqualTo".}
proc getFakeIpType*(self: ptr SteamNetworkingIPAddr): NetworkingFakeIPType {.importc: "SteamAPI_SteamNetworkingIPAddr_GetFakeIPType".}
proc isFakeIp*(self: ptr SteamNetworkingIPAddr): bool {.importc: "SteamAPI_SteamNetworkingIPAddr_IsFakeIP".}

# SteamNetworkingIdentity
proc clear*(self: ptr SteamNetworkingIdentity) {.importc: "SteamAPI_SteamNetworkingIdentity_Clear".}
proc isInvalid*(self: ptr SteamNetworkingIdentity): bool {.importc: "SteamAPI_SteamNetworkingIdentity_IsInvalid".}
proc setSteamId*(self: ptr SteamNetworkingIdentity, steamId: SteamId) {.importc: "SteamAPI_SteamNetworkingIdentity_SetSteamID".}
proc getSteamId*(self: ptr SteamNetworkingIdentity): SteamId {.importc: "SteamAPI_SteamNetworkingIdentity_GetSteamID".}
proc setSteamId64*(self: ptr SteamNetworkingIdentity, steamId: uint64) {.importc: "SteamAPI_SteamNetworkingIdentity_SetSteamID64".}
proc getSteamId64*(self: ptr SteamNetworkingIdentity): uint64 {.importc: "SteamAPI_SteamNetworkingIdentity_GetSteamID64".}
proc setXboxPairwiseIdRaw(self: ptr SteamNetworkingIdentity, string: cstring): bool {.importc: "SteamAPI_SteamNetworkingIdentity_SetXboxPairwiseID".}
proc getXboxPairwiseIdRaw(self: ptr SteamNetworkingIdentity): cstring {.importc: "SteamAPI_SteamNetworkingIdentity_GetXboxPairwiseID".}
proc setPsnid*(self: ptr SteamNetworkingIdentity, id: uint64) {.importc: "SteamAPI_SteamNetworkingIdentity_SetPSNID".}
proc getPsnid*(self: ptr SteamNetworkingIdentity): uint64 {.importc: "SteamAPI_SteamNetworkingIdentity_GetPSNID".}
proc setIpAddr*(self: ptr SteamNetworkingIdentity, addrValue: ptr SteamNetworkingIPAddr) {.importc: "SteamAPI_SteamNetworkingIdentity_SetIPAddr".}
proc getIpAddr*(self: ptr SteamNetworkingIdentity): ptr SteamNetworkingIPAddr {.importc: "SteamAPI_SteamNetworkingIdentity_GetIPAddr".}
proc setIpv4Addr*(self: ptr SteamNetworkingIdentity, ipv4: uint32, port: uint16) {.importc: "SteamAPI_SteamNetworkingIdentity_SetIPv4Addr".}
proc getIpv4*(self: ptr SteamNetworkingIdentity): uint32 {.importc: "SteamAPI_SteamNetworkingIdentity_GetIPv4".}
proc getFakeIpType*(self: ptr SteamNetworkingIdentity): NetworkingFakeIPType {.importc: "SteamAPI_SteamNetworkingIdentity_GetFakeIPType".}
proc isFakeIp*(self: ptr SteamNetworkingIdentity): bool {.importc: "SteamAPI_SteamNetworkingIdentity_IsFakeIP".}
proc setLocalHost*(self: ptr SteamNetworkingIdentity) {.importc: "SteamAPI_SteamNetworkingIdentity_SetLocalHost".}
proc isLocalHost*(self: ptr SteamNetworkingIdentity): bool {.importc: "SteamAPI_SteamNetworkingIdentity_IsLocalHost".}
proc setGenericStringRaw(self: ptr SteamNetworkingIdentity, string: cstring): bool {.importc: "SteamAPI_SteamNetworkingIdentity_SetGenericString".}
proc getGenericStringRaw(self: ptr SteamNetworkingIdentity): cstring {.importc: "SteamAPI_SteamNetworkingIdentity_GetGenericString".}
proc setGenericBytes*(self: ptr SteamNetworkingIdentity, data: pointer, len: uint32): bool {.importc: "SteamAPI_SteamNetworkingIdentity_SetGenericBytes".}
proc getGenericBytes*(self: ptr SteamNetworkingIdentity, len: ptr cint): ptr uint8 {.importc: "SteamAPI_SteamNetworkingIdentity_GetGenericBytes".}
proc isEqualTo*(self: ptr SteamNetworkingIdentity, x: ptr SteamNetworkingIdentity): bool {.importc: "SteamAPI_SteamNetworkingIdentity_IsEqualTo".}
proc toStringRaw(self: ptr SteamNetworkingIdentity, buf: ptr char, buf2: uint32) {.importc: "SteamAPI_SteamNetworkingIdentity_ToString".}
proc parseStringRaw(self: ptr SteamNetworkingIdentity, str: cstring): bool {.importc: "SteamAPI_SteamNetworkingIdentity_ParseString".}

# SteamNetworkingMessage
proc release*(self: ptr SteamNetworkingMessage) {.importc: "SteamAPI_SteamNetworkingMessage_t_Release".}

# SteamNetworkingConfigValue
proc setInt32*(self: ptr SteamNetworkingConfigValue, val: NetworkingConfigValue, data: int32) {.importc: "SteamAPI_SteamNetworkingConfigValue_t_SetInt32".}
proc setInt64*(self: ptr SteamNetworkingConfigValue, val: NetworkingConfigValue, data: int64) {.importc: "SteamAPI_SteamNetworkingConfigValue_t_SetInt64".}
proc setFloat*(self: ptr SteamNetworkingConfigValue, val: NetworkingConfigValue, data: float32) {.importc: "SteamAPI_SteamNetworkingConfigValue_t_SetFloat".}
proc setPtr*(self: ptr SteamNetworkingConfigValue, val: NetworkingConfigValue, data: pointer) {.importc: "SteamAPI_SteamNetworkingConfigValue_t_SetPtr".}
proc setStringRaw(self: ptr SteamNetworkingConfigValue, val: NetworkingConfigValue, data: cstring) {.importc: "SteamAPI_SteamNetworkingConfigValue_t_SetString".}

# SteamDatagramHostedAddress
proc clear*(self: ptr SteamDatagramHostedAddress) {.importc: "SteamAPI_SteamDatagramHostedAddress_Clear".}
proc getPopId*(self: ptr SteamDatagramHostedAddress): SteamNetworkingPOPID {.importc: "SteamAPI_SteamDatagramHostedAddress_GetPopID".}
proc setDevAddress*(self: ptr SteamDatagramHostedAddress, ip: uint32, port: uint16, popid: SteamNetworkingPOPID) {.importc: "SteamAPI_SteamDatagramHostedAddress_SetDevAddress".}
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


proc getPersonaName*(self: ISteamFriends): string =
  steamString(self.getPersonaNameRaw())

proc getFriendPersonaName*(self: ISteamFriends, steamIdFriend: SteamId): string =
  steamString(self.getFriendPersonaNameRaw(steamIdFriend))

proc getFriendPersonaNameHistory*(self: ISteamFriends, steamIdFriend: SteamId, personaName: int): string =
  steamString(self.getFriendPersonaNameHistoryRaw(steamIdFriend, personaName.cint))

proc getPlayerNickname*(self: ISteamFriends, steamIdPlayer: SteamId): string =
  steamString(self.getPlayerNicknameRaw(steamIdPlayer))

proc getFriendsGroupName*(self: ISteamFriends, friendsGroupId: FriendsGroupID): string =
  steamString(self.getFriendsGroupNameRaw(friendsGroupId))

proc getClanName*(self: ISteamFriends, steamIdClan: SteamId): string =
  steamString(self.getClanNameRaw(steamIdClan))

proc getClanTag*(self: ISteamFriends, steamIdClan: SteamId): string =
  steamString(self.getClanTagRaw(steamIdClan))

proc getFriendRichPresence*(self: ISteamFriends, steamIdFriend: SteamId, key: string): string =
  steamString(self.getFriendRichPresenceRaw(steamIdFriend, key.cstring))

proc getFriendRichPresenceKeyByIndex*(self: ISteamFriends, steamIdFriend: SteamId, key: int): string =
  steamString(self.getFriendRichPresenceKeyByIndexRaw(steamIdFriend, key.cint))

proc getProfileItemPropertyString*(self: ISteamFriends, steamId: SteamId, itemType: CommunityProfileItemType, prop: CommunityProfileItemProperty): string =
  steamString(self.getProfileItemPropertyStringRaw(steamId, itemType, prop))

proc getIpCountry*(self: ISteamUtils): string =
  steamString(self.getIpCountryRaw())

proc getSteamUiLanguage*(self: ISteamUtils): string =
  steamString(self.getSteamUiLanguageRaw())

proc getLobbyData*(self: ISteamMatchmaking, steamIdLobby: SteamId, key: string): string =
  steamString(self.getLobbyDataRaw(steamIdLobby, key.cstring))

proc getLobbyMemberData*(self: ISteamMatchmaking, steamIdLobby: SteamId, steamIdUser: SteamId, key: string): string =
  steamString(self.getLobbyMemberDataRaw(steamIdLobby, steamIdUser, key.cstring))

proc getFileNameAndSize*(self: ISteamRemoteStorage, file: int, fileSizeInBytes: ptr int32): string =
  steamString(self.getFileNameAndSizeRaw(file.cint, fileSizeInBytes))

proc getLocalFileChange*(self: ISteamRemoteStorage, file: int, echangeType: ptr RemoteStorageLocalFileChange, efilePathType: ptr RemoteStorageFilePathType): string =
  steamString(self.getLocalFileChangeRaw(file.cint, echangeType, efilePathType))

proc getAchievementDisplayAttribute*(self: ISteamUserStats, name: string, key: string): string =
  steamString(self.getAchievementDisplayAttributeRaw(name.cstring, key.cstring))

proc getAchievementName*(self: ISteamUserStats, achievement: uint32): string =
  steamString(self.getAchievementNameRaw(achievement))

proc getLeaderboardName*(self: ISteamUserStats, hSteamLeaderboard: SteamLeaderboard): string =
  steamString(self.getLeaderboardNameRaw(hSteamLeaderboard))

proc getCurrentGameLanguage*(self: ISteamApps): string =
  steamString(self.getCurrentGameLanguageRaw())

proc getAvailableGameLanguages*(self: ISteamApps): string =
  steamString(self.getAvailableGameLanguagesRaw())

proc getLaunchQueryParam*(self: ISteamApps, key: string): string =
  steamString(self.getLaunchQueryParamRaw(key.cstring))

proc getStringForDigitalActionName*(self: ISteamInput, actionHandle: InputDigitalActionHandle): string =
  steamString(self.getStringForDigitalActionNameRaw(actionHandle))

proc getGlyphPngForActionOrigin*(self: ISteamInput, origin: InputActionOrigin, size: InputGlyphSize, flags: uint32): string =
  steamString(self.getGlyphPngForActionOriginRaw(origin, size, flags))

proc getGlyphSvgForActionOrigin*(self: ISteamInput, origin: InputActionOrigin, flags: uint32): string =
  steamString(self.getGlyphSvgForActionOriginRaw(origin, flags))

proc getGlyphForActionOriginLegacy*(self: ISteamInput, origin: InputActionOrigin): string =
  steamString(self.getGlyphForActionOriginLegacyRaw(origin))

proc getStringForActionOrigin*(self: ISteamInput, origin: InputActionOrigin): string =
  steamString(self.getStringForActionOriginRaw(origin))

proc getStringForAnalogActionName*(self: ISteamInput, actionHandle: InputAnalogActionHandle): string =
  steamString(self.getStringForAnalogActionNameRaw(actionHandle))

proc getStringForXboxOrigin*(self: ISteamInput, origin: XboxOrigin): string =
  steamString(self.getStringForXboxOriginRaw(origin))

proc getGlyphForXboxOrigin*(self: ISteamInput, origin: XboxOrigin): string =
  steamString(self.getGlyphForXboxOriginRaw(origin))

proc getGlyphForActionOrigin*(self: ISteamController, origin: ControllerActionOrigin): string =
  steamString(self.getGlyphForActionOriginRaw(origin))

proc getStringForActionOrigin*(self: ISteamController, origin: ControllerActionOrigin): string =
  steamString(self.getStringForActionOriginRaw(origin))

proc getStringForXboxOrigin*(self: ISteamController, origin: XboxOrigin): string =
  steamString(self.getStringForXboxOriginRaw(origin))

proc getGlyphForXboxOrigin*(self: ISteamController, origin: XboxOrigin): string =
  steamString(self.getGlyphForXboxOriginRaw(origin))

proc getSessionClientName*(self: ISteamRemotePlay, sessionId: RemotePlaySessionID): string =
  steamString(self.getSessionClientNameRaw(sessionId))

proc getConfigValueInfo*(self: ISteamNetworkingUtils, value: NetworkingConfigValue, outDataType: ptr NetworkingConfigDataType, outScope: ptr NetworkingConfigScope): string =
  steamString(self.getConfigValueInfoRaw(value, outDataType, outScope))

proc getConnectionAddressString*(self: ptr ServerNetAdr): string =
  steamString(self.getConnectionAddressStringRaw())

proc getQueryAddressString*(self: ptr ServerNetAdr): string =
  steamString(self.getQueryAddressStringRaw())

proc getName*(self: ptr GameServerItem): string =
  steamString(self.getNameRaw())

proc getXboxPairwiseId*(self: ptr SteamNetworkingIdentity): string =
  steamString(self.getXboxPairwiseIdRaw())

proc getGenericString*(self: ptr SteamNetworkingIdentity): string =
  steamString(self.getGenericStringRaw())
proc getIsteamUser*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamUser =
  self.getIsteamUserRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamGameServer*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamGameServer =
  self.getIsteamGameServerRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamFriends*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamFriends =
  self.getIsteamFriendsRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamUtils*(self: ISteamClient, hSteamPipe: HSteamPipe, version: string): ISteamUtils =
  self.getIsteamUtilsRaw(hSteamPipe, version.cstring)

proc getIsteamMatchmaking*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamMatchmaking =
  self.getIsteamMatchmakingRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamMatchmakingServers*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamMatchmakingServers =
  self.getIsteamMatchmakingServersRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamGenericInterface*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): pointer =
  self.getIsteamGenericInterfaceRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamUserStats*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamUserStats =
  self.getIsteamUserStatsRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamGameServerStats*(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamGameServerStats =
  self.getIsteamGameServerStatsRaw(hSteamuser, hSteamPipe, version.cstring)

proc getIsteamApps*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamApps =
  self.getIsteamAppsRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamNetworking*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamNetworking =
  self.getIsteamNetworkingRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamRemoteStorage*(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamRemoteStorage =
  self.getIsteamRemoteStorageRaw(hSteamuser, hSteamPipe, version.cstring)

proc getIsteamScreenshots*(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamScreenshots =
  self.getIsteamScreenshotsRaw(hSteamuser, hSteamPipe, version.cstring)

proc getIsteamHttp*(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamHTTP =
  self.getIsteamHttpRaw(hSteamuser, hSteamPipe, version.cstring)

proc getIsteamController*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamController =
  self.getIsteamControllerRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamUgc*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamUGC =
  self.getIsteamUgcRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamMusic*(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamMusic =
  self.getIsteamMusicRaw(hSteamuser, hSteamPipe, version.cstring)

proc getIsteamHtmlSurface*(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamHTMLSurface =
  self.getIsteamHtmlSurfaceRaw(hSteamuser, hSteamPipe, version.cstring)

proc getIsteamInventory*(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamInventory =
  self.getIsteamInventoryRaw(hSteamuser, hSteamPipe, version.cstring)

proc getIsteamVideo*(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamVideo =
  self.getIsteamVideoRaw(hSteamuser, hSteamPipe, version.cstring)

proc getIsteamParentalSettings*(self: ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamParentalSettings =
  self.getIsteamParentalSettingsRaw(hSteamuser, hSteamPipe, version.cstring)

proc getIsteamInput*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamInput =
  self.getIsteamInputRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamParties*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamParties =
  self.getIsteamPartiesRaw(hSteamUser, hSteamPipe, version.cstring)

proc getIsteamRemotePlay*(self: ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, version: string): ISteamRemotePlay =
  self.getIsteamRemotePlayRaw(hSteamUser, hSteamPipe, version.cstring)

proc trackAppUsageEvent*(self: ISteamUser, gameId: GameId, appUsageEvent: int, extraInfo: string) =
  self.trackAppUsageEventRaw(gameId, appUsageEvent.cint, extraInfo.cstring)

proc getAuthTicketForWebApi*(self: ISteamUser, identity: string): HAuthTicket =
  self.getAuthTicketForWebApiRaw(identity.cstring)

proc requestStoreAuthUrl*(self: ISteamUser, redirectUrl: string): SteamAPICall =
  self.requestStoreAuthUrlRaw(redirectUrl.cstring)

proc activateGameOverlay*(self: ISteamFriends, dialog: string) =
  self.activateGameOverlayRaw(dialog.cstring)

proc activateGameOverlayToUser*(self: ISteamFriends, dialog: string, steamId: SteamId) =
  self.activateGameOverlayToUserRaw(dialog.cstring, steamId)

proc activateGameOverlayToWebPage*(self: ISteamFriends, url: string, mode: ActivateGameOverlayToWebPageMode) =
  self.activateGameOverlayToWebPageRaw(url.cstring, mode)

proc setRichPresence*(self: ISteamFriends, key: string, value: string): bool =
  self.setRichPresenceRaw(key.cstring, value.cstring)

proc inviteUserToGame*(self: ISteamFriends, steamIdFriend: SteamId, connectString: string): bool =
  self.inviteUserToGameRaw(steamIdFriend, connectString.cstring)

proc sendClanChatMessage*(self: ISteamFriends, steamIdClanChat: SteamId, text: string): bool =
  self.sendClanChatMessageRaw(steamIdClanChat, text.cstring)

proc replyToFriendMessage*(self: ISteamFriends, steamIdFriend: SteamId, msgToSend: string): bool =
  self.replyToFriendMessageRaw(steamIdFriend, msgToSend.cstring)

proc registerProtocolInOverlayBrowser*(self: ISteamFriends, protocol: string): bool =
  self.registerProtocolInOverlayBrowserRaw(protocol.cstring)

proc activateGameOverlayInviteDialogConnectString*(self: ISteamFriends, connectString: string) =
  self.activateGameOverlayInviteDialogConnectStringRaw(connectString.cstring)

proc checkFileSignature*(self: ISteamUtils, fileName: string): SteamAPICall =
  self.checkFileSignatureRaw(fileName.cstring)

proc showGamepadTextInput*(self: ISteamUtils, inputMode: GamepadTextInputMode, lineInputMode: GamepadTextInputLineMode, description: string, charMax: uint32, existingText: string): bool =
  self.showGamepadTextInputRaw(inputMode, lineInputMode, description.cstring, charMax, existingText.cstring)

proc addRequestLobbyListStringFilter*(self: ISteamMatchmaking, keyToMatch: string, valueToMatch: string, comparisonType: LobbyComparison) =
  self.addRequestLobbyListStringFilterRaw(keyToMatch.cstring, valueToMatch.cstring, comparisonType)

proc addRequestLobbyListNumericalFilter*(self: ISteamMatchmaking, keyToMatch: string, valueToMatch: int, comparisonType: LobbyComparison) =
  self.addRequestLobbyListNumericalFilterRaw(keyToMatch.cstring, valueToMatch.cint, comparisonType)

proc addRequestLobbyListNearValueFilter*(self: ISteamMatchmaking, keyToMatch: string, valueToBeCloseTo: int) =
  self.addRequestLobbyListNearValueFilterRaw(keyToMatch.cstring, valueToBeCloseTo.cint)

proc setLobbyData*(self: ISteamMatchmaking, steamIdLobby: SteamId, key: string, value: string): bool =
  self.setLobbyDataRaw(steamIdLobby, key.cstring, value.cstring)

proc deleteLobbyData*(self: ISteamMatchmaking, steamIdLobby: SteamId, key: string): bool =
  self.deleteLobbyDataRaw(steamIdLobby, key.cstring)

proc setLobbyMemberData*(self: ISteamMatchmaking, steamIdLobby: SteamId, key: string, value: string) =
  self.setLobbyMemberDataRaw(steamIdLobby, key.cstring, value.cstring)

proc addPlayerToList*(self: ISteamMatchmakingPlayersResponse, name: string, score: int, timePlayed: float32) =
  self.addPlayerToListRaw(name.cstring, score.cint, timePlayed)

proc rulesResponded*(self: ISteamMatchmakingRulesResponse, rule: string, value: string) =
  self.rulesRespondedRaw(rule.cstring, value.cstring)

proc createBeacon*(self: ISteamParties, openSlots: uint32, beaconLocation: ptr SteamPartyBeaconLocation, connectString: string, metadata: string): SteamAPICall =
  self.createBeaconRaw(openSlots, beaconLocation, connectString.cstring, metadata.cstring)

proc fileWrite*(self: ISteamRemoteStorage, file: string, pvData: pointer, data: int32): bool =
  self.fileWriteRaw(file.cstring, pvData, data)

proc fileRead*(self: ISteamRemoteStorage, file: string, pvData: pointer, dataToRead: int32): int32 =
  self.fileReadRaw(file.cstring, pvData, dataToRead)

proc fileWriteAsync*(self: ISteamRemoteStorage, file: string, pvData: pointer, data: uint32): SteamAPICall =
  self.fileWriteAsyncRaw(file.cstring, pvData, data)

proc fileReadAsync*(self: ISteamRemoteStorage, file: string, offset: uint32, toRead: uint32): SteamAPICall =
  self.fileReadAsyncRaw(file.cstring, offset, toRead)

proc fileForget*(self: ISteamRemoteStorage, file: string): bool =
  self.fileForgetRaw(file.cstring)

proc fileDelete*(self: ISteamRemoteStorage, file: string): bool =
  self.fileDeleteRaw(file.cstring)

proc fileShare*(self: ISteamRemoteStorage, file: string): SteamAPICall =
  self.fileShareRaw(file.cstring)

proc setSyncPlatforms*(self: ISteamRemoteStorage, file: string, remoteStoragePlatform: RemoteStoragePlatform): bool =
  self.setSyncPlatformsRaw(file.cstring, remoteStoragePlatform)

proc fileWriteStreamOpen*(self: ISteamRemoteStorage, file: string): UGCFileWriteStreamHandle =
  self.fileWriteStreamOpenRaw(file.cstring)

proc fileExists*(self: ISteamRemoteStorage, file: string): bool =
  self.fileExistsRaw(file.cstring)

proc filePersisted*(self: ISteamRemoteStorage, file: string): bool =
  self.filePersistedRaw(file.cstring)

proc getFileSize*(self: ISteamRemoteStorage, file: string): int32 =
  self.getFileSizeRaw(file.cstring)

proc getFileTimestamp*(self: ISteamRemoteStorage, file: string): int64 =
  self.getFileTimestampRaw(file.cstring)

proc getSyncPlatforms*(self: ISteamRemoteStorage, file: string): RemoteStoragePlatform =
  self.getSyncPlatformsRaw(file.cstring)

proc publishWorkshopFile*(self: ISteamRemoteStorage, file: string, previewFile: string, consumerAppId: AppId, title: string, description: string, visibility: RemoteStoragePublishedFileVisibility, tags: openArray[string], workshopFileType: WorkshopFileType): SteamAPICall =
  var tagsSteamStrings = newSeq[cstring](tags.len)
  for i, item in tags:
    tagsSteamStrings[i] = item.cstring
  var tagsArray = SteamParamStringArray(
    strings: (if tagsSteamStrings.len == 0: cast[ptr cstring](nil) else: tagsSteamStrings[0].addr),
    numStrings: tagsSteamStrings.len.int32
  )
  self.publishWorkshopFileRaw(file.cstring, previewFile.cstring, consumerAppId, title.cstring, description.cstring, visibility, tagsArray.addr, workshopFileType)

proc updatePublishedFileFile*(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, file: string): bool =
  self.updatePublishedFileFileRaw(updateHandle, file.cstring)

proc updatePublishedFilePreviewFile*(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, previewFile: string): bool =
  self.updatePublishedFilePreviewFileRaw(updateHandle, previewFile.cstring)

proc updatePublishedFileTitle*(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, title: string): bool =
  self.updatePublishedFileTitleRaw(updateHandle, title.cstring)

proc updatePublishedFileDescription*(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, description: string): bool =
  self.updatePublishedFileDescriptionRaw(updateHandle, description.cstring)

proc updatePublishedFileTags*(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, tags: openArray[string]): bool =
  var tagsSteamStrings = newSeq[cstring](tags.len)
  for i, item in tags:
    tagsSteamStrings[i] = item.cstring
  var tagsArray = SteamParamStringArray(
    strings: (if tagsSteamStrings.len == 0: cast[ptr cstring](nil) else: tagsSteamStrings[0].addr),
    numStrings: tagsSteamStrings.len.int32
  )
  self.updatePublishedFileTagsRaw(updateHandle, tagsArray.addr)

proc updatePublishedFileSetChangeDescription*(self: ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle, changeDescription: string): bool =
  self.updatePublishedFileSetChangeDescriptionRaw(updateHandle, changeDescription.cstring)

proc enumerateUserSharedWorkshopFiles*(self: ISteamRemoteStorage, steamId: SteamId, startIndex: uint32, requiredTags: openArray[string], excludedTags: openArray[string]): SteamAPICall =
  var requiredTagsSteamStrings = newSeq[cstring](requiredTags.len)
  for i, item in requiredTags:
    requiredTagsSteamStrings[i] = item.cstring
  var requiredTagsArray = SteamParamStringArray(
    strings: (if requiredTagsSteamStrings.len == 0: cast[ptr cstring](nil) else: requiredTagsSteamStrings[0].addr),
    numStrings: requiredTagsSteamStrings.len.int32
  )
  var excludedTagsSteamStrings = newSeq[cstring](excludedTags.len)
  for i, item in excludedTags:
    excludedTagsSteamStrings[i] = item.cstring
  var excludedTagsArray = SteamParamStringArray(
    strings: (if excludedTagsSteamStrings.len == 0: cast[ptr cstring](nil) else: excludedTagsSteamStrings[0].addr),
    numStrings: excludedTagsSteamStrings.len.int32
  )
  self.enumerateUserSharedWorkshopFilesRaw(steamId, startIndex, requiredTagsArray.addr, excludedTagsArray.addr)

proc publishVideo*(self: ISteamRemoteStorage, videoProvider: WorkshopVideoProvider, videoAccount: string, videoIdentifier: string, previewFile: string, consumerAppId: AppId, title: string, description: string, visibility: RemoteStoragePublishedFileVisibility, tags: openArray[string]): SteamAPICall =
  var tagsSteamStrings = newSeq[cstring](tags.len)
  for i, item in tags:
    tagsSteamStrings[i] = item.cstring
  var tagsArray = SteamParamStringArray(
    strings: (if tagsSteamStrings.len == 0: cast[ptr cstring](nil) else: tagsSteamStrings[0].addr),
    numStrings: tagsSteamStrings.len.int32
  )
  self.publishVideoRaw(videoProvider, videoAccount.cstring, videoIdentifier.cstring, previewFile.cstring, consumerAppId, title.cstring, description.cstring, visibility, tagsArray.addr)

proc enumeratePublishedWorkshopFiles*(self: ISteamRemoteStorage, enumerationType: WorkshopEnumerationType, startIndex: uint32, count: uint32, days: uint32, tags: openArray[string], userTags: openArray[string]): SteamAPICall =
  var tagsSteamStrings = newSeq[cstring](tags.len)
  for i, item in tags:
    tagsSteamStrings[i] = item.cstring
  var tagsArray = SteamParamStringArray(
    strings: (if tagsSteamStrings.len == 0: cast[ptr cstring](nil) else: tagsSteamStrings[0].addr),
    numStrings: tagsSteamStrings.len.int32
  )
  var userTagsSteamStrings = newSeq[cstring](userTags.len)
  for i, item in userTags:
    userTagsSteamStrings[i] = item.cstring
  var userTagsArray = SteamParamStringArray(
    strings: (if userTagsSteamStrings.len == 0: cast[ptr cstring](nil) else: userTagsSteamStrings[0].addr),
    numStrings: userTagsSteamStrings.len.int32
  )
  self.enumeratePublishedWorkshopFilesRaw(enumerationType, startIndex, count, days, tagsArray.addr, userTagsArray.addr)

proc ugcDownloadToLocation*(self: ISteamRemoteStorage, hContent: UGCHandle, location: string, priority: uint32): SteamAPICall =
  self.ugcDownloadToLocationRaw(hContent, location.cstring, priority)

proc getStat*(self: ISteamUserStats, name: string, data: ptr int32): bool =
  self.getStatRaw(name.cstring, data)

proc getStat*(self: ISteamUserStats, name: string, data: ptr float32): bool =
  self.getStatRaw(name.cstring, data)

proc setStat*(self: ISteamUserStats, name: string, data: int32): bool =
  self.setStatRaw(name.cstring, data)

proc setStat*(self: ISteamUserStats, name: string, fData: float32): bool =
  self.setStatRaw(name.cstring, fData)

proc updateAvgRateStat*(self: ISteamUserStats, name: string, countThisSession: float32, dSessionLength: float64): bool =
  self.updateAvgRateStatRaw(name.cstring, countThisSession, dSessionLength)

proc getAchievement*(self: ISteamUserStats, name: string, achieved: ptr bool): bool =
  self.getAchievementRaw(name.cstring, achieved)

proc setAchievement*(self: ISteamUserStats, name: string): bool =
  self.setAchievementRaw(name.cstring)

proc clearAchievement*(self: ISteamUserStats, name: string): bool =
  self.clearAchievementRaw(name.cstring)

proc getAchievementAndUnlockTime*(self: ISteamUserStats, name: string, achieved: ptr bool, unlockTime: ptr uint32): bool =
  self.getAchievementAndUnlockTimeRaw(name.cstring, achieved, unlockTime)

proc getAchievementIcon*(self: ISteamUserStats, name: string): cint =
  self.getAchievementIconRaw(name.cstring)

proc indicateAchievementProgress*(self: ISteamUserStats, name: string, curProgress: uint32, maxProgress: uint32): bool =
  self.indicateAchievementProgressRaw(name.cstring, curProgress, maxProgress)

proc getUserStat*(self: ISteamUserStats, steamIdUser: SteamId, name: string, data: ptr int32): bool =
  self.getUserStatRaw(steamIdUser, name.cstring, data)

proc getUserStat*(self: ISteamUserStats, steamIdUser: SteamId, name: string, data: ptr float32): bool =
  self.getUserStatRaw(steamIdUser, name.cstring, data)

proc getUserAchievement*(self: ISteamUserStats, steamIdUser: SteamId, name: string, achieved: ptr bool): bool =
  self.getUserAchievementRaw(steamIdUser, name.cstring, achieved)

proc getUserAchievementAndUnlockTime*(self: ISteamUserStats, steamIdUser: SteamId, name: string, achieved: ptr bool, unlockTime: ptr uint32): bool =
  self.getUserAchievementAndUnlockTimeRaw(steamIdUser, name.cstring, achieved, unlockTime)

proc findOrCreateLeaderboard*(self: ISteamUserStats, leaderboardName: string, leaderboardSortMethod: LeaderboardSortMethod, leaderboardDisplayType: LeaderboardDisplayType): SteamAPICall =
  self.findOrCreateLeaderboardRaw(leaderboardName.cstring, leaderboardSortMethod, leaderboardDisplayType)

proc findLeaderboard*(self: ISteamUserStats, leaderboardName: string): SteamAPICall =
  self.findLeaderboardRaw(leaderboardName.cstring)

proc getAchievementAchievedPercent*(self: ISteamUserStats, name: string, percent: ptr float32): bool =
  self.getAchievementAchievedPercentRaw(name.cstring, percent)

proc getGlobalStat*(self: ISteamUserStats, statName: string, data: ptr int64): bool =
  self.getGlobalStatRaw(statName.cstring, data)

proc getGlobalStat*(self: ISteamUserStats, statName: string, data: ptr float64): bool =
  self.getGlobalStatRaw(statName.cstring, data)

proc getGlobalStatHistory*(self: ISteamUserStats, statName: string, data: ptr int64, data2: uint32): int32 =
  self.getGlobalStatHistoryRaw(statName.cstring, data, data2)

proc getGlobalStatHistory*(self: ISteamUserStats, statName: string, data: ptr float64, data2: uint32): int32 =
  self.getGlobalStatHistoryRaw(statName.cstring, data, data2)

proc getAchievementProgressLimits*(self: ISteamUserStats, name: string, minProgress: ptr int32, maxProgress: ptr int32): bool =
  self.getAchievementProgressLimitsRaw(name.cstring, minProgress, maxProgress)

proc getAchievementProgressLimits*(self: ISteamUserStats, name: string, pfMinProgress: ptr float32, pfMaxProgress: ptr float32): bool =
  self.getAchievementProgressLimitsRaw(name.cstring, pfMinProgress, pfMaxProgress)

proc getFileDetails*(self: ISteamApps, fileName: string): SteamAPICall =
  self.getFileDetailsRaw(fileName.cstring)

proc setActiveBeta*(self: ISteamApps, betaName: string): bool =
  self.setActiveBetaRaw(betaName.cstring)

proc addScreenshotToLibrary*(self: ISteamScreenshots, filename: string, thumbnailFilename: string, width: int, height: int): ScreenshotHandle =
  self.addScreenshotToLibraryRaw(filename.cstring, thumbnailFilename.cstring, width.cint, height.cint)

proc setLocation*(self: ISteamScreenshots, hScreenshot: ScreenshotHandle, location: string): bool =
  self.setLocationRaw(hScreenshot, location.cstring)

proc addVrScreenshotToLibrary*(self: ISteamScreenshots, typeValue: VRScreenshotType, filename: string, vrFilename: string): ScreenshotHandle =
  self.addVrScreenshotToLibraryRaw(typeValue, filename.cstring, vrFilename.cstring)

proc createHttpRequest*(self: ISteamHTTP, httpRequestMethod: HTTPMethod, absoluteUrl: string): HTTPRequestHandle =
  self.createHttpRequestRaw(httpRequestMethod, absoluteUrl.cstring)

proc setHttpRequestHeaderValue*(self: ISteamHTTP, hRequest: HTTPRequestHandle, headerName: string, headerValue: string): bool =
  self.setHttpRequestHeaderValueRaw(hRequest, headerName.cstring, headerValue.cstring)

proc setHttpRequestGetOrPostParameter*(self: ISteamHTTP, hRequest: HTTPRequestHandle, paramName: string, paramValue: string): bool =
  self.setHttpRequestGetOrPostParameterRaw(hRequest, paramName.cstring, paramValue.cstring)

proc getHttpResponseHeaderSize*(self: ISteamHTTP, hRequest: HTTPRequestHandle, headerName: string, responseHeaderSize: ptr uint32): bool =
  self.getHttpResponseHeaderSizeRaw(hRequest, headerName.cstring, responseHeaderSize)

proc getHttpResponseHeaderValue*(self: ISteamHTTP, hRequest: HTTPRequestHandle, headerName: string, headerValueBuffer: ptr uint8, bufferSize: uint32): bool =
  self.getHttpResponseHeaderValueRaw(hRequest, headerName.cstring, headerValueBuffer, bufferSize)

proc setHttpRequestRawPostBody*(self: ISteamHTTP, hRequest: HTTPRequestHandle, contentType: string, pubBody: ptr uint8, bodyLen: uint32): bool =
  self.setHttpRequestRawPostBodyRaw(hRequest, contentType.cstring, pubBody, bodyLen)

proc setCookie*(self: ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle, host: string, url: string, cookie: string): bool =
  self.setCookieRaw(hCookieContainer, host.cstring, url.cstring, cookie.cstring)

proc setHttpRequestUserAgentInfo*(self: ISteamHTTP, hRequest: HTTPRequestHandle, userAgentInfo: string): bool =
  self.setHttpRequestUserAgentInfoRaw(hRequest, userAgentInfo.cstring)

proc setInputActionManifestFilePath*(self: ISteamInput, inputActionManifestAbsolutePath: string): bool =
  self.setInputActionManifestFilePathRaw(inputActionManifestAbsolutePath.cstring)

proc getActionSetHandle*(self: ISteamInput, actionSetName: string): InputActionSetHandle =
  self.getActionSetHandleRaw(actionSetName.cstring)

proc getDigitalActionHandle*(self: ISteamInput, actionName: string): InputDigitalActionHandle =
  self.getDigitalActionHandleRaw(actionName.cstring)

proc getAnalogActionHandle*(self: ISteamInput, actionName: string): InputAnalogActionHandle =
  self.getAnalogActionHandleRaw(actionName.cstring)

proc getActionSetHandle*(self: ISteamController, actionSetName: string): ControllerActionSetHandle =
  self.getActionSetHandleRaw(actionSetName.cstring)

proc getDigitalActionHandle*(self: ISteamController, actionName: string): ControllerDigitalActionHandle =
  self.getDigitalActionHandleRaw(actionName.cstring)

proc getAnalogActionHandle*(self: ISteamController, actionName: string): ControllerAnalogActionHandle =
  self.getAnalogActionHandleRaw(actionName.cstring)

proc createQueryAllUgcRequest*(self: ISteamUGC, queryType: UGCQuery, matchingeMatchingUgcTypeFileType: UGCMatchingUGCType, creatorAppId: AppId, consumerAppId: AppId, cursor: string): UGCQueryHandle =
  self.createQueryAllUgcRequestRaw(queryType, matchingeMatchingUgcTypeFileType, creatorAppId, consumerAppId, cursor.cstring)

proc addRequiredTag*(self: ISteamUGC, handle: UGCQueryHandle, tagName: string): bool =
  self.addRequiredTagRaw(handle, tagName.cstring)

proc addRequiredTagGroup*(self: ISteamUGC, handle: UGCQueryHandle, tagGroups: openArray[string]): bool =
  var tagGroupsSteamStrings = newSeq[cstring](tagGroups.len)
  for i, item in tagGroups:
    tagGroupsSteamStrings[i] = item.cstring
  var tagGroupsArray = SteamParamStringArray(
    strings: (if tagGroupsSteamStrings.len == 0: cast[ptr cstring](nil) else: tagGroupsSteamStrings[0].addr),
    numStrings: tagGroupsSteamStrings.len.int32
  )
  self.addRequiredTagGroupRaw(handle, tagGroupsArray.addr)

proc addExcludedTag*(self: ISteamUGC, handle: UGCQueryHandle, tagName: string): bool =
  self.addExcludedTagRaw(handle, tagName.cstring)

proc setLanguage*(self: ISteamUGC, handle: UGCQueryHandle, language: string): bool =
  self.setLanguageRaw(handle, language.cstring)

proc setCloudFileNameFilter*(self: ISteamUGC, handle: UGCQueryHandle, matchCloudFileName: string): bool =
  self.setCloudFileNameFilterRaw(handle, matchCloudFileName.cstring)

proc setSearchText*(self: ISteamUGC, handle: UGCQueryHandle, searchText: string): bool =
  self.setSearchTextRaw(handle, searchText.cstring)

proc addRequiredKeyValueTag*(self: ISteamUGC, handle: UGCQueryHandle, key: string, value: string): bool =
  self.addRequiredKeyValueTagRaw(handle, key.cstring, value.cstring)

proc setItemTitle*(self: ISteamUGC, handle: UGCUpdateHandle, title: string): bool =
  self.setItemTitleRaw(handle, title.cstring)

proc setItemDescription*(self: ISteamUGC, handle: UGCUpdateHandle, description: string): bool =
  self.setItemDescriptionRaw(handle, description.cstring)

proc setItemUpdateLanguage*(self: ISteamUGC, handle: UGCUpdateHandle, language: string): bool =
  self.setItemUpdateLanguageRaw(handle, language.cstring)

proc setItemMetadata*(self: ISteamUGC, handle: UGCUpdateHandle, metaData: string): bool =
  self.setItemMetadataRaw(handle, metaData.cstring)

proc setItemTags*(self: ISteamUGC, updateHandle: UGCUpdateHandle, tags: openArray[string], allowAdminTags: bool): bool =
  var tagsSteamStrings = newSeq[cstring](tags.len)
  for i, item in tags:
    tagsSteamStrings[i] = item.cstring
  var tagsArray = SteamParamStringArray(
    strings: (if tagsSteamStrings.len == 0: cast[ptr cstring](nil) else: tagsSteamStrings[0].addr),
    numStrings: tagsSteamStrings.len.int32
  )
  self.setItemTagsRaw(updateHandle, tagsArray.addr, allowAdminTags)

proc setItemContent*(self: ISteamUGC, handle: UGCUpdateHandle, contentFolder: string): bool =
  self.setItemContentRaw(handle, contentFolder.cstring)

proc setItemPreview*(self: ISteamUGC, handle: UGCUpdateHandle, previewFile: string): bool =
  self.setItemPreviewRaw(handle, previewFile.cstring)

proc removeItemKeyValueTags*(self: ISteamUGC, handle: UGCUpdateHandle, key: string): bool =
  self.removeItemKeyValueTagsRaw(handle, key.cstring)

proc addItemKeyValueTag*(self: ISteamUGC, handle: UGCUpdateHandle, key: string, value: string): bool =
  self.addItemKeyValueTagRaw(handle, key.cstring, value.cstring)

proc addItemPreviewFile*(self: ISteamUGC, handle: UGCUpdateHandle, previewFile: string, typeValue: ItemPreviewType): bool =
  self.addItemPreviewFileRaw(handle, previewFile.cstring, typeValue)

proc addItemPreviewVideo*(self: ISteamUGC, handle: UGCUpdateHandle, videoId: string): bool =
  self.addItemPreviewVideoRaw(handle, videoId.cstring)

proc updateItemPreviewFile*(self: ISteamUGC, handle: UGCUpdateHandle, index: uint32, previewFile: string): bool =
  self.updateItemPreviewFileRaw(handle, index, previewFile.cstring)

proc updateItemPreviewVideo*(self: ISteamUGC, handle: UGCUpdateHandle, index: uint32, videoId: string): bool =
  self.updateItemPreviewVideoRaw(handle, index, videoId.cstring)

proc setRequiredGameVersions*(self: ISteamUGC, handle: UGCUpdateHandle, gameBranchMin: string, gameBranchMax: string): bool =
  self.setRequiredGameVersionsRaw(handle, gameBranchMin.cstring, gameBranchMax.cstring)

proc submitItemUpdate*(self: ISteamUGC, handle: UGCUpdateHandle, changeNote: string): SteamAPICall =
  self.submitItemUpdateRaw(handle, changeNote.cstring)

proc initWorkshopForGameServer*(self: ISteamUGC, workshopDepotId: DepotId, folder: string): bool =
  self.initWorkshopForGameServerRaw(workshopDepotId, folder.cstring)

proc createBrowser*(self: ISteamHTMLSurface, userAgent: string, userCss: string): SteamAPICall =
  self.createBrowserRaw(userAgent.cstring, userCss.cstring)

proc loadUrl*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, url: string, postData: string) =
  self.loadUrlRaw(browserHandle, url.cstring, postData.cstring)

proc addHeader*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, key: string, value: string) =
  self.addHeaderRaw(browserHandle, key.cstring, value.cstring)

proc executeJavascript*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, script: string) =
  self.executeJavascriptRaw(browserHandle, script.cstring)

proc find*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, searchStr: string, currentlyInFind: bool, reverse: bool) =
  self.findRaw(browserHandle, searchStr.cstring, currentlyInFind, reverse)

proc setCookie*(self: ISteamHTMLSurface, hostname: string, key: string, value: string, path: string, expires: RTime32, secure: bool, httpOnly: bool) =
  self.setCookieRaw(hostname.cstring, key.cstring, value.cstring, path.cstring, expires, secure, httpOnly)

proc fileLoadDialogResponse*(self: ISteamHTMLSurface, browserHandle: HHTMLBrowser, selectedFiles: openArray[string]) =
  var selectedFilesCStrings = newSeq[cstring](selectedFiles.len)
  for i, item in selectedFiles:
    selectedFilesCStrings[i] = item.cstring
  self.fileLoadDialogResponseRaw(browserHandle, (if selectedFilesCStrings.len == 0: cast[ptr cstring](nil) else: selectedFilesCStrings[0].addr))

proc removeProperty*(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: string): bool =
  self.removePropertyRaw(handle, itemId, propertyName.cstring)

proc setProperty*(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: string, propertyValue: string): bool =
  self.setPropertyRaw(handle, itemId, propertyName.cstring, propertyValue.cstring)

proc setProperty*(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: string, value: bool): bool =
  self.setPropertyRaw(handle, itemId, propertyName.cstring, value)

proc setProperty*(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: string, value: int64): bool =
  self.setPropertyRaw(handle, itemId, propertyName.cstring, value)

proc setProperty*(self: ISteamInventory, handle: SteamInventoryUpdateHandle, itemId: SteamItemInstanceID, propertyName: string, value: float32): bool =
  self.setPropertyRaw(handle, itemId, propertyName.cstring, value)

proc inspectItem*(self: ISteamInventory, resultHandle: ptr SteamInventoryResult, itemToken: string): bool =
  self.inspectItemRaw(resultHandle, itemToken.cstring)

proc setTimelineTooltip*(self: ISteamTimeline, description: string, timeDelta: float32) =
  self.setTimelineTooltipRaw(description.cstring, timeDelta)

proc addInstantaneousTimelineEvent*(self: ISteamTimeline, title: string, description: string, icon: string, iconPriority: uint32, startOffsetSeconds: float32, possibleClip: TimelineEventClipPriority): TimelineEventHandle =
  self.addInstantaneousTimelineEventRaw(title.cstring, description.cstring, icon.cstring, iconPriority, startOffsetSeconds, possibleClip)

proc addRangeTimelineEvent*(self: ISteamTimeline, title: string, description: string, icon: string, iconPriority: uint32, startOffsetSeconds: float32, duration: float32, possibleClip: TimelineEventClipPriority): TimelineEventHandle =
  self.addRangeTimelineEventRaw(title.cstring, description.cstring, icon.cstring, iconPriority, startOffsetSeconds, duration, possibleClip)

proc startRangeTimelineEvent*(self: ISteamTimeline, title: string, description: string, icon: string, priority: uint32, startOffsetSeconds: float32, possibleClip: TimelineEventClipPriority): TimelineEventHandle =
  self.startRangeTimelineEventRaw(title.cstring, description.cstring, icon.cstring, priority, startOffsetSeconds, possibleClip)

proc updateRangeTimelineEvent*(self: ISteamTimeline, event: TimelineEventHandle, title: string, description: string, icon: string, priority: uint32, possibleClip: TimelineEventClipPriority) =
  self.updateRangeTimelineEventRaw(event, title.cstring, description.cstring, icon.cstring, priority, possibleClip)

proc setGamePhaseId*(self: ISteamTimeline, phaseId: string) =
  self.setGamePhaseIdRaw(phaseId.cstring)

proc doesGamePhaseRecordingExist*(self: ISteamTimeline, phaseId: string): SteamAPICall =
  self.doesGamePhaseRecordingExistRaw(phaseId.cstring)

proc addGamePhaseTag*(self: ISteamTimeline, tagName: string, tagIcon: string, tagGroup: string, priority: uint32) =
  self.addGamePhaseTagRaw(tagName.cstring, tagIcon.cstring, tagGroup.cstring, priority)

proc setGamePhaseAttribute*(self: ISteamTimeline, attributeGroup: string, attributeValue: string, priority: uint32) =
  self.setGamePhaseAttributeRaw(attributeGroup.cstring, attributeValue.cstring, priority)

proc openOverlayToGamePhase*(self: ISteamTimeline, phaseId: string) =
  self.openOverlayToGamePhaseRaw(phaseId.cstring)

proc closeConnection*(self: ISteamNetworkingSockets, hPeer: HSteamNetConnection, reason: int, debug: string, enableLinger: bool): bool =
  self.closeConnectionRaw(hPeer, reason.cint, debug.cstring, enableLinger)

proc setConnectionName*(self: ISteamNetworkingSockets, hPeer: HSteamNetConnection, name: string) =
  self.setConnectionNameRaw(hPeer, name.cstring)

proc parsePingLocationString*(self: ISteamNetworkingUtils, string: string, resultValue: ptr SteamNetworkPingLocation): bool =
  self.parsePingLocationStringRaw(string.cstring, resultValue)

proc setGlobalConfigValueString*(self: ISteamNetworkingUtils, value: NetworkingConfigValue, val: string): bool =
  self.setGlobalConfigValueStringRaw(value, val.cstring)

proc setConnectionConfigValueString*(self: ISteamNetworkingUtils, hConn: HSteamNetConnection, value: NetworkingConfigValue, val: string): bool =
  self.setConnectionConfigValueStringRaw(hConn, value, val.cstring)

proc steamNetworkingIpAddrParseString*(self: ISteamNetworkingUtils, addrValue: ptr SteamNetworkingIPAddr, str: string): bool =
  self.steamNetworkingIpAddrParseStringRaw(addrValue, str.cstring)

proc steamNetworkingIdentityParseString*(self: ISteamNetworkingUtils, identity: ptr SteamNetworkingIdentity, str: string): bool =
  self.steamNetworkingIdentityParseStringRaw(identity, str.cstring)

proc setProduct*(self: ISteamGameServer, product: string) =
  self.setProductRaw(product.cstring)

proc setGameDescription*(self: ISteamGameServer, gameDescription: string) =
  self.setGameDescriptionRaw(gameDescription.cstring)

proc setModDir*(self: ISteamGameServer, modDir: string) =
  self.setModDirRaw(modDir.cstring)

proc logOn*(self: ISteamGameServer, token: string) =
  self.logOnRaw(token.cstring)

proc setServerName*(self: ISteamGameServer, serverName: string) =
  self.setServerNameRaw(serverName.cstring)

proc setMapName*(self: ISteamGameServer, mapName: string) =
  self.setMapNameRaw(mapName.cstring)

proc setSpectatorServerName*(self: ISteamGameServer, spectatorServerName: string) =
  self.setSpectatorServerNameRaw(spectatorServerName.cstring)

proc setKeyValue*(self: ISteamGameServer, key: string, value: string) =
  self.setKeyValueRaw(key.cstring, value.cstring)

proc setGameTags*(self: ISteamGameServer, gameTags: string) =
  self.setGameTagsRaw(gameTags.cstring)

proc setGameData*(self: ISteamGameServer, gameData: string) =
  self.setGameDataRaw(gameData.cstring)

proc setRegion*(self: ISteamGameServer, region: string) =
  self.setRegionRaw(region.cstring)

proc updateUserData*(self: ISteamGameServer, steamIdUser: SteamId, playerName: string, score: uint32): bool =
  self.updateUserDataRaw(steamIdUser, playerName.cstring, score)

proc getUserStat*(self: ISteamGameServerStats, steamIdUser: SteamId, name: string, data: ptr int32): bool =
  self.getUserStatRaw(steamIdUser, name.cstring, data)

proc getUserStat*(self: ISteamGameServerStats, steamIdUser: SteamId, name: string, data: ptr float32): bool =
  self.getUserStatRaw(steamIdUser, name.cstring, data)

proc getUserAchievement*(self: ISteamGameServerStats, steamIdUser: SteamId, name: string, achieved: ptr bool): bool =
  self.getUserAchievementRaw(steamIdUser, name.cstring, achieved)

proc setUserStat*(self: ISteamGameServerStats, steamIdUser: SteamId, name: string, data: int32): bool =
  self.setUserStatRaw(steamIdUser, name.cstring, data)

proc setUserStat*(self: ISteamGameServerStats, steamIdUser: SteamId, name: string, fData: float32): bool =
  self.setUserStatRaw(steamIdUser, name.cstring, fData)

proc updateUserAvgRateStat*(self: ISteamGameServerStats, steamIdUser: SteamId, name: string, countThisSession: float32, dSessionLength: float64): bool =
  self.updateUserAvgRateStatRaw(steamIdUser, name.cstring, countThisSession, dSessionLength)

proc setUserAchievement*(self: ISteamGameServerStats, steamIdUser: SteamId, name: string): bool =
  self.setUserAchievementRaw(steamIdUser, name.cstring)

proc clearUserAchievement*(self: ISteamGameServerStats, steamIdUser: SteamId, name: string): bool =
  self.clearUserAchievementRaw(steamIdUser, name.cstring)

proc setName*(self: ptr GameServerItem, name: string) =
  self.setNameRaw(name.cstring)

proc parseString*(self: ptr SteamNetworkingIPAddr, str: string): bool =
  self.parseStringRaw(str.cstring)

proc setXboxPairwiseId*(self: ptr SteamNetworkingIdentity, string: string): bool =
  self.setXboxPairwiseIdRaw(string.cstring)

proc setGenericString*(self: ptr SteamNetworkingIdentity, string: string): bool =
  self.setGenericStringRaw(string.cstring)

proc parseString*(self: ptr SteamNetworkingIdentity, str: string): bool =
  self.parseStringRaw(str.cstring)

proc setString*(self: ptr SteamNetworkingConfigValue, val: NetworkingConfigValue, data: string) =
  self.setStringRaw(val, data.cstring)
proc getUgcDetails*(self: ISteamRemoteStorage, hContent: UGCHandle): tuple[ok: bool, appId: AppId, fileSizeInBytes: int32, steamIdOwner: SteamId, name: string] =
  var nameValue: ptr char
  var appIdValue: AppId
  var fileSizeInBytesValue: int32
  var steamIdOwnerValue: SteamId
  result.ok = self.getUgcDetailsRaw(hContent, appIdValue.addr, nameValue.addr, fileSizeInBytesValue.addr, steamIdOwnerValue.addr)
  result.appId = appIdValue
  result.fileSizeInBytes = fileSizeInBytesValue
  result.steamIdOwner = steamIdOwnerValue
  result.name = steamString(cast[cstring](nameValue))
proc getUserDataFolder*(self: ISteamUser, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var bufferBuffer = newString(max(1, steamworksBufferSize))
  if not self.getUserDataFolderRaw(bufferBuffer[0].addr, bufferBuffer.len.cint):
    return ""
  bufferBuffer.zeroCap()
  result = bufferBuffer

proc getEnteredGamepadTextInput*(self: ISteamUtils, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var textBuffer = newString(max(1, steamworksBufferSize))
  if not self.getEnteredGamepadTextInputRaw(textBuffer[0].addr, textBuffer.len.uint32):
    return ""
  textBuffer.zeroCap()
  result = textBuffer

proc filterText*(self: ISteamUtils, context: TextFilteringContext, sourceSteamId: SteamId, inputMessage: string, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var outFilteredTextBuffer = newString(max(1, steamworksBufferSize))
  let written = self.filterTextRaw(context, sourceSteamId, inputMessage.cstring, outFilteredTextBuffer[0].addr, outFilteredTextBuffer.len.uint32)
  if written > 0 and written.int < outFilteredTextBuffer.len:
    outFilteredTextBuffer.setLen(written.int)
  outFilteredTextBuffer.zeroCap()
  result = outFilteredTextBuffer

proc getLobbyDataByIndex*(self: ISteamMatchmaking, steamIdLobby: SteamId, lobbyData: int, steamworksBufferSize = defaultSteamworksBufferSize): tuple[ok: bool, key: string, value: string] =
  var keyBuffer = newString(max(1, steamworksBufferSize))
  var valueBuffer = newString(max(1, steamworksBufferSize))
  result.ok = self.getLobbyDataByIndexRaw(steamIdLobby, lobbyData.cint, keyBuffer[0].addr, keyBuffer.len.cint, valueBuffer[0].addr, valueBuffer.len.cint)
  if result.ok:
    keyBuffer.zeroCap()
  else:
    keyBuffer.setLen(0)
  if result.ok:
    valueBuffer.zeroCap()
  else:
    valueBuffer.setLen(0)
  result.key = keyBuffer
  result.value = valueBuffer

proc getBeaconDetails*(self: ISteamParties, beaconId: PartyBeaconID, steamworksBufferSize = defaultSteamworksBufferSize): tuple[ok: bool, steamIdBeaconOwner: SteamId, location: SteamPartyBeaconLocation, metadata: string] =
  var metadataBuffer = newString(max(1, steamworksBufferSize))
  var steamIdBeaconOwnerValue: SteamId
  var locationValue: SteamPartyBeaconLocation
  result.ok = self.getBeaconDetailsRaw(beaconId, steamIdBeaconOwnerValue.addr, locationValue.addr, metadataBuffer[0].addr, metadataBuffer.len.cint)
  if result.ok:
    metadataBuffer.zeroCap()
  else:
    metadataBuffer.setLen(0)
  result.steamIdBeaconOwner = steamIdBeaconOwnerValue
  result.location = locationValue
  result.metadata = metadataBuffer

proc getBeaconLocationData*(self: ISteamParties, beaconLocation: SteamPartyBeaconLocation, data: PartyBeaconLocationData, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var dataStringOutBuffer = newString(max(1, steamworksBufferSize))
  if not self.getBeaconLocationDataRaw(beaconLocation, data, dataStringOutBuffer[0].addr, dataStringOutBuffer.len.cint):
    return ""
  dataStringOutBuffer.zeroCap()
  result = dataStringOutBuffer

proc getMostAchievedAchievementInfo*(self: ISteamUserStats, steamworksBufferSize = defaultSteamworksBufferSize): tuple[returnValue: cint, percent: float32, achieved: bool, name: string] =
  var nameBuffer = newString(max(1, steamworksBufferSize))
  var percentValue: float32
  var achievedValue: bool
  result.returnValue = self.getMostAchievedAchievementInfoRaw(nameBuffer[0].addr, nameBuffer.len.uint32, percentValue.addr, achievedValue.addr)
  nameBuffer.zeroCap()
  result.percent = percentValue
  result.achieved = achievedValue
  result.name = nameBuffer

proc getNextMostAchievedAchievementInfo*(self: ISteamUserStats, iteratorPrevious: int, steamworksBufferSize = defaultSteamworksBufferSize): tuple[returnValue: cint, percent: float32, achieved: bool, name: string] =
  var nameBuffer = newString(max(1, steamworksBufferSize))
  var percentValue: float32
  var achievedValue: bool
  result.returnValue = self.getNextMostAchievedAchievementInfoRaw(iteratorPrevious.cint, nameBuffer[0].addr, nameBuffer.len.uint32, percentValue.addr, achievedValue.addr)
  nameBuffer.zeroCap()
  result.percent = percentValue
  result.achieved = achievedValue
  result.name = nameBuffer

proc getDlcDataByIndex*(self: ISteamApps, dlc: int, steamworksBufferSize = defaultSteamworksBufferSize): tuple[ok: bool, appId: AppId, available: bool, name: string] =
  var nameBuffer = newString(max(1, steamworksBufferSize))
  var appIdValue: AppId
  var availableValue: bool
  result.ok = self.getDlcDataByIndexRaw(dlc.cint, appIdValue.addr, availableValue.addr, nameBuffer[0].addr, nameBuffer.len.cint)
  if result.ok:
    nameBuffer.zeroCap()
  else:
    nameBuffer.setLen(0)
  result.appId = appIdValue
  result.available = availableValue
  result.name = nameBuffer

proc getCurrentBetaName*(self: ISteamApps, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var nameBuffer = newString(max(1, steamworksBufferSize))
  if not self.getCurrentBetaNameRaw(nameBuffer[0].addr, nameBuffer.len.cint):
    return ""
  nameBuffer.zeroCap()
  result = nameBuffer

proc getAppInstallDir*(self: ISteamApps, appId: AppId, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var folderBuffer = newString(max(1, steamworksBufferSize))
  let written = self.getAppInstallDirRaw(appId, folderBuffer[0].addr, folderBuffer.len.uint32)
  if written > 0 and written.int < folderBuffer.len:
    folderBuffer.setLen(written.int)
  folderBuffer.zeroCap()
  result = folderBuffer

proc getLaunchCommandLine*(self: ISteamApps, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var commandLineBuffer = newString(max(1, steamworksBufferSize))
  let written = self.getLaunchCommandLineRaw(commandLineBuffer[0].addr, commandLineBuffer.len.cint)
  if written > 0 and written.int < commandLineBuffer.len:
    commandLineBuffer.setLen(written.int)
  commandLineBuffer.zeroCap()
  result = commandLineBuffer

proc getBetaInfo*(self: ISteamApps, betaIndex: int, steamworksBufferSize = defaultSteamworksBufferSize): tuple[ok: bool, flags: uint32, buildId: uint32, lastUpdated: uint32, betaName: string, description: string] =
  var betaNameBuffer = newString(max(1, steamworksBufferSize))
  var descriptionBuffer = newString(max(1, steamworksBufferSize))
  var flagsValue: uint32
  var buildIdValue: uint32
  var lastUpdatedValue: uint32
  result.ok = self.getBetaInfoRaw(betaIndex.cint, flagsValue.addr, buildIdValue.addr, betaNameBuffer[0].addr, betaNameBuffer.len.cint, descriptionBuffer[0].addr, descriptionBuffer.len.cint, lastUpdatedValue.addr)
  if result.ok:
    betaNameBuffer.zeroCap()
  else:
    betaNameBuffer.setLen(0)
  if result.ok:
    descriptionBuffer.zeroCap()
  else:
    descriptionBuffer.setLen(0)
  result.flags = flagsValue
  result.buildId = buildIdValue
  result.lastUpdated = lastUpdatedValue
  result.betaName = betaNameBuffer
  result.description = descriptionBuffer

proc getQueryUgcTag*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, indexTag: uint32, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var valueBuffer = newString(max(1, steamworksBufferSize))
  if not self.getQueryUgcTagRaw(handle, index, indexTag, valueBuffer[0].addr, valueBuffer.len.uint32):
    return ""
  valueBuffer.zeroCap()
  result = valueBuffer

proc getQueryUgcTagDisplayName*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, indexTag: uint32, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var valueBuffer = newString(max(1, steamworksBufferSize))
  if not self.getQueryUgcTagDisplayNameRaw(handle, index, indexTag, valueBuffer[0].addr, valueBuffer.len.uint32):
    return ""
  valueBuffer.zeroCap()
  result = valueBuffer

proc getQueryUgcPreviewUrl*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var urlBuffer = newString(max(1, steamworksBufferSize))
  if not self.getQueryUgcPreviewUrlRaw(handle, index, urlBuffer[0].addr, urlBuffer.len.uint32):
    return ""
  urlBuffer.zeroCap()
  result = urlBuffer

proc getQueryUgcMetadata*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var metadataBuffer = newString(max(1, steamworksBufferSize))
  if not self.getQueryUgcMetadataRaw(handle, index, metadataBuffer[0].addr, metadataBuffer.len.uint32):
    return ""
  metadataBuffer.zeroCap()
  result = metadataBuffer

proc getQueryUgcAdditionalPreview*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, previewIndex: uint32, steamworksBufferSize = defaultSteamworksBufferSize): tuple[ok: bool, previewType: ItemPreviewType, urlOrVideoId: string, originalFileName: string] =
  var urlOrVideoIdBuffer = newString(max(1, steamworksBufferSize))
  var originalFileNameBuffer = newString(max(1, steamworksBufferSize))
  var previewTypeValue: ItemPreviewType
  result.ok = self.getQueryUgcAdditionalPreviewRaw(handle, index, previewIndex, urlOrVideoIdBuffer[0].addr, urlOrVideoIdBuffer.len.uint32, originalFileNameBuffer[0].addr, originalFileNameBuffer.len.uint32, previewTypeValue.addr)
  if result.ok:
    urlOrVideoIdBuffer.zeroCap()
  else:
    urlOrVideoIdBuffer.setLen(0)
  if result.ok:
    originalFileNameBuffer.zeroCap()
  else:
    originalFileNameBuffer.setLen(0)
  result.previewType = previewTypeValue
  result.urlOrVideoId = urlOrVideoIdBuffer
  result.originalFileName = originalFileNameBuffer

proc getQueryUgcKeyValueTag*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, keyValueTagIndex: uint32, steamworksBufferSize = defaultSteamworksBufferSize): tuple[ok: bool, key: string, value: string] =
  var keyBuffer = newString(max(1, steamworksBufferSize))
  var valueBuffer = newString(max(1, steamworksBufferSize))
  result.ok = self.getQueryUgcKeyValueTagRaw(handle, index, keyValueTagIndex, keyBuffer[0].addr, keyBuffer.len.uint32, valueBuffer[0].addr, valueBuffer.len.uint32)
  if result.ok:
    keyBuffer.zeroCap()
  else:
    keyBuffer.setLen(0)
  if result.ok:
    valueBuffer.zeroCap()
  else:
    valueBuffer.setLen(0)
  result.key = keyBuffer
  result.value = valueBuffer

proc getQueryUgcKeyValueTag*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, key: string, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var valueBuffer = newString(max(1, steamworksBufferSize))
  if not self.getQueryUgcKeyValueTagRaw(handle, index, key.cstring, valueBuffer[0].addr, valueBuffer.len.uint32):
    return ""
  valueBuffer.zeroCap()
  result = valueBuffer

proc getSupportedGameVersionData*(self: ISteamUGC, handle: UGCQueryHandle, index: uint32, versionIndex: uint32, steamworksBufferSize = defaultSteamworksBufferSize): tuple[ok: bool, gameBranchMin: string, gameBranchMax: string] =
  var gameBranchMinBuffer = newString(max(1, steamworksBufferSize))
  var gameBranchMaxBuffer = newString(max(1, steamworksBufferSize))
  result.ok = self.getSupportedGameVersionDataRaw(handle, index, versionIndex, gameBranchMinBuffer[0].addr, gameBranchMaxBuffer[0].addr, gameBranchMinBuffer.len.uint32)
  if result.ok:
    gameBranchMinBuffer.zeroCap()
  else:
    gameBranchMinBuffer.setLen(0)
  if result.ok:
    gameBranchMaxBuffer.zeroCap()
  else:
    gameBranchMaxBuffer.setLen(0)
  result.gameBranchMin = gameBranchMinBuffer
  result.gameBranchMax = gameBranchMaxBuffer

proc getItemInstallInfo*(self: ISteamUGC, publishedFileId: PublishedFileId, steamworksBufferSize = defaultSteamworksBufferSize): tuple[ok: bool, sizeOnDisk: uint64, timeStamp: uint32, folder: string] =
  var folderBuffer = newString(max(1, steamworksBufferSize))
  var sizeOnDiskValue: uint64
  var timeStampValue: uint32
  result.ok = self.getItemInstallInfoRaw(publishedFileId, sizeOnDiskValue.addr, folderBuffer[0].addr, folderBuffer.len.uint32, timeStampValue.addr)
  if result.ok:
    folderBuffer.zeroCap()
  else:
    folderBuffer.setLen(0)
  result.sizeOnDisk = sizeOnDiskValue
  result.timeStamp = timeStampValue
  result.folder = folderBuffer

proc getResultItemProperty*(self: ISteamInventory, resultHandle: SteamInventoryResult, itemIndex: uint32, propertyName: string, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var valueBufferBuffer = newString(max(1, steamworksBufferSize))
  var valueBufferBufferSize = steamworksBufferSize.uint32
  if not self.getResultItemPropertyRaw(resultHandle, itemIndex, propertyName.cstring, valueBufferBuffer[0].addr, valueBufferBufferSize.addr):
    return ""
  valueBufferBuffer.zeroCap()
  result = valueBufferBuffer

proc getItemDefinitionProperty*(self: ISteamInventory, definition: SteamItemDef, propertyName: string, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var valueBufferBuffer = newString(max(1, steamworksBufferSize))
  var valueBufferBufferSize = steamworksBufferSize.uint32
  if not self.getItemDefinitionPropertyRaw(definition, propertyName.cstring, valueBufferBuffer[0].addr, valueBufferBufferSize.addr):
    return ""
  valueBufferBuffer.zeroCap()
  result = valueBufferBuffer

proc getOpfStringForApp*(self: ISteamVideo, videoAppId: AppId, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var bufferBuffer = newString(max(1, steamworksBufferSize))
  var bufferBufferSize = steamworksBufferSize.int32
  if not self.getOpfStringForAppRaw(videoAppId, bufferBuffer[0].addr, bufferBufferSize.addr):
    return ""
  bufferBuffer.zeroCap()
  result = bufferBuffer

proc getConnectionName*(self: ISteamNetworkingSockets, hPeer: HSteamNetConnection, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var nameBuffer = newString(max(1, steamworksBufferSize))
  if not self.getConnectionNameRaw(hPeer, nameBuffer[0].addr, nameBuffer.len.cint):
    return ""
  nameBuffer.zeroCap()
  result = nameBuffer

proc getDetailedConnectionStatus*(self: ISteamNetworkingSockets, hConn: HSteamNetConnection, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var bufBuffer = newString(max(1, steamworksBufferSize))
  let written = self.getDetailedConnectionStatusRaw(hConn, bufBuffer[0].addr, bufBuffer.len.cint)
  if written > 0 and written.int < bufBuffer.len:
    bufBuffer.setLen(written.int)
  bufBuffer.zeroCap()
  result = bufBuffer

proc convertPingLocationToString*(self: ISteamNetworkingUtils, location: ptr SteamNetworkPingLocation, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var bufBuffer = newString(max(1, steamworksBufferSize))
  self.convertPingLocationToStringRaw(location, bufBuffer[0].addr, bufBuffer.len.cint)
  bufBuffer.zeroCap()
  result = bufBuffer

proc steamNetworkingIpAddrToString*(self: ISteamNetworkingUtils, addrValue: ptr SteamNetworkingIPAddr, withPort: bool, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var bufBuffer = newString(max(1, steamworksBufferSize))
  self.steamNetworkingIpAddrToStringRaw(addrValue, bufBuffer[0].addr, bufBuffer.len.uint32, withPort)
  bufBuffer.zeroCap()
  result = bufBuffer

proc steamNetworkingIdentityToString*(self: ISteamNetworkingUtils, identity: ptr SteamNetworkingIdentity, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var bufBuffer = newString(max(1, steamworksBufferSize))
  self.steamNetworkingIdentityToStringRaw(identity, bufBuffer[0].addr, bufBuffer.len.uint32)
  bufBuffer.zeroCap()
  result = bufBuffer

proc toString*(self: ptr SteamNetworkingIPAddr, withPort: bool, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var bufBuffer = newString(max(1, steamworksBufferSize))
  self.toStringRaw(bufBuffer[0].addr, bufBuffer.len.uint32, withPort)
  bufBuffer.zeroCap()
  result = bufBuffer

proc toString*(self: ptr SteamNetworkingIdentity, steamworksBufferSize = defaultSteamworksBufferSize): string =
  var bufBuffer = newString(max(1, steamworksBufferSize))
  self.toStringRaw(bufBuffer[0].addr, bufBuffer.len.uint32)
  bufBuffer.zeroCap()
  result = bufBuffer
proc key*(self: MatchMakingKeyValuePair): string =
  steamString(self.key)

proc key*(self: ptr MatchMakingKeyValuePair): string =
  steamString(self[].key)

proc value*(self: MatchMakingKeyValuePair): string =
  steamString(self.value)

proc value*(self: ptr MatchMakingKeyValuePair): string =
  steamString(self[].value)

proc gameDir*(self: GameServerItem): string =
  steamString(self.gameDir)

proc gameDir*(self: ptr GameServerItem): string =
  steamString(self[].gameDir)

proc map*(self: GameServerItem): string =
  steamString(self.map)

proc map*(self: ptr GameServerItem): string =
  steamString(self[].map)

proc gameDescription*(self: GameServerItem): string =
  steamString(self.gameDescription)

proc gameDescription*(self: ptr GameServerItem): string =
  steamString(self[].gameDescription)

proc serverName*(self: GameServerItem): string =
  steamString(self.serverName)

proc serverName*(self: ptr GameServerItem): string =
  steamString(self[].serverName)

proc gameTags*(self: GameServerItem): string =
  steamString(self.gameTags)

proc gameTags*(self: ptr GameServerItem): string =
  steamString(self[].gameTags)

proc title*(self: SteamUGCDetails): string =
  steamString(self.title)

proc title*(self: ptr SteamUGCDetails): string =
  steamString(self[].title)

proc description*(self: SteamUGCDetails): string =
  steamString(self.description)

proc description*(self: ptr SteamUGCDetails): string =
  steamString(self[].description)

proc tags*(self: SteamUGCDetails): string =
  steamString(self.tags)

proc tags*(self: ptr SteamUGCDetails): string =
  steamString(self[].tags)

proc fileName*(self: SteamUGCDetails): string =
  steamString(self.fileName)

proc fileName*(self: ptr SteamUGCDetails): string =
  steamString(self[].fileName)

proc url*(self: SteamUGCDetails): string =
  steamString(self.url)

proc url*(self: ptr SteamUGCDetails): string =
  steamString(self[].url)

proc unknownRawString*(self: SteamNetworkingIdentity): string =
  steamString(self.unknownRawString)

proc unknownRawString*(self: ptr SteamNetworkingIdentity): string =
  steamString(self[].unknownRawString)

proc endDebug*(self: SteamNetConnectionInfo): string =
  steamString(self.endDebug)

proc endDebug*(self: ptr SteamNetConnectionInfo): string =
  steamString(self[].endDebug)

proc connectionDescription*(self: SteamNetConnectionInfo): string =
  steamString(self.connectionDescription)

proc connectionDescription*(self: ptr SteamNetConnectionInfo): string =
  steamString(self[].connectionDescription)

proc url*(self: GameWebCallback): string =
  steamString(self.url)

proc url*(self: ptr GameWebCallback): string =
  steamString(self[].url)

proc url*(self: StoreAuthURLResponse): string =
  steamString(self.url)

proc url*(self: ptr StoreAuthURLResponse): string =
  steamString(self[].url)

proc server*(self: GameServerChangeRequested): string =
  steamString(self.server)

proc server*(self: ptr GameServerChangeRequested): string =
  steamString(self[].server)

proc password*(self: GameServerChangeRequested): string =
  steamString(self.password)

proc password*(self: ptr GameServerChangeRequested): string =
  steamString(self[].password)

proc connect*(self: GameRichPresenceJoinRequested): string =
  steamString(self.connect)

proc connect*(self: ptr GameRichPresenceJoinRequested): string =
  steamString(self[].connect)

proc uri*(self: OverlayBrowserProtocolNavigation): string =
  steamString(self.uri)

proc uri*(self: ptr OverlayBrowserProtocolNavigation): string =
  steamString(self[].uri)

proc connectString*(self: JoinPartyCallback): string =
  steamString(self.connectString)

proc connectString*(self: ptr JoinPartyCallback): string =
  steamString(self[].connectString)

proc filename*(self: RemoteStorageFileShareResult): string =
  steamString(self.filename)

proc filename*(self: ptr RemoteStorageFileShareResult): string =
  steamString(self[].filename)

proc fileName*(self: RemoteStorageDownloadUGCResult): string =
  steamString(self.fileName)

proc fileName*(self: ptr RemoteStorageDownloadUGCResult): string =
  steamString(self[].fileName)

proc title*(self: RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self.title)

proc title*(self: ptr RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self[].title)

proc description*(self: RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self.description)

proc description*(self: ptr RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self[].description)

proc tags*(self: RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self.tags)

proc tags*(self: ptr RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self[].tags)

proc fileName*(self: RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self.fileName)

proc fileName*(self: ptr RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self[].fileName)

proc url*(self: RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self.url)

proc url*(self: ptr RemoteStorageGetPublishedFileDetailsResult): string =
  steamString(self[].url)

proc achievementName*(self: UserAchievementStored): string =
  steamString(self.achievementName)

proc achievementName*(self: ptr UserAchievementStored): string =
  steamString(self[].achievementName)

proc achievementName*(self: UserAchievementIconFetched): string =
  steamString(self.achievementName)

proc achievementName*(self: ptr UserAchievementIconFetched): string =
  steamString(self[].achievementName)

proc key*(self: AppProofOfPurchaseKeyResponse): string =
  steamString(self.key)

proc key*(self: ptr AppProofOfPurchaseKeyResponse): string =
  steamString(self[].key)

proc nextCursor*(self: SteamUGCQueryCompleted): string =
  steamString(self.nextCursor)

proc nextCursor*(self: ptr SteamUGCQueryCompleted): string =
  steamString(self[].nextCursor)

proc currency*(self: SteamInventoryRequestPricesResult): string =
  steamString(self.currency)

proc currency*(self: ptr SteamInventoryRequestPricesResult): string =
  steamString(self[].currency)

proc phaseId*(self: SteamTimelineGamePhaseRecordingExists): string =
  steamString(self.phaseId)

proc phaseId*(self: ptr SteamTimelineGamePhaseRecordingExists): string =
  steamString(self[].phaseId)

proc url*(self: GetVideoURLResult): string =
  steamString(self.url)

proc url*(self: ptr GetVideoURLResult): string =
  steamString(self[].url)

proc connectUrl*(self: SteamRemotePlayTogetherGuestInvite): string =
  steamString(self.connectUrl)

proc connectUrl*(self: ptr SteamRemotePlayTogetherGuestInvite): string =
  steamString(self[].connectUrl)

proc debugMsg*(self: SteamNetAuthenticationStatus): string =
  steamString(self.debugMsg)

proc debugMsg*(self: ptr SteamNetAuthenticationStatus): string =
  steamString(self[].debugMsg)

proc debugMsg*(self: SteamRelayNetworkStatus): string =
  steamString(self.debugMsg)

proc debugMsg*(self: ptr SteamRelayNetworkStatus): string =
  steamString(self[].debugMsg)

proc optionalText*(self: GSClientDeny): string =
  steamString(self.optionalText)

proc optionalText*(self: ptr GSClientDeny): string =
  steamString(self[].optionalText)

proc achievement*(self: GSClientAchievementStatus): string =
  steamString(self.achievement)

proc achievement*(self: ptr GSClientAchievementStatus): string =
  steamString(self[].achievement)
