`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from 'ym-attendance/tests/helpers/start-app'`

module 'Acceptance: AdminEditPerson',
  beforeEach: ->
    @application = startApp()
    # Clear local storage and visit index to create base quorums
    localStorage.clear()
    visit '/'
    ###
    Don't return anything, because QUnit looks for a .then
    that is present on Ember.Application, but is deprecated.
    ###
    return

  afterEach: ->
    Ember.run @application, 'destroy'

test 'visiting /admin/edit/person', (assert) ->
  # Now create a test person
  visit 'admin/edit/new'
  fillIn('input.form-input', 'John')
  click('button.submit-btn')
  visit 'admin/edit/person/John'

  andThen ->
    assert.equal find('input#name-input').val(), 'John'

test "Can't visit person that doesn't exist", (assert) ->
  visit 'admin/edit/person/Frank'

  andThen ->
    assert.notEqual find('input#name-input').val(), 'Frank'
