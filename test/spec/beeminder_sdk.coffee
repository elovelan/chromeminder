define ['beeminder_sdk', 'test_helpers'], (sdk, test_helpers) ->
  test = (sandboxfn) ->
    test_helpers.testWithSandbox () ->
      (sandbox) ->
        sandbox.jsonResponse /auth_token.json/, '{ "auth_token": "yo" }'
        sandbox.jsonResponse /goals.json/, '[]'
        sandboxfn()(sandbox)

  describe 'sdk', ->
    describe 'authentication', ->
      it 'will authenticate using cookie', test ->
        sdk.goals().should.callUrl /auth_token\.json/

    describe 'goals', ->
      it 'will fetch current list of goals from web api', test ->
        sdk.goals().should.callUrl /users\/me\/goals\.json/
      it 'will default to fetching all goals', test ->
        sdk.goals().should.callUrl /goals\.json\?.*filter=all/
      it 'will fetch goals by goal type', test ->
        sdk.goals('frontburner').should.callUrl /goals\.json\?.*filter=frontburner/
