'use strict'

define ['util', 'chai'], (util, chai) ->
  should = chai.should()
  
  describe 'in utility functions', ->
    describe 'merge will return a new merged object from the incoming objects', ->
      it 'will contain the properties of both objects', ->
        obj1 = {say: 'hello'}
        obj2 = {trust: 'me'}
        newobj = util.merge obj1, obj2
        newobj.should.have.property 'say'
        newobj.should.have.property 'trust'
      it 'will not modify the existing objects', ->
        obj1 = {say: 'hello'}
        obj2 = {trust: 'me'}
        newobj = util.merge obj1, obj2
        should.not.exist obj1.trust
        should.not.exist obj2.say
    describe 'unixTime will return the current Unix date', ->
      it 'will return current the number of seconds since the UTC epoch', ->
        # todo: probably should stub a known value for date?
        # buffer each side by a second to provide for rounding
        beforeUnixDateMilliseconds = Date.now() - 1000
        unixDateMilliseconds = util.unixDate() * 1000
        afterUnixDateMilliseconds = Date.now() + 1000
        unixDateMilliseconds.should.be.within(beforeUnixDateMilliseconds, afterUnixDateMilliseconds)
