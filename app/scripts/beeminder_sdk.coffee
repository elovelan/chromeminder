'use strict'

define ["jquery","lodash","auth"], ($, _, auth) ->
  apiToken = auth.token()

  merge = (objects...) ->
    initialVal = {}
    objects.reduce (prev, curr) ->
      _.assign prev, curr
    ,initialVal

  uriOf = window.encodeURIComponent

  get = (resource, params={}) ->
    getParams = merge params, 'auth_token': apiToken
    urlParams = _(getParams)
                .map (value, name) -> "#{uriOf name}=#{uriOf value}"
                .join '&'
    $.get "https://www.beeminder.com/api/v1/#{resource}?#{urlParams}"

  goals: (type='all') ->
    get 'users/me/goals.json', goals_filter: type
