`import Ember from 'ember'`

AttendanceEditNewEntryController = Ember.Controller.extend(

  actions:
    focusedElement: (id) ->
      element = $("##{id}")
      element.val('') if element.val() is '0'

    blurredElement: (id) ->
      element = $("##{id}")
      element.val(0) if element.val() is ''

    backButton: ->
      if @get('entrySubmitted')
        @transitionToRoute '/attendance/index'
      else
        @send('cancelEntry')

    createEntry: ->
      @get('model').save()
      @get('entry').save().then =>
        $("#service-hours-input").attr("disabled", true)
        $("#temple-names-input").attr("disabled", true)
        @set('entrySubmitted', true)

    cancelEntry: ->
      @get('entry').destroyRecord()
      @transitionToRoute '/attendance/index'


)

`export default AttendanceEditNewEntryController`
