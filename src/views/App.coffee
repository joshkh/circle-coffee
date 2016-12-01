ZBackbone = require 'backbone'

class SVG extends Backbone.View

  el: 'body'

  constructor: (el) -> @setElement el

  render: ->
    @$el.html "Loaded into " + @$el
    @

module.exports = SVG
