`import Ember from 'ember'`

LeaderboardTempleNamesController = Ember.Controller.extend(
  sortProps: ['totalNames:desc']
  sortedQuorums: Ember.computed.sort('model', 'sortProps')
)

`export default LeaderboardTempleNamesController`
