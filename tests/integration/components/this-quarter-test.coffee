`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'this-quarter', 'Integration | Component | this quarter', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 1

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->
  @set('model', [])
  @render hbs """{{this-quarter people=model}}"""

  # Just assert that the above didn't crash, it at least runs the component,
  # doesn't really look at the internals. It's a start, not a great start, but a start
  assert.ok true
