`import Ember from 'ember'`

AdminEditEntryController = Ember.Controller.extend(
  actions:
    focusedElement: (id) ->
      element = $("##{id}")
      element.val('') if element.val() is '0'

    blurredElement: (id) ->
      element = $("##{id}")
      element.val(0) if element.val() is ''

    updateEntry: ->
      @get('model').save().then (model) =>
        @transitionToRoute('admin/edit/person', model.get('person'))

    cancelEntry: ->
      entry = @get('model')
      entry.rollbackAttributes()
      @transitionToRoute('admin/edit/person', entry.get('person'))

    deleteEntry: ->
      entry = @get('model')
      dateWords = entry.get('dateWords')
      if confirm("Are you sure you want to delete #{dateWords} entry?")
        person = entry.get('person')
        entry.destroyRecord()
        person.save()
        @transitionToRoute('admin/edit/person', person)

)

`export default AdminEditEntryController`
