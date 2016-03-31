`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from 'ym-attendance/tests/helpers/start-app'`

module 'Acceptance: AdminIndexPassword',
  beforeEach: ->
    @application = startApp()
    ###
    Don't return anything, because QUnit looks for a .then
    that is present on Ember.Application, but is deprecated.
    ###
    return

  afterEach: ->
    Ember.run @application, 'destroy'

test 'visiting /admin/index/password', (assert) ->
  visit '/admin/index/password'

  andThen ->
    assert.equal currentURL(), '/admin/index/password'

test 'use right password', (assert) ->
  visit '/admin/index/password'
  fillIn('input#password-input', 'BigZ')
  click 'button#submit-button'

  andThen ->
    assert.equal currentURL(), '/admin/edit/index'

test 'use wrong password', (assert) ->
  visit '/admin/index/password'
  fillIn('input#password-input', 'Bigz')
  click 'button#submit-button'

  andThen ->
    assert.notEqual currentURL(), '/admin/edit/index'
