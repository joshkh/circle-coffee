Backbone = require 'backbone'

AppView = require './view/app'

class abc
  constructor: (el) ->
    view = new AppView(el).render()

module.exports = abc
