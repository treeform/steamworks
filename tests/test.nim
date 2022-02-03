import steamworks, os

if Init() == false:
  echo "Please start steam client."
  quit()
else:
  echo "Steam is running!."

var steamApps = SteamApps()
echo "has DLC: ", steamApps.isDlcInstalled(614180)
echo "no  DLC: ", steamApps.isDlcInstalled(614180 + 1)
echo "install dir: ", steamApps.getAppInstallDir(449140)

var steamFriends = SteamFriends()
echo "steam user: ", steamFriends.getPersonaName()

var steamUser = SteamUser()
echo "steam id: ", steamUser.getSteamID()

let numFriends = steamFriends.getFriendCount(FriendFlagImmediate.cint)
echo "friend count: ", numFriends
for i in 0 ..< numFriends:
  let friendSteamId = steamFriends.getFriendByIndex(i, FriendFlagImmediate.cint)
  let friendName = steamFriends.getFriendPersonaName(friendSteamId)
  echo i, " friendSteamId: ", friendSteamId, " ", friendName

# Example on how call backs work:

var steamUserStats = SteamUserStats()
var call = steamUserStats.getNumberOfCurrentPlayers()

echo cast[int](call)
let steamUtils = SteamUtils()
var
  numberOfCurrentPlayers: NumberOfCurrentPlayers
  failed: bool

RunCallbacks()

while not steamUtils.isAPICallCompleted(call, failed.addr):
  echo "zzz"
  RunCallbacks()
  sleep(1)

const k_iSteamUserStatsCallbacks = 1100 + 7

echo "get results: ", steamUtils.getAPICallResult(call, numberOfCurrentPlayers.addr, sizeof(numberOfCurrentPlayers).cint, k_iSteamUserStatsCallbacks.cint, failed.addr)
echo "failed ", failed
echo "numberOfCurrentPlayers: ", numberOfCurrentPlayers
