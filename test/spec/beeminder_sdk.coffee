define ['beeminder_sdk', 'chai'], (sdk, chai) ->
  requestUrlAssert = (_chai) ->
    _chai.Assertion.addMethod 'callUrl', (url, sandbox) ->
      sdkPromise = this._obj
      sdkPromise.then ->
        sandbox.server.requests.map((req) -> req.url).should.contain.one.with.match url

  chai.use(requestUrlAssert)

  createSandbox = ->
    sandbox = sinon.sandbox.create()
    sandbox.useFakeServer()
    sandbox.server.respondWith /auth_token.json/,
      [
        200
        {"Content-Type": "application/json"}
        '{ "auth_token": "yo" }'
      ]
    sandbox.server.respondWith /goals.json/,
      [
        200
        "Content-Type": "application/json"
        '[]'
      ]
    sandbox.server.autoRespond = true
    sandbox

  test = (fn) ->
    (done) ->
      sandbox = createSandbox()
      fn(sandbox)
      .then -> sandbox.restore()
      .then -> done()

  describe 'sdk', ->
    describe 'authentication', ->
      it 'will authenticate using cookie', test (sandbox) ->
        sdk.goals().should.callUrl /auth_token\.json/, sandbox

    describe 'goals', ->
      it 'will fetch current list of goals from web api', test (sandbox) ->
        sdk.goals().should.callUrl /users\/me\/goals\.json/, sandbox
      it 'will default to fetching all goals', test (sandbox) ->
        sdk.goals().should.callUrl /goals\.json\?.*filter=all/, sandbox
      it 'will fetch goals by goal type', test (sandbox) ->
        sdk.goals('frontburner').should.callUrl /goals\.json\?.*filter=frontburner/, sandbox