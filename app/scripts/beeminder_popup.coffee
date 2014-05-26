'use strict'

define ['beeminder_sdk','jquery'], (sdk, $) ->
  mainDiv = $('#goalnum')[0]
  sdk.auth()
    .then ->
      mainDiv.innerText = "success"
    ,(msg) ->
      mainDiv.innerText = msg

