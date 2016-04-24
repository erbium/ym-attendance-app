`import Ember from 'ember'`

LeaderboardTempleNamesRoute = Ember.Route.extend(
  model: ->
    @store.findAll('entry')
    @store.findAll('person')
)

`export default LeaderboardTempleNamesRoute`
