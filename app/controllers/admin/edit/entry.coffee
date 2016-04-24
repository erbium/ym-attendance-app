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
        # Get person, and bump back his lastAttended date
        person = entry.get('person')
        createdAt = entry.get('createdAt')
        bumpBack = createdAt.setDate(createdAt.getDate() - 2)
        person.set('lastAttended', bumpBack)

        # Now destroy record and save person
        entry.destroyRecord()
        person.save()
        @transitionToRoute('admin/edit/person', person)

)

`export default AdminEditEntryController`
