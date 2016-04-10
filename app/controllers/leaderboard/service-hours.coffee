`import Ember from 'ember'`

LeaderboardServiceHoursController = Ember.Controller.extend(
  sortProps: ['totalHours:desc']
  sortedQuorums: Ember.computed.sort('model', 'sortProps')

  ranksArray: Ember.computed 'model.@each.totalHours', ->
    hoursArr = for quorum in @get('sortedQuorums').toArray()
      quorum.get('totalHours')
    rank = 1
    ranksArr = for hours, index in hoursArr
      switch
        when index is 0
          rank
        when hours is hoursArr[index - 1]
          rank
        else
          rank += 1
    ranksArr
)

`export default LeaderboardServiceHoursController`
