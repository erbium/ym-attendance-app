`import Ember from 'ember'`

# This function receives the params `params, hash`
rankIndex = (index) ->
  index[0] + 1

RankIndexHelper = Ember.Helper.helper rankIndex

`export { rankIndex }`

`export default RankIndexHelper`
