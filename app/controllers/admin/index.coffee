`import Ember from 'ember'`

AdminIndexController = Ember.Controller.extend(
  actions:
    checkInternetConnection: ->
      @set('isOnline', false)
      promise = new Ember.RSVP.Promise (resolve, reject) ->
        request = Ember.$.get('https://ym-attendance.firebaseio.com/')
        request.always ->
          if request.status is 200
            resolve(request)
          else

      promise.then => @set('isOnline', true)
)

`export default AdminIndexController`
