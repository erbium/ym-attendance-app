`import Ember from 'ember'`

TopBarComponent = Ember.Component.extend(
  # pass either the route, or the route and a param
  computedRoute: Ember.computed 'route', ->
    route = @get('route')
    routeParam = @get('routeParam')
    params = [route]
    params.push routeParam if routeParam
    return params
  click: -> @sendAction()
)

`export default TopBarComponent`
