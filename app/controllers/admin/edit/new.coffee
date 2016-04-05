`import Ember from 'ember'`

AdminEditNewController = Ember.Controller.extend(
  init: ->
    @store.findAll('quorum').then (arg) =>
      quorums = arg.toArray()
      this.quorums = for quorum in quorums
        quorum.get('name')

  quorum: 'deacons'
  displayError: false

  actions:
    cancelPerson: ->
      @get('model').destroyRecord()
      @transitionToRoute '/admin/edit/index'

    submitPerson: ->
      query = @store.query('quorum',  { name: @quorum })
      query.then (record) =>
        @quorumObj = record.toArray()[0]
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
