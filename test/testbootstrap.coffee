'use strict'

requirejs.config
  baseUrl: '/app/scripts'
  paths:
    spec: "/test/spec"
    jquery: "/app/bower_components/jquery/dist/jquery"
    _: "/app/bower_components/lodash/dist/lodash"
    chai: "/test/bower_components/chai/chai"
    chaiThings: "/node_modules/chai-things/lib/chai-things"
    chaiAsPromised: "/test/bower_components/chai-as-promised/lib/chai-as-promised"
    test_helpers: "/test/helpers/test_helpers"

require ['chai', 'chaiThings', 'chaiAsPromised'], (chai, chaiThings, chaiAsPromised) ->
  chai.should()
  chai.use(chaiThings)
  chai.use(chaiAsPromised)
  mocha.setup 'bdd'

  require [
    'spec/util'
    'spec/beeminder_sdk'
  ], ->
    mocha.run()
