`import Ember from 'ember'`

LeaderboardServiceHoursController = Ember.Controller.extend(
  sortProps: ['totalHours:desc']
  sortedQuorums: Ember.computed.sort('model', 'sortProps')
)

`export default LeaderboardServiceHoursController`
