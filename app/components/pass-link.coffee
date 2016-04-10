`import Ember from 'ember'`

PassLinkComponent = Ember.Component.extend(
  errorVisible: false
  passwordVisible: false

  actions:
    togglePassword: ->
      currentVal = @get('passwordVisible')
      @set('passwordVisible', !currentVal)

    showError: ->
      @set('errorVisible', true)

    checkPassword: ->
      route = @get('route')
      password = @get('password')
      @set('password','')

      if password is 'BigZ'
        @set('errorVisible', false)
        @sendAction('action', route)
      else
        @set('errorVisible', true)
      # return false to prevent bubbling
      false
)

`export default PassLinkComponent`
