'use strict'

requirejs.config
  baseUrl: '/app/scripts'
  paths:
    spec: "/test/spec"
    jquery: "/app/bower_components/jquery/dist/jquery"
    _: "/app/bower_components/lodash/dist/lodash"
    chai: "/test/bower_components/chai/chai"

require ['chai'], (chai) ->
  chai.should()
  mocha.setup 'bdd'

  require [
    'spec/util'
    'spec/beeminder_sdk'
  ], ->
    mocha.run()
