# Steamworks - wrapper for nim.

`nimble install steamworks`

![Github Actions](https://github.com/treeform/steamworks/workflows/Github%20Actions/badge.svg)

[API reference](https://nimdocs.com/treeform/steamworks)

This library has no dependencies other than the Nim standard libarary.

## About

Steamworks is a nim Wrapper for Valve’s Steamworks API under the MIT license!

## Getting started

### Step 1 - Download the C++ SDK from Valve.

Go to https://partner.steamgames.com/downloads/list and download Steamworks SDK is version 1.42, released on Jan 3, 2018 into your repo.
Uncompress it, structure should look some thing like this:

steamworks/
 * src/
 * tests/
 * steamworks.nimble
 * README.md
 * LICENSE
 * steamworks_sdk_142

### Step 2 - Make sure to use `cpp --cc:vcc`

You need to use C++ mode and the Microsoft Visual C++ compiler:

`nim cpp -r --cc:vcc`

### Step 3 - steam_appid.txt

You need to add steam_appid.txt file to the directory you run this from. It needs to contain your SteamApp ID number without spaces.

## Step 4 - run the test script

`nim c -r "tests\test.nim"`


## Features

This wrapper supports following things:

* Getting steam account and username.
* Getting app installed dir.
* Gettting vac ban status.
* Getting app build ID.
* Getting Beta Name.
* Getting Current Language.
* Getting DLC count, purchise information, and install progress.
* Getting Launch Query Param and ability to get invited to a game.
* Activating the overlay. Overlay allows you to chat with friends, configure controllers, take screenshots, stream the game, buy DLC and more...
* Getting friends count and their account, names and ingame information.
* Ability to listen for friend message and replying (sending first message is not possible with steam SDK)
* Getting number of current players playing the game.
