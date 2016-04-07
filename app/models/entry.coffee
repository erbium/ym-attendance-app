`import DS from 'ember-data'`

Entry = DS.Model.extend {
  createdAt: DS.attr('date')
  serviceHours: DS.attr('number')
  templeNames: DS.attr('number')
  person: DS.belongsTo('person', { async: false} )

  dateWords: Ember.computed 'createdAt', ->
    date = @get('createdAt')
    month = date.toLocaleString('en-us', { month: 'long'})
    day = date.getDate()
    "#{month} #{day}"
}

`export default Entry`
