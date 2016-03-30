routes = [
  from: 'index', to: 'attendance/index'
,
  from: 'index', to: 'leaderboard/index'
,
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