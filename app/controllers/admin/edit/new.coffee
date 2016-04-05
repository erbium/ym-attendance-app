`import Ember from 'ember'`

AdminEditNewController = Ember.Controller.extend(
  init: ->
    @store.findAll('quorum').then (quorums) =>
      @quorumOpts = quorums.toArray()
      @selectedQuorum = @quorumOpts[0]

  displayError: false

  actions:
    cancelPerson: ->
      @get('model').destroyRecord()
      @transitionToRoute '/admin/edit/index'

    submitPerson: ->
      @store.find('quorum', @selectedQuorum.id).then (quorumObj) =>
        @quorumObj = quorumObj
        person = @get('model')
        name = person.get('name')
        @checkPersonName(person) if name and !!name.trim()

  # This method gets the list of names (which will include the person being created)
  # and goes through them counting the number of times the new name is in the list. It
  # should only be in there once. If not, then throw an error.
  checkPersonName: (person) ->
    personName = person.get('name')
    @store.findAll('person').then (people) =>
      nameCount = 0
      for person in people.toArray()
        nameCount += 1 if person.get('name') is personName
      if nameCount > 1
        @set('displayError', true)
      else
        @createPerson(person)

  createPerson: (person) ->
    @set('displayError', false)
    person.set('quorum', @quorumObj)
    @quorumObj.save()
    person.save().then =>
      @transitionToRoute '/admin/edit/index'
)

`export default AdminEditNewController`
