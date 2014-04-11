'use strict'

define ["jquery","util","auth","models/Goal"], ($, util, auth, Goal) ->
  apiToken = auth.token()

  baseUrl = (resource) ->
    "https://www.beeminder.com/api/v1/#{resource}"

  get = (resource, params={}) =>
    $.get urlForGet resource, params

  urlForGet = (resource, params={}) ->
    allParams = util.merge params, 'auth_token': apiToken
    uriEnc = encodeURIComponent
    urlParams =
      Object.keys allParams
        .map (name) -> "#{uriEnc name}=#{uriEnc allParams[name]}"
        .join '&'
    "#{baseUrl(resource)}?#{urlParams}"

  goals: (type='all') ->
    get 'users/me/goals.json', goals_filter: type
      .then (goals) -> Goal.createGoalsArray goals
  urlForGet: urlForGet
