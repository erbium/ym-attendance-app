`import Ember from 'ember'`

AdminQuarterlyReportRoute = Ember.Route.extend(
  model: ->
    @store.findAll('entry')
    @store.findAll('person')
)

`export default AdminQuarterlyReportRoute`
