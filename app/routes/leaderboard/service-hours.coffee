`import Ember from 'ember'`

LeaderboardServiceHoursRoute = Ember.Route.extend(
  model: ->
    @store.findAll('person')
    @store.findAll('entry')
    @store.findAll('quorum')
)

`export default LeaderboardServiceHoursRoute`
