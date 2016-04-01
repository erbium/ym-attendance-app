`import { moduleForModel, test } from 'ember-qunit'`

moduleForModel 'entry', 'Unit | Model | entry', {
  # Specify the other units that are required for this test.
  needs: ['model:person']
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
