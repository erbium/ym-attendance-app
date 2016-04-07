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

  totalNames: Ember.computed 'entries', ->
    total = 0
    for entry in @get('entries').toArray()
      total += entry.get('templeNames')
    total

  todayInWords: Ember.computed '', ->
    date = new Date()
    month = date.toLocaleString('en-us', { month: 'long'})
    day = date.getDate()
    "#{month} #{day}"

  hereToday: Ember.computed 'entries', ->
    dates = for entry in @get('entries').toArray()
      entry.get('dateWords')
    @get('todayInWords') in dates
}

`export default Person`
