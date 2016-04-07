`import Ember from 'ember'`

AdminEditIndexRoute = Ember.Route.extend(
  model: ->
    @store.findAll('quorum') # load quorums in case they didn't come with
    @store.findAll('person')
)

`export default AdminEditIndexRoute`
