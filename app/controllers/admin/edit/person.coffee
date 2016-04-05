`import Ember from 'ember'`

AdminEditPersonController = Ember.Controller.extend(
  init: ->
    @displayError = false

  newPersonController: Ember.inject.controller('admin/edit/new')

  checkPerson: (person, success, failure) ->
    emberContext = this
    @get('newPersonController').checkPersonName(emberContext, person, success, failure)

  showError: (emberContext) ->
    emberContext.set('displayError', true)

  actions:
    submitPerson: ->
      person = @get('model')
      @checkPerson(person, @updatePerson, @showError) if name and !!name.trim()

  updatePerson: (emberContext, person) ->
    E = emberContext
    person.save().then =>
      E.transitionToRoute '/admin/edit/index'
)

`export default AdminEditPersonController`
