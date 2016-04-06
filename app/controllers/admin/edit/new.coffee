`import Ember from 'ember'`

AdminEditNewController = Ember.Controller.extend(
  init: ->
    @displayError = false
    @store.findAll('quorum').then (quorums) =>
      @quorumOpts = quorums.toArray()
      @selectedQuorum = @quorumOpts[0]

  actions:
    cancelPerson: ->
      @get('model').destroyRecord()
      @transitionToRoute '/admin/edit/index'

    submitPerson: ->
      @store.find('quorum', @selectedQuorum.id).then (quorumObj) =>
        @quorumObj = quorumObj
        person = @get('model')
        name = person.get('name')
        # checkPersonName is used in multiple contexts so they pass it in.
        emberContext = this
        @checkPersonName(emberContext, person, @createPerson, @showError) if name and !!name.trim()

  # This method gets the list of names (which will include the person being created)
  # and goes through them counting the number of times the new name is in the list. It
  # should only be in there once. If not, then throw an error.
  checkPersonName: (emberContext, person, successCallback, failureCallback) ->
    personName = person.get('name')
    @store.findAll('person').then (people) =>
      nameCount = 0
      for testPerson in people.toArray()
        nameCount += 1 if testPerson.get('name') is personName
      if nameCount > 1
        failureCallback(emberContext)
      else
        successCallback(emberContext, person)

  createPerson: (emberContext, person) ->
    E = emberContext
    E.set('displayError', false)
    person.set('quorum', E.quorumObj)
    E.quorumObj.save()
    person.save().then =>
      E.transitionToRoute '/admin/edit/index'

  showError: (emberContext) ->
    emberContext.set('displayError', true)
)

`export default AdminEditNewController`
