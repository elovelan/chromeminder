'use strict'

define ["jquery","util","models/Goal"], ($, util, Goal) ->
  baseUrl = (resource) ->
    "https://www.beeminder.com/api/v1/#{resource}"

  get = (resource, params) ->
    $.get urlForGet resource, params

  urlForGet = (resource, params) ->
    uriEnc = encodeURIComponent
    if params
      queryString = '?' +
      Object.keys params
      .map (name) -> "#{uriEnc name}=#{uriEnc params[name]}"
        .join '&'
    "#{baseUrl(resource)}.json#{queryString ? ''}"

  getWithAuth = (resource, params = {}) ->
    auth()
    .then (token) ->
        get resource, util.merge auth_token: token, params

  auth = ->
    get 'auth_token'
    .then (obj) ->
        obj.auth_token
      ,(obj) ->
        obj.responseJSON.error

  goals: (type='all') ->
    getWithAuth 'users/me/goals.json', goals_filter: type
      .then (goals) -> Goal.createGoalsArray goals
