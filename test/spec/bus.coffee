define ['bus'], (bus) ->
  describe 'in bus functions', ->
    it 'will do something', sinon.test ->
      chromeFake =
        runtime:
          sendMessage: ->
          onMessage:
            addListener: ->

      window.chrome = this.stub(window.chrome ? chromeFake)

