import os, strutils
import steamworks

proc initSteamChecker() {.stdcall,exportc,dynlib.} =
  if not fileExists("steam_appid.txt"):
    echo "You need to add steam_appid.txt to the direclty you run this from with your app ID"
  var appId = uint32 parseInt(readFile("steam_appid.txt").strip()) # this is a test appId, use ID you get after regesterting on steam.
  initSteamworks(appId)

proc getSteamAccountId(): uint32 {.stdcall,exportc,dynlib.} =
  return steamAccountId

proc getSteamAccountName(): cstring {.stdcall,exportc,dynlib.} =
  return steamUsername

proc isDlcInstalled(dlc: uint32): bool {.stdcall,exportc,dynlib.} =
    steamApps.BIsDlcInstalled(dlc)

