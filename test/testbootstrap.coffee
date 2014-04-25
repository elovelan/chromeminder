'use strict'

requirejs.config
  baseUrl: 'scripts'
  paths:
    spec: "../spec"
    jquery: "../bower_components/jquery/dist/jquery"
    _: "../bower_components/lodash/dist/lodash"
    chai: "../bower_components/chai/chai"

require ['chai'], (chai) ->
  chai.should()
  mocha.setup 'bdd'

  require [
    'spec/util'
  ], ->
    mocha.run()
