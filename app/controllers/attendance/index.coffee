`import Ember from 'ember'`

AttendanceIndexController = Ember.Controller.extend(

  hereToday: Ember.computed 'model.@each.hereToday', ->
    people = @get('model')
    people.filterBy('hereToday', true).sortBy('name')

  notHere: Ember.computed 'model.@each.hereToday', ->
    people = @get('model')
    people.filterBy('hereToday', false).sortBy('name')
)

`export default AttendanceIndexController`
