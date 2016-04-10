`import Ember from 'ember'`

AdminEditBackupRoute = Ember.Route.extend(
  setupController: (controller, model) ->
    # // Call _super for default behavior
    @_super(controller, model);
    # select model's actual quorum
    @controllerFor('admin/edit/backup').send('touchFirebase')
)

`export default AdminEditBackupRoute`
