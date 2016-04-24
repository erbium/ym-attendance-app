`import Ember from 'ember'`

AdminQuarterlyReportRoute = Ember.Route.extend(
  model: ->
    @store.findAll('entry')
    @store.query('person', { inWard: true })
)

`export default AdminQuarterlyReportRoute`
