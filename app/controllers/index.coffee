`import Ember from 'ember'`

IndexController = Ember.Controller.extend(
  actions:
    goTo: (route) ->
      @transitionToRoute route
)

`export default IndexController`
