define ['auth'], (auth) ->
  describe 'in auth functions', ->
    describe 'token', ->
      it 'will return current an auth token', ->
        auth.token().should.be.a('string')
