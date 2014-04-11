'use strict'

define
  unixDate: ->
    new Date().getTime() // 1000
  merge: (objects...) ->
    initialVal = {}
    objects.reduce _.assign, initialVal
