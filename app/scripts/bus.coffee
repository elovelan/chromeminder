'use strict'

define ['jquery'], ($) ->
  subscribe: (messageName) ->
    listener = $.Deferred()
    chrome.runtime.onMessage.addListener (message, sender, responder) ->
      listener.resolve message.data, sender, responder if message.name is messageName
    listener.promise()

  publish: (messageName, data) ->
    responseHandler = $.Deferred()
    chrome.runtime.sendMessage(
      name: messageName
      data: data,
      (responseData) ->
        if not responseData? and chrome.runtime.lastError?
          responseHandler.reject chrome.runtime.lastError
        else
          responseHandler.resolve responseData
    )
    responseHandler.promise()
