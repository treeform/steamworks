# Steamworks for Nim

`nimby install steamworks`

![Github Actions](https://github.com/treeform/steamworks/workflows/Github%20Actions/badge.svg)

[API reference](https://treeform.github.io/steamworks)

This library has no dependencies other than the Nim standard library.

## About

Steamworks is a Nim wrapper for Valve's Steamworks API under the MIT license.

This is everything you need to use the various team tools from your Nim game.
The bindings are slightly changed to feel comfortable in Nim and not just draw C definitions.
This are generated bindings that read direclty from the Steamworks SDK specification and emits the equivalent Nim API.

## Nim-Friendly API

The generated API is shaped for Nim instead of exposing the C names directly.
Steam prefixes and suffixes such as `m_`, `k_`, `k_E`, `k_i`, `k_c`, `k_cb`,
and `_t` are removed where possible. For example, C-style names become Nim-style
names such as `AppId`, `friendFlagImmediate`, `apiCallInvalid`,
`numberOfCurrentPlayersCallbackId`, and `playerCount.data.success`.

String-heavy APIs are also wrapped. When Steam expects a fixed `char` buffer,
mutable `char*` plus a size, a `const char*`, `char**`, or
`SteamParamStringArray`, the public wrapper uses Nim `string` or
`openArray[string]` wherever the SDK signature makes that safe. The raw C import
is kept privately with a `Raw` suffix when a nicer public wrapper is generated.

## Getting Started

### Step 1 - Download the Steamworks SDK

Download the C++ SDK from Valve:

https://partner.steamgames.com/downloads/list

Copy the correct Steam API dynamic library for your platform next to your game
or make sure it is on your library path:

- Windows 64-bit: `steam_api64.dll`
- Windows 32-bit: `steam_api.dll`
- macOS: `libsteam_api.dylib`
- Linux: `libsteam_api.so`

### Step 2 - Add `steam_appid.txt`

Put a `steam_appid.txt` file in the directory you run from. It should contain
your Steam app ID number without spaces.

### Step 3 - Run the Smoke Tests

```bash
nim r tests/test.nim
nim r tests/test2.nim
```

`tests/test.nim` is the older human-readable test. `tests/test2.nim` is a broad
smoke test that touches many more Steamworks surfaces when the current account
and app setup allow it.

## Supported Steam Interfaces

The table below uses the Steamworks SDK interface names. "Full support" means
the interface methods present in `steam_api.json` are generated into Nim. A
warning means the binding is generated, but useful runtime behavior depends on
app configuration, connected hardware, callback plumbing, or a dedicated server
environment. Status uses ✅ for full generated support, ⚠️ for generated support
with runtime or integration caveats, and ❌ for interfaces that are not
currently supported. No SDK 1.64 interface in `steam_api.json` is intentionally
omitted.

| Steam interface | Status | Notes |
| --- | --- | --- |
| `ISteamClient` | ✅ | Full support. Interface accessors, IPC count, and warning hook bindings are generated. |
| `ISteamUser` | ✅ | Full support. Login state, Steam ID, auth ticket, voice, license, duration-control, and related user APIs are generated. |
| `ISteamFriends` | ✅ | Full support. Persona, friends, clans, rich presence, avatars, followers, and overlay methods are generated. |
| `ISteamUtils` | ✅ | Full support. Modern utils surface is generated, including images, API call helpers, overlay state, text filtering, gamepad text, Steam UI language, IPv6 state, and Steam Deck checks. |
| `ISteamMatchmaking` | ✅ | Full support. Favorites, lobby search, lobby data, lobby chat, and lobby ownership methods are generated. |
| `ISteamMatchmakingServers` | ⚠️ | Generated support. Server-list requests require callback response objects and live server-query setup to test meaningfully. |
| `ISteamMatchmakingServerListResponse` | ⚠️ | Generated support. Callback interface for server-list responses; useful only when wired into matchmaking server queries. |
| `ISteamMatchmakingPingResponse` | ⚠️ | Generated support. Callback interface for ping queries; requires live server query plumbing. |
| `ISteamMatchmakingPlayersResponse` | ⚠️ | Generated support. Callback interface for player-detail queries; requires live server query plumbing. |
| `ISteamMatchmakingRulesResponse` | ⚠️ | Generated support. Callback interface for server-rule queries; requires live server query plumbing. |
| `ISteamParties` | ⚠️ | Generated support. Party beacon APIs depend on party/beacon configuration and active sessions. |
| `ISteamRemoteStorage` | ✅ | Full support. File, quota, cloud, UGC cache, publish/update, and local-change APIs are generated; cloud results depend on app Steam Cloud setup. |
| `ISteamUserStats` | ✅ | Full support for SDK 1.64. Stats, achievements, achievement metadata, global stats, and leaderboard methods are generated. Removed old-SDK calls such as `RequestCurrentStats` are not shimmed. |
| `ISteamApps` | ✅ | Full support. Subscription, language, DLC, depots, install directory, beta, launch, file-details, and timed-trial APIs are generated. |
| `ISteamNetworking` | ✅ | Full support for the legacy networking interface methods present in SDK 1.64. |
| `ISteamScreenshots` | ✅ | Full support. Screenshot writing, library insertion, tagging, hook state, and VR screenshot methods are generated. |
| `ISteamMusic` | ✅ | Full support. Playback, pause/next/previous, status, enabled state, and volume methods are generated. |
| `ISteamHTTP` | ✅ | Full support. Request creation, headers, parameters, send, body/header reads, cookies, timeouts, and release methods are generated. |
| `ISteamInput` | ⚠️ | Generated support. Runtime results depend on connected controllers and action manifests. |
| `ISteamController` | ⚠️ | Generated support. Runtime results depend on connected controller devices and legacy controller configuration. |
| `ISteamUGC` | ✅ | Full support. Query, result inspection, tags, previews, item update, subscribe/download/state, and dependency APIs are generated; some calls require workshop permissions or legal agreement state. |
| `ISteamHTMLSurface` | ⚠️ | Generated support. Browser lifecycle and interaction methods are generated; meaningful testing requires an HTML surface/browser workflow. |
| `ISteamInventory` | ⚠️ | Generated support. Inventory result, item definition, price, purchase, promo, exchange, and property APIs are generated; useful results require Steam Inventory configuration for the app. |
| `ISteamTimeline` | ⚠️ | Generated support. Timeline events and game phase APIs are generated; runtime behavior depends on the Steam timeline feature and app integration. |
| `ISteamVideo` | ⚠️ | Generated support. Broadcast and OPF/video URL APIs are generated; useful results depend on video/broadcast setup. |
| `ISteamParentalSettings` | ✅ | Full support. Parental lock, app block-list, and feature block-list checks are generated. |
| `ISteamRemotePlay` | ⚠️ | Generated support. Session and input APIs are generated; useful results require active Remote Play sessions. |
| `ISteamNetworkingMessages` | ⚠️ | Generated support. Message send/receive/session APIs are generated; integration tests need peers or loopback session setup. |
| `ISteamNetworkingSockets` | ⚠️ | Generated support. Connection, listen socket, poll group, auth, fake IP, and callback APIs are generated; low-level networking still needs app-specific integration tests. |
| `ISteamNetworkingUtils` | ✅ | Full support. Relay status, ping locations, POPs, identity/IP string conversion, config values, and callback registration methods are generated. |
| `ISteamGameServer` | ⚠️ | Generated support. Requires a game-server initialization/login environment for meaningful runtime testing. |
| `ISteamGameServerStats` | ⚠️ | Generated support. Requires game-server stats flow and server login state. |
| `ISteamNetworkingFakeUDPPort` | ⚠️ | Generated support. Fake UDP port methods are generated; useful runtime coverage requires fake-IP/socket setup. |
