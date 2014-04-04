'use strict'

define ["beeminder_sdk", "auth", "bus"], (sdk, auth, bus) ->
  unixDate = ->
    new Date().getTime() // 1000

  sdk.goals()
     .then (goals) ->
        panicCount =
          goals
            .filter (goal) ->
               # logic from beemios
               {won, losedate, panic} = goal
               (losedate - panic) < unixDate() and not won
            .length

        chrome.browserAction.setBadgeText text: "#{if panicCount is 0 then "" else panicCount}"
