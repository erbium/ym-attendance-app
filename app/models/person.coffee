`import DS from 'ember-data'`

Person = DS.Model.extend {
  name: DS.attr('string')

  quorum: DS.belongsTo('quorum', { async: false} )
  entries: DS.hasMany('entry', { async: false} )

  totalHours: Ember.computed 'entries', ->
    total = 0
    for entry in @get('entries').toArray()
      total += entry.get('serviceHours')
    total  
}

`export default Person`
