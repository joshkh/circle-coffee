Backbone = require 'backbone'
_ = require 'underscore'
Link = require '../models/Link'

class Links extends Backbone.Collection

  model: Link

module.exports = Links
