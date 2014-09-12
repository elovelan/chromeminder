define ['chai'], (chai) ->
  requestUrlAssert = (_chai) ->
    _chai.Assertion.addMethod 'callUrl', (url) ->
      (sandbox) =>
        sdkPromise = this._obj
        sdkPromise.then ->
          sandbox.server.requests.map((req) -> req.url).should.contain.one.with.match url

  chai.use(requestUrlAssert)

  sinon.sandbox.jsonResponse = (urlRegEx, response) ->
    this.server.respondWith urlRegEx,
      [
        200
        {"Content-Type": "application/json"}
        response
      ]

  createSandbox = ->
    sandbox = sinon.sandbox.create()
    sandbox.useFakeServer()
    sandbox.server.autoRespond = true
    sandbox

  # fn must return a function that operates on a sandbox
  testWithSandbox: (fn) ->
    ->
      sandbox = createSandbox()
      fn()(sandbox)
        .then -> sandbox.restore()
