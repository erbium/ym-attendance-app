`import Ember from 'ember'`

LeaderboardServiceHoursRoute = Ember.Route.extend(
  model: ->
    @store.findAll('entry')
    @store.findAll('person')
)

`export default LeaderboardServiceHoursRoute`
