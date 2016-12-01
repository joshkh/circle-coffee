Backbone = require 'backbone'
Participant = require './Participant'

class Link extends Backbone.Model

  initialize: (me) ->
    console.log "LINK", @get("has")

module.exports = Link
