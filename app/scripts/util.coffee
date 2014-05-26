'use strict'

define ["_"], (_) ->
  unixDate: ->
    Date.now() // 1000
  merge: (objects...) ->
    initialVal = {}
    objects.reduce _.assign, initialVal