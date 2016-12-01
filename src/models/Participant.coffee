Backbone = require 'backbone'
_ = require 'underscore'
Features = require '../collections/Features'

class Participant extends Backbone.Model

  constructor: (attributes) ->

    # Upgrade features attribute to a Features collection
    attributes.features = new Features attributes.features


    # Parse string attributes into integer attributes
    attributes.stoichiometry = parseInt attributes.stoichiometry
    attributes.id = parseInt attributes.id

    # Apply the initial attributes to the model
    # (since we replaced the constructor)
    Backbone.Model.apply @, arguments


module.exports = Participant
