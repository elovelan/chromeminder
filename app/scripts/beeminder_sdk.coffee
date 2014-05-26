'use strict'

define ["jquery","util","auth","models/Goal"], ($, util, auth, Goal) ->
  apiToken = auth.token()

  baseUrl = (resource) ->
    "https://www.beeminder.com/api/v1/#{resource}"

  get = (resource, params={}) =>
    $.get urlForGet resource, params

  urlForGet = (resource, params={}) ->
    uriEnc = encodeURIComponent
    urlParams =
      Object.keys params
        .map (name) -> "#{uriEnc name}=#{uriEnc params[name]}"
        .join '&'
    "#{baseUrl(resource)}?#{urlParams}"

  getWithAuth = (resource, params = {}) ->
    get resource, util.merge auth_token: apiToken, params

  goals: (type='all') ->
    getWithAuth 'users/me/goals.json', goals_filter: type
      .then (goals) -> Goal.createGoalsArray goals
