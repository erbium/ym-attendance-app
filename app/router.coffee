`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend(
  location: config.locationType
)

Router.map ->
  @route 'leaderboard/index'
  @route 'attendance/index'


`export default Router`
