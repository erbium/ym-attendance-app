`import DS from 'ember-data'`

Entry = DS.Model.extend {
  createdAt: DS.attr('date')
  serviceHours: DS.attr('number')
  person: DS.belongsTo('person', { async: false} )  
}

`export default Entry`
