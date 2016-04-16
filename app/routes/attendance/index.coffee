`import Ember from 'ember'`

AttendanceIndexRoute = Ember.Route.extend(
  model: ->
    @store.findAll('person')

  setupController: (controller, model) ->
    # // Call _super for default behavior
    @_super(controller, model);
    # select model's actual quorum
    controller.send('sortPeople')
)

`export default AttendanceIndexRoute`
