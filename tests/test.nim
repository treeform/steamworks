import std/[os, strutils]

import steamworks

const
  istrolidAppId = AppId(449140)
  exampleDlcAppId = AppId(614180)

var initError: string
let initResult = InitFlat(initError)
if initResult != initOk:
  echo "Steam API init failed: ", initResult, " ", initError
  quit(1)

echo "Steam is running: ", IsSteamRunning()

let
  steamApps = SteamApps()
  steamFriends = SteamFriends()
  steamUGC = SteamUGC()
  steamUser = SteamUser()
  steamUserStats = SteamUserStats()
  steamUtils = SteamUtils()

echo "current app id: ", steamUtils.getAppId()
echo "steam id: ", steamUser.getSteamId()
echo "logged on: ", steamUser.loggedOn()
let
  persona: string = steamFriends.getPersonaName()
  language: string = steamApps.getCurrentGameLanguage()
  availableLanguages: string = steamApps.getAvailableGameLanguages()

echo "persona: ", persona
echo "language: ", language
echo "available languages: ", availableLanguages
echo "app installed: ", steamApps.isAppInstalled(istrolidAppId)
echo "app install dir: ", steamApps.getAppInstallDir(istrolidAppId)
echo "app build id: ", steamApps.getAppBuildId()
echo "app owner: ", steamApps.getAppOwner()
echo "VAC banned: ", steamApps.isVacBanned()
echo "example DLC installed: ", steamApps.isDlcInstalled(exampleDlcAppId)

let depots = steamApps.getInstalledDepots(istrolidAppId)
echo "installed depots: ", depots.join(", ")

let dlcCount = steamApps.getDlcCount()
echo "DLC count: ", dlcCount
for i in 0 ..< min(dlcCount.int, 10):
  let dlc = steamApps.getDlcDataByIndex(i)
  echo "DLC #", i, ": app=", dlc.appId, " available=", dlc.available,
    " name=", dlc.name

let friendCount = steamFriends.getFriendCount(friendFlagImmediate.cint)
echo "friend count: ", friendCount
for i in 0 ..< min(friendCount.int, 10):
  let friendSteamId = steamFriends.getFriendByIndex(
    i.cint,
    friendFlagImmediate.cint
  )
  echo "friend #", i, ": ", friendSteamId, " ",
    steamFriends.getFriendPersonaName(friendSteamId)

let subscribedItems = steamUGC.getSubscribedItems()
echo "subscribed workshop items: ", subscribedItems.len
for i, item in subscribedItems[0 ..< min(subscribedItems.len, 5)]:
  let install = steamUGC.getItemInstallInfo(item)
  echo "workshop #", i, ": ", item, " state=", steamUGC.getItemState(item),
    " installed=", install.ok, " folder=", install.folder

let playerCountCall = steamUserStats.getNumberOfCurrentPlayers()
if playerCountCall != apiCallInvalid:
  let playerCount = waitForApiCall[NumberOfCurrentPlayers](
    steamUtils,
    playerCountCall,
    numberOfCurrentPlayersCallbackId
  )
  echo "current players callback: ok=", playerCount.ok,
    " failed=", playerCount.failed,
    " timedOut=", playerCount.timedOut,
    " success=", playerCount.data.success,
    " players=", playerCount.data.players

Shutdown()
