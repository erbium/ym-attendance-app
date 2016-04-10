`import Ember from 'ember'`

LeaderboardTempleNamesController = Ember.Controller.extend(
  sortProps: ['totalNames:desc']
  sortedQuorums: Ember.computed.sort('model', 'sortProps')

  ranksArray: Ember.computed 'model.@each.totalNames', ->
    namesArr = for quorum in @get('sortedQuorums').toArray()
      quorum.get('totalNames')
    rank = 1
    ranksArr = for names, index in namesArr
      switch
        when index is 0
          rank
        when names is namesArr[index - 1]
          rank
        else
          rank += 1
    ranksArr
)

`export default LeaderboardTempleNamesController`
