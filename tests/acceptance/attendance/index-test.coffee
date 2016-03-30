`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from 'ym-attendance/tests/helpers/start-app'`

module 'Acceptance: AttendanceIndex',
  beforeEach: ->
    @application = startApp()
    ###
    Don't return anything, because QUnit looks for a .then
    that is present on Ember.Application, but is deprecated.
    ###
    return

  afterEach: ->
    Ember.run @application, 'destroy'

test 'visiting /attendance/index', (assert) ->
  visit '/attendance/index'

  andThen ->
    assert.equal currentURL(), '/attendance/index'

test 'click back button', (assert) ->
  visit '/attendance/index'
  click 'a#back-button'

  andThen ->
    assert.equal currentURL(), '/'
