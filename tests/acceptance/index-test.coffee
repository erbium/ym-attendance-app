`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from 'ym-attendance/tests/helpers/start-app'`

module 'Acceptance: Index',
  beforeEach: ->
    @application = startApp()
    ###
    Don't return anything, because QUnit looks for a .then
    that is present on Ember.Application, but is deprecated.
    ###
    return

  afterEach: ->
    Ember.run @application, 'destroy'

test 'visiting /index', (assert) ->
  visit '/'

  andThen =>
    assert.equal currentURL(), '/'

test 'attendance link', (assert) ->
  visit '/'
  click 'a#attendance-btn'
  andThen ->
    assert.equal currentURL(), '/attendance/index'

test 'leaderboard link', (assert) ->
  visit '/'
  click 'a#leaderboard-btn'
  andThen ->
    assert.equal currentURL(), '/leaderboard/index'
