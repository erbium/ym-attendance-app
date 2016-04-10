`import Ember from 'ember'`

AttendanceEditNewEntryRoute = Ember.Route.extend(
  model: (params) ->
    personQuery = @store.query('person', { name: params.person_name })
    personQuery.then (person) -> person.get('firstObject')

  setupController: (controller, model) ->
    # // Call _super for default behavior
    @_super(controller, model);
    # create new entry and set entrySubmitted to false on new transition
    newEntry = (->
      @store.createRecord 'entry',
        createdAt: new Date(2016,1,14)
        serviceHours: 0
        templeNames: 0
        person: @get('model')
    ).property()
    controller.set('entry', newEntry)
    controller.set('entrySubmitted', false)
)

`export default AttendanceEditNewEntryRoute`
