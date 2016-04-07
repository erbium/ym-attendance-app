routes = [
  from: 'index', to: 'attendance/index'
,
  from: 'index', to: 'leaderboard/index'
,
  from: 'index', to: 'admin/index'
,
  from: 'admin/index/password', to: 'admin/edit/index'
,
  from: 'admin/index', to: 'admin/edit/index'
,
  from: 'admin/index', to: 'admin/quarterly-report'
,
  from: 'admin/edit/index', to: 'admin/edit/new'
,
  from: 'admin/edit/index', to: 'admin/edit/person'
,
  from: 'attendance/index', to: 'attendance/edit/new_entry'
,
  from: 'attendance/edit/new_entry', to: 'attendance/summary'
,
  from: 'attendance/index', to: 'attendance/summary'
,
  from: 'leaderboard/index', to: 'leaderboard/service_hours'
,
  from: 'leaderboard/index', to: 'leaderboard/temple_names'
]

transitions = ->
  for route in routes
    @transition(
      @fromRoute(route.from),
      @toRoute(route.to),
      @use('toLeft'),
      @reverse('toRight')
    )

`export default transitions`
