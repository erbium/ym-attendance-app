`import Ember from 'ember'`

ListButtonComponent = Ember.Component.extend(
  # Duplicate of method in back-button, could probably have them
  # share an parent object . . . but the app is so small now, let's do
  # that later if even 1 more thing is shared
  # pass either the route, or the route and a param
  computedRoute: Ember.computed 'route', ->
    route = @get('route')
    routeParam = @get('routeParam')
    params = [route]
    params.push routeParam if routeParam
    return params
)

`export default ListButtonComponent`
