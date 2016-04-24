`import DS from 'ember-data'`

Person = DS.Model.extend {
  name: DS.attr('string')
  lastAttended: DS.attr('date')
  inWard: DS.attr('boolean', { defaultValue: true })

  quorum: DS.belongsTo('quorum', { async: false} )
  entries: DS.hasMany('entry', { async: false, dependent: 'destroy'} )

  totalHours: Ember.computed 'entries', ->
    total = 0
    for entry in @get('entries').toArray()
      total += entry.get('serviceHours')
    total

  totalNames: Ember.computed 'entries', ->
    total = 0
    for entry in @get('entries').toArray()
      total += entry.get('templeNames')
    total
}

`export default Person`
