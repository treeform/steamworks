# Steamworks - wrapper for nim.

Steamworks is a nim Wrapper for Valve’s Steamworks API under the MIT license!

## Getting started

### Step 1 - Download the C++ SDK from Valve.

Go to https://partner.steamgames.com/downloads/list and download Steamworks SDK is version 1.42, released on Jan 3, 2018 into your repo.
Uncompress it, structure should look some thing like this:

steamworks
 * src
 * steamworks.nimbe
 * README.md
 * LICENSE
 * steamworks_sdk_142

### Step 2 - Make sure to use `cpp --cc:vcc`

 You need to use C++ mode and the Microsoft Visual C++ compiler:

 `nim cpp -r --cc:vcc`

### Step 3 - steam_appid.txt

You need to add steam_appid.txt file to the directory you run this from. It needs to contain your Steam App ID number without spaces.
