`import Ember from 'ember'`

AdminEditPersonRoute = Ember.Route.extend(
  model: (params) ->
    personQuery = @store.query('person', { name: params.person_name })
    personQuery.then (person) -> person.get('firstObject')

  setupController: (controller, model) ->
    # // Call _super for default behavior
    @_super(controller, model);
    # select model's actual quorum
    @controllerFor('admin/edit/person').send('selectQuorum')
    controller.set('displayError', false)
)

`export default AdminEditPersonRoute`
