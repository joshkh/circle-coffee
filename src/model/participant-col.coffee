Backbone = require 'backbone'
Participant = require './participant'

class ParticipantCollection extends Backbone.Collection

  model: Participant

module.exports = ParticipantCollection
