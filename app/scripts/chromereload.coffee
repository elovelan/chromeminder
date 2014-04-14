'use strict'

###
Reload client for Chrome Apps & Extensions.
The reload client has a compatibility with livereload.
WARNING: only supports reload command.
###

LIVERELOAD_HOST = 'localhost:'
LIVERELOAD_PORT = 35729
connection = new WebSocket('ws://' + LIVERELOAD_HOST + LIVERELOAD_PORT + '/livereload')

connection.onerror = (event) -> console.log('reload connection got error' + JSON.stringify(event))

connection.onmessage = (event) ->
    if event.data
        data = JSON.parse(event.data)
        chrome.runtime.reload() if data and data.command is 'reload'
