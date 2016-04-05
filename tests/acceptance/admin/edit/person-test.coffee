`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from 'ym-attendance/tests/helpers/start-app'`

module 'Acceptance: AdminEditPerson',
  beforeEach: ->
    @application = startApp()
    # Clear local storage and visit index to create base quorums
    localStorage.clear()
    visit '/'
    # Now create a test person
    visit '/admin/edit/new'
    fillIn('input.form-input', 'David')
    click('button#create-btn')
    ###
    Don't return anything, because QUnit looks for a .then
    that is present on Ember.Application, but is deprecated.
    ###
    return

  afterEach: ->
    Ember.run @application, 'destroy'

test 'visiting /admin/edit/person', (assert) ->
  visit '/admin/edit/person/David'

  andThen ->
    assert.equal currentURL(), '/admin/edit/person/David'
