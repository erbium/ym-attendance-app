`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend(
  location: config.locationType
)

Router.map ->
  @route 'leaderboard/index'
  @route 'attendance/index'
  @route 'admin/index', ->
    @route 'password'
  @route 'admin/edit/index'
  @route 'admin/quarterly-report'
  @route 'admin/edit/new'

  @route 'admin/edit/person', { path: 'admin/edit/person/:person_name'}

`export default Router`
