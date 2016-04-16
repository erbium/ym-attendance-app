`import Ember from 'ember'`

AttendanceIndexController = Ember.Controller.extend(
  actions:
    sortPeople: ->
      people = @get('model')
      today = new Date()
      today.setHours(0,0,0,0)
      # init arrays
      @set('hereToday', [])
      @set('notHere', [])
      hereToday = @get('hereToday')
      notHere = @get('notHere')
      # Loop through people and filter
      people.forEach (person) ->
        if person.get('lastAttended')
          if person.get('lastAttended') > today
            arr = hereToday
          else
            arr = notHere
        else
          arr = notHere
        arr.pushObject person
      # Set arrays to filtered versions of self
      @set('hereToday', hereToday.sortBy('name'))
      @set('notHere', notHere.sortBy('name'))
)

`export default AttendanceIndexController`
