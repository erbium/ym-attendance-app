`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'pass-link', 'Integration | Component | pass link', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{pass-link}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#pass-link}}
      template block text
    {{/pass-link}}
  """

  assert.equal @$().text().trim(), 'template block text'
