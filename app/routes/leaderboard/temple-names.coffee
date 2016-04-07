`import Ember from 'ember'`

LeaderboardTempleNamesRoute = Ember.Route.extend(
  model: ->
    @store.findAll('person')
    @store.findAll('entry')
    @store.findAll('quorum')
)

`export default LeaderboardTempleNamesRoute`
