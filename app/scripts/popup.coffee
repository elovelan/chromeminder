'use strict'

requirejs.config
  baseUrl: "scripts"
  paths:
    jquery: "../bower_components/jquery/dist/jquery"
    _: "../bower_components/lodash/dist/lodash"

requirejs ['beeminder_popup']
