# Steamworks - wrapper for nim.

`nimble install steamworks`

![Github Actions](https://github.com/treeform/steamworks/workflows/Github%20Actions/badge.svg)

[API reference](https://treeform.github.io/steamworks)

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

* Basic info
    * steam account and username.
    * app install dir
    * app build ID
    * app beta name
    * app owner
    * vac ban status
    * current Language
    * number of current players
* Friends
    * counts
    * accounts
    * names
    * in-game information.
* DLCs
    installed status
