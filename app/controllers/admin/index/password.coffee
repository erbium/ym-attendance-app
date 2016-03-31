`import Ember from 'ember'`

AdminIndexPasswordController = Ember.Controller.extend(
  displayError: false
  actions:
    checkPassword: ->
      password = @get('password')
      @set('password','')
      if password is 'BigZ'
        @set('displayError', false)
        @transitionToRoute('admin/edit/index')
      else
        @set('displayError', true)
      # return false to prevent bubbling
      false
)

`export default AdminIndexPasswordController`
