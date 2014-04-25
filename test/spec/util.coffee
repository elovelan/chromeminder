'use strict'

define ['util', 'chai'], (util, chai) ->
  should = chai.should()
  
  describe 'in utility functions', ->
    describe 'merge will return a new merged object from the incoming objects', ->
      it 'will not modify the existing objects', ->
        obj1 = {say: 'hello'}
        obj2 = {trust: 'me'}
        newobj = util.merge obj1, obj2
        should.not.exist obj1.trust
        should.not.exist obj2.say
