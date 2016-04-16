`import Ember from 'ember'`

AttendanceEditNewEntryController = Ember.Controller.extend(

  actions:
    focusedElement: (id) ->
      element = $("##{id}")
      element.val('') if element.val() is '0'

    blurredElement: (id) ->
      element = $("##{id}")
      element.val(0) if element.val() is ''

    createEntry: ->
      # Get stuff
      entry = @get('entry')
      time = entry.get('createdAt')
      person = @get('model')
      # Update person to show attended today
      person.set('lastAttended', time)
      person.save()
      # Save entry and go to index
      @get('entry').save().then =>
        @transitionToRoute 'index'

    cancelEntry: ->
      if confirm("Go back without saving?")
        @get('entry').destroyRecord()
        @transitionToRoute '/attendance/index'
)

`export default AttendanceEditNewEntryController`
