`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend(
  location: config.locationType
)

Router.map ->
  # ADMIN
  @route 'admin/index', ->
    @route 'password'
  @route 'admin/edit/index'
  @route 'admin/quarterly-report'
  @route 'admin/edit/new'
  @route 'admin/edit/person', { path: 'admin/edit/person/:person_name'}

  # ATTENDANCE
  @route 'attendance/index'
  @route 'attendance/edit/new_entry', { path: 'attendance/edit/new_entry/:person_name'}
  @route 'attendance/summary', { path: 'attendance/summary/:person_name'}

  # LEADERBOARD
  @route 'leaderboard/index'
  @route 'leaderboard/service_hours'
  @route 'leaderboard/temple_names'

`export default Router`
