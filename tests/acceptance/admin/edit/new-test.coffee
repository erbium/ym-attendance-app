`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from 'ym-attendance/tests/helpers/start-app'`

module 'Acceptance: AdminEditNew',
  beforeEach: ->
    @application = startApp()
    ###
    Don't return anything, because QUnit looks for a .then
    that is present on Ember.Application, but is deprecated.
    ###
    return

  afterEach: ->
    Ember.run @application, 'destroy'

test 'visiting /admin/edit/new', (assert) ->
  visit '/admin/edit/new'

  andThen ->
    assert.equal currentURL(), '/admin/edit/new'

test 'click back button', (assert) ->
  visit '/admin/edit/new'
  click 'a.top-bar-text'

  andThen ->
    assert.equal currentURL(), '/admin/edit/index'
