`import Ember from 'ember'`

AdminEditNewRoute = Ember.Route.extend(
  model: -> @store.createRecord 'person'
)

`export default AdminEditNewRoute`
