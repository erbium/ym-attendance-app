`import Ember from 'ember'`

AttendanceIndexRoute = Ember.Route.extend(

  model: ->
    @store.findAll('entry')
    @store.findAll('person')
)

`export default AttendanceIndexRoute`
