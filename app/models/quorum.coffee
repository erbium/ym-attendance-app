`import DS from 'ember-data'`

Quorum = DS.Model.extend {
  name: DS.attr('string')
  people: DS.hasMany('person', { async: false} )

  capName: Ember.computed 'name', ->
    name = @get('name')
    name.charAt(0).toUpperCase() + name.slice(1)

  totalHours: Ember.computed 'people', ->
    total = 0
    for person in @get('people').toArray()
      total += person.get('totalHours')
    total

  totalNames: Ember.computed 'people', ->
    total = 0
    for person in @get('people').toArray()
      total += person.get('totalNames')
    total
}

`export default Quorum`
