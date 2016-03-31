`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'back-button', 'Integration | Component | back button', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{back-button}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#back-button}}
      template block text
    {{/back-button}}
  """

  assert.equal @$().text().trim(), 'template block text'
