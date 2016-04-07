`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:leaderboard/service-hours', 'Unit | Route | leaderboard/service hours', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
