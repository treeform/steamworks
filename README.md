# Steamworks - wrapper for nim.

`nimble install steamworks`

![Github Actions](https://github.com/treeform/steamworks/workflows/Github%20Actions/badge.svg)

[API reference](https://nimdocs.com/treeform/steamworks)

This library has no dependencies other than the Nim standard library.

## About

Steamworks is a nim Wrapper for Valve’s Steamworks API under the MIT license!

## Getting started

### Step 1 - Download the C++ SDK from Valve.

Go to https://partner.steamgames.com/downloads/list and download Steamworks SDK, unzip the files and you will need the DLLs for your system, steam_api.dll to be always next to your game.

### Step 2 - steam_appid.txt

You need to add steam_appid.txt file to the directory you run this from. It needs to contain your SteamApp ID number without spaces.

## Step 3 - run the test script

`nim c -r "tests\test.nim"`

## Features

This wrapper supports following things so far:

* Getting steam account and username.
* Getting friends count and their account, names and in-game information.
* Weather a DLC is installed.
* Getting app installed dir.
* Getting vac ban status.
* Getting app build ID.
* Getting app owner.
* Getting Beta Name.
* Getting Current Language.
* Getting number of current players playing the game.
