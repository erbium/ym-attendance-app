`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:attendance/edit/new-entry', 'Unit | Route | attendance/edit/new entry', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
