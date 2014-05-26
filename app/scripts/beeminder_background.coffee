'use strict'

define ["beeminder_sdk", "auth", "bus"], (sdk, auth, bus) ->
  panicCountText = (goals) ->
    panicCount = goals.panicCount()
    if panicCount is 0 then "" else "#{panicCount}"

  sdk.goals()
    .then (goals) ->
       chrome.browserAction.setBadgeText text: panicCountText(goals)
