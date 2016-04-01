`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'list-button', 'Integration | Component | list button', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{list-button}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#list-button}}
      template block text
    {{/list-button}}
  """

  assert.equal @$().text().trim(), 'template block text'
