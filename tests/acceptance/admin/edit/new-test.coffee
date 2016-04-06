`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from 'ym-attendance/tests/helpers/start-app'`

module 'Acceptance: AdminEditNew',
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

test 'visiting /admin/edit/new', (assert) ->
  visit '/admin/edit/new'

  andThen ->
    assert.equal currentURL(), '/admin/edit/new'

test 'click back button', (assert) ->
  visit '/admin/edit/new'
  click 'a.top-bar-text'

  andThen ->
    assert.equal currentURL(), '/admin/edit/index'

test 'cancel redirects', (assert) ->
  visit '/admin/edit/new'
  click('a.red-btn')

  andThen ->
    assert.equal currentURL(), '/admin/edit/index'

test 'create person creates person', (assert) ->
  visit '/admin/edit/new'
  fillIn('input.form-input', 'David')
  click('button.green-btn')

  andThen ->
    assert.equal find('span.list-button-text:eq(1)').text(), 'David'

test "create person doesn't create blank person", (assert) ->
  visit '/admin/edit/new'
  click('button.green-btn')

  andThen ->
    assert.equal currentURL(), '/admin/edit/new'


test "create person doesn't create white space person", (assert) ->
  visit '/admin/edit/new'
  fillIn('input.form-input', '    ')
  click('button.green-btn')

  andThen ->
    assert.equal currentURL(), '/admin/edit/new'

test "create person doesn't create duplicate, displays error", (assert) ->
  visit '/admin/edit/new'
  fillIn('input.form-input', 'David')
  click('button.green-btn')
  visit '/admin/edit/new'
  fillIn('input.form-input', 'David')
  click('button.green-btn')

  andThen ->
    assert.equal currentURL(), '/admin/edit/new'
    assert.equal find('p#name-error').length, 1

test "but normally the error is hidden", (assert) ->
  visit '/admin/edit/new'

  andThen ->
    assert.equal currentURL(), '/admin/edit/new'
    assert.equal find('p#name-error').length, 0
