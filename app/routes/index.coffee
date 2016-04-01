`import Ember from 'ember'`

indexRoute = Ember.Route.extend
  init: ->
    @store.findAll('quorum').then (arg) =>
      if arg.toArray().length is 0
        @initQuorums()

  initQuorums: ->
    quorums = ['deacons', 'teachers', 'priests']
    for quorumName in quorums
      @store.createRecord('quorum', {name: quorumName}).save()

`export default indexRoute`
