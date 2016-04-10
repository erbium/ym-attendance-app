`import Ember from 'ember'`

# This function receives the params `params, hash`
rankIndex = (args) ->
  index = args[0]
  ranksArray = args[1]
  ranksArray[index]

RankIndexHelper = Ember.Helper.helper rankIndex

`export { rankIndex }`

`export default RankIndexHelper`
