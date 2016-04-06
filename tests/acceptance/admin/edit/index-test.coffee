`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from 'ym-attendance/tests/helpers/start-app'`

module 'Acceptance: AdminEditIndex',
  beforeEach: ->
    @application = startApp()
    ###
    Don't return anything, because QUnit looks for a .then
    that is present on Ember.Application, but is deprecated.
    ###
    return

  afterEach: ->
    Ember.run @application, 'destroy'

test 'visiting /admin/edit/index', (assert) ->
  visit '/admin/edit/index'

  andThen ->
    assert.equal currentURL(), '/admin/edit/index'

test 'Create new person link', (assert) ->
  visit '/admin/edit/index'
  click 'span.list-button-text:first'
  andThen ->
    assert.equal currentURL(), '/admin/edit/new'

test 'click back button', (assert) ->
  visit '/admin/edit/index'
  click 'a.top-bar-text'

  andThen ->
    assert.equal currentURL(), '/admin/index'

test 'click on person', (assert) ->
  visit '/admin/edit/index'
  click 'span.list-button-text:first'
  fillIn('input.form-input', 'Fred')
  click 'button.green-btn'
  click 'span.list-button-text:eq(1)'

  andThen ->
    # check to see if url matches pattern
    pattern = /\/admin\/edit\/person\/.*/
    result = currentURL().match(pattern)
    assert.ok result
