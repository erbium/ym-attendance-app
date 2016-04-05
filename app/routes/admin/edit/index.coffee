`import Ember from 'ember'`

AdminEditIndexRoute = Ember.Route.extend(
  model: -> @store.findAll('person')
)

`export default AdminEditIndexRoute`
