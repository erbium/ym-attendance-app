`import Ember from 'ember'`

AttendanceSummaryRoute = Ember.Route.extend(
  model: (params) ->
    personQuery = @store.query('person', { name: params.person_name })
    personQuery.then (person) -> person.get('firstObject')
)

`export default AttendanceSummaryRoute`
