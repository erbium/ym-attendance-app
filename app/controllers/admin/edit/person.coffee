`import Ember from 'ember'`

AdminEditPersonController = Ember.Controller.extend(
  newPersonController: Ember.inject.controller('admin/edit/new')

  init: ->
    @set('displayError', false)
    @store.findAll('quorum').then (quorums) =>
      @quorumOpts = quorums.toArray()

  checkPerson: (person, success, failure) ->
    # It would seem that shared methods need to pass around this context in order to use it...
    emberContext = this
    @get('newPersonController').checkPersonName(emberContext, person, success, failure)

  showError: (emberContext) ->
    emberContext.set('displayError', true)

  actions:
    selectQuorum: ->
      quorumId = @get('model').get('quorum').get('id')
      @store.find('quorum', quorumId).then (quorum) =>
        @selectedQuorum = quorum

    submitPerson: ->
      person = @get('model')
      @checkPerson(person, @updatePerson, @showError) if name and !!name.trim()

    cancelUpdate: ->
      @get('model').rollbackAttributes()
      @set('displayError', false)
      @transitionToRoute '/admin/edit/index'

    deletePerson: ->
      person = @get('model')
      name = person.get('name')
      if confirm("Are you sure you want to delete #{name}?")
        quorum = person.get('quorum')
        person.destroyRecord()
        quorum.save()
        @transitionToRoute '/admin/edit/index'


  updatePerson: (emberContext, person) ->
    # fetch current and old quorums
    E = emberContext
    newQuorum = E.get('selectedQuorum')
    oldQuorum = person.get('quorum')
    # Set new quorum and save all to propagate changes
    person.set('quorum', newQuorum)
    oldQuorum.save()
    newQuorum.save()
    person.save().then =>
      E.transitionToRoute '/admin/edit/index'
)

`export default AdminEditPersonController`
