import os, strutils
import steamworks

if not fileExists("steam_appid.txt"):
  echo "You need to add steam_appid.txt to the direclty you run this from with your app ID"

var appId = uint32 parseInt(readFile("steam_appid.txt").strip()) # this is a test appId, use ID you get after regesterting on steam.
initSteamworks(appId)


echo "Did steam init ok: ", steamOk
echo "steamAccountId: ", steamAccountId
echo "steamName: ", steamName

echo ""
echo "getAppInstallDir: ", steamApps.getAppInstallDir(appId)
echo "isVACBanned: ", steamApps.BIsVACBanned()
echo "getAppBuildId: ", steamApps.GetAppBuildId()
echo "GetCurrentBetaName: ", steamApps.GetCurrentBetaName()
echo "GetCurrentGameLanguage: ", steamApps.GetCurrentGameLanguage()
echo "GetDLCCount: ", steamApps.GetDLCCount()
var punBytesDownloaded, punBytesTotal: uint64
discard steamApps.GetDlcDownloadProgress(472490, addr punBytesDownloaded, addr punBytesTotal)
echo "GetDlcDownloadProgress: ", punBytesDownloaded, "/", punBytesTotal
echo "GetEarliestPurchaseUnixTime: ", steamApps.GetEarliestPurchaseUnixTime(appId)
echo "GetLaunchQueryParam: ", steamApps.GetLaunchQueryParam("test")

echo "ActivateGameOverlay: DialogType.friends"
steamFriends.ActivateGameOverlay(DialogType.friends)


echo ""

# echo "Steam Friends"
# var friends = getSteamFriends()
# for friend in friends:
#   echo "  name: ", friend.name
#   echo "    accountId: ", friend.accountId
#   echo "    state: ", friend.state
#   echo "    playingAppId: ", friend.playingAppId


# setListenForFriendsMessages(true)
# for friend in friends:
#   if friend.name == "Godde":
#     echo "found you", friend.name
#     sendMessageToFrind(friend, "test1")
#     echo steamFriends.InviteUserToGame(friend.steamId, "this is how it is done")

echo "call backs"

steamUserStats.getNumberOfCurrentPlayers proc(number: int) =
  echo "NumberOfCurrentPlayers: ", number

# discard steamFriends.SetListenForFriendsMessages(true)
# steamFriends.onGameConnectedFriendChatMsg proc(steamId: CSteamID, msgId: cint) =
#   echo "chat msgId: ", msgId
#   const bufferSize: int = 4086
#   var buffer: cstring = cast[cstring](alloc(bufferSize))
#   var entryType: EChatEntryType
#   discard steamFriends.GetFriendMessage(steamId, msgId, buffer, bufferSize, addr entryType)
#   echo "[", entryType, "]: ", buffer
#   if entryType == ChatMsg:
#     echo "steamFriends: ", steamFriends.ReplyToFriendMessage(steamId, "test " & $msgId)

steamFriends.onGameOverlayActivated proc(active: bool) =
  echo "overlay state: ", active

echo "visit steam://run/" & $appId & "//?invite=value1;host=value2;param3=value3;"
steamApps.onNewLaunchQueryParameters proc() =
  echo "invite: ", steamApps.GetLaunchQueryParam("invite")
  echo "host: ", steamApps.GetLaunchQueryParam("host")

while true:
  #echo "running callbacks"
  SteamAPI_RunCallbacks()
  #GetNumberOfCurrentPlayers()
  sleep(100)