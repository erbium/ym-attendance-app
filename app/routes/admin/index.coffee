`import Ember from 'ember'`

AdminIndexRoute = Ember.Route.extend(
  setupController: (controller, model) ->
    # // Call _super for default behavior
    @_super(controller, model);
    # select model's actual quorum
    @controllerFor('admin/index').send('checkInternetConnection')
)

`export default AdminIndexRoute`
