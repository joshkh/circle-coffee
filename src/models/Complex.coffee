Backbone = require 'backbone'
_ = require 'underscore'
Participants = require '../collections/Participants'
Interactors = require '../collections/Interactors'
parse = require '../utils/parse'
Link = require '../models/Link'

class Complex extends Backbone.Model


  initialize: ({data: data}) ->

    @set
      interactors: new Interactors parse.interactors data
      participants: new Participants parse.participants data

    @linkInteractorsToParticipants()
    @parseLinks()


  # When called, all Participants in this complex will be given
  # an "interactor" which links to the Interactor model representing
  # the Participant
  linkInteractorsToParticipants: ->

    # Map over our participants and assign a link to their Interactor
    @get("participants").map (p) =>
      p.set interactor: @get("interactors").get(p.get("interactorRef"))

  parseLinks: ->

    # Build a map of feature ids and their parent participant id
    featureMap = {}
    @get("participants").map (p) ->
      p.get("features").map (f) ->
        featureMap[parseInt f.get("id")] = parseInt p.get("id")

    # links = {}
    # # Look through the participants and build links
    # @get("participants").map (p) =>
    #   ids = _.pick featureMap, p.get("features").map (f) -> f.get("id")
    #   _.mapObject ids, (featureId, participantId) =>
    #     console.log "GOT", @get("participants").get(8).get("features").at(1)






module.exports = Complex
