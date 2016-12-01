_ = require 'underscore'
Participant = require '../models/Participant'
Participants = require '../collections/Participants'
Complex = require '../models/Complex'

participants = (json) ->
  _.find json, (d) -> d.object is "interaction"
    .participants

interactors = (json) ->
  _.filter json, (d) -> d.object is "interactor"

module.exports = {participants, interactors}
