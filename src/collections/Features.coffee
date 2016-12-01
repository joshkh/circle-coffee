Backbone = require 'backbone'
_ = require 'underscore'
Feature = require '../models/Feature'

class Features extends Backbone.Collection

  model: Feature

module.exports = Features
