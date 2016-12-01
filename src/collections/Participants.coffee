Backbone = require 'backbone'
_ = require 'underscore'
Participant = require '../models/Participant'

class Participants extends Backbone.Collection

    model: Participant

module.exports = Participants
