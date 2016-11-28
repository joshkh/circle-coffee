Backbone = require 'backbone'

class Participant extends Backbone.Model

  initialize: ->
    console.log "Participant init"
    
module.exports = Participant
