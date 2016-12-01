Backbone = require 'backbone'
_ = require 'underscore'
Interactor = require '../models/Interactor'

class Interactors extends Backbone.Collection

  model: Interactor

module.exports = Interactors
