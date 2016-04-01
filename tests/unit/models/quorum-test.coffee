`import { moduleForModel, test } from 'ember-qunit'`

moduleForModel 'quorum', 'Unit | Model | quorum', {
  # Specify the other units that are required for this test.
  needs: ['model:person']
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
