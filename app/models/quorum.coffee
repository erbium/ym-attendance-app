`import DS from 'ember-data'`

Quorum = DS.Model.extend {
  name: DS.attr('string')
  people: DS.hasMany('person', { async: false} )

  totalHours: Ember.computed 'people', ->
    total = 0
    for person in @get('people').toArray()
      total += person.get('totalHours')
    total  
}

`export default Quorum`
