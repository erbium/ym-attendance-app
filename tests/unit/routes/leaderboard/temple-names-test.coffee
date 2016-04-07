`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:leaderboard/temple-names', 'Unit | Route | leaderboard/temple names', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
