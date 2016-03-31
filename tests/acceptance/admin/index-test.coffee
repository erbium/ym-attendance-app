`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from 'ym-attendance/tests/helpers/start-app'`

module 'Acceptance: AdminIndex',
  beforeEach: ->
    @application = startApp()
    ###
    Don't return anything, because QUnit looks for a .then
    that is present on Ember.Application, but is deprecated.
    ###
    return

  afterEach: ->
    Ember.run @application, 'destroy'

test 'visiting /admin/index', (assert) ->
  visit '/admin/index'

  andThen ->
    assert.equal currentURL(), '/admin/index'

test 'click back button', (assert) ->
  visit '/admin/index'
  click 'a.top-bar-text'

  andThen ->
    assert.equal currentURL(), '/'

test 'quarterly report link', (assert) ->
  visit '/admin/index'
  click 'a#quarterly-report-btn'
  andThen ->
    assert.equal currentURL(), '/admin/quarterly-report'

test 'edit records link', (assert) ->
  visit '/admin/index'
  click 'a#edit-btn'
  andThen ->
    assert.equal currentURL(), '/admin/index/password'
