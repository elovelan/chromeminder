'use strict'

define ['util', 'lodash'], (util, _) ->
  class Goal
    constructor: (goalDto) ->
      _.assign this, goalDto

    isPanicking: ->
      (@losedate - @panic) < util.unixDate() and not @won

  createGoalsArray: (goalDtoArray) ->
    goalArray = goalDtoArray.map (goalDto) -> new Goal goalDto
    goalArray.panicCount = ->
      @filter (goal) -> goal.isPanicking()
        .length
    goalArray
