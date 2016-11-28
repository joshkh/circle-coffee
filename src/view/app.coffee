Backbone = require 'backbone'

class SVG extends Backbone.View

  el: 'body'

  initialize: -> console.log "Created View"

  constructor: (el) -> @setElement el

  render: ->
    @$el.html "Loaded"

module.exports = SVG
