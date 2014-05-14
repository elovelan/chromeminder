define ['beeminder_sdk'], (sdk) ->
  describe 'sdk', ->
    describe 'goals', ->
      it 'will fetch current list of goals from web api', sinon.test ->
        sdk.goals().then this.spy()
        this.requests.length.should.equal 1
        this.requests[0].url.match 'users/me/goals.json'
      it 'will default to fetching all goals', sinon.test ->
        sdk.goals().then this.spy()
        this.requests.length.should.equal 1
        this.requests[0].url.match 'goals.json?filter=all'
      it 'will fetch goals by goal type', sinon.test ->
        sdk.goals('frontburner').then this.spy()
        this.requests.length.should.equal 1
        this.requests[0].url.match 'goals.json?filter=frontburner'