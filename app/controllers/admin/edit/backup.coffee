`import Ember from 'ember'`

AdminEditBackupController = Ember.Controller.extend(
  actions:
    touchFirebase: ->
      @set('hideLocalRow', false)
      @set('overwriteState', true)
      ref = new Firebase('https://ym-attendance.firebaseio.com/')
      ref.on 'value', (snapshot) =>
        @set('backupObjs', [])
        snapshot.forEach (childSnapshot) =>
          backupObjs = @get('backupObjs')
          key = childSnapshot.key()
          unless key in ['lastPull', 'lastPush']
            remoteDBString = childSnapshot.val().string
            selected = localStorage.database is remoteDBString
            # if this is the same as today, hide the save button since they are in sync
            if key is @get('todayKey') and selected
              @set('hideLocalRow', true)
              @set('overwriteState', false)
            backupObjs.pushObject({key: key, selected: selected})
          return false #to not quit enumeration

  todayKey: Ember.computed '', ->
    date = new Date()
    year = date.getFullYear()
    month = date.getMonth() + 1
    day = date.getDate()
    "#{year}-#{month}-#{day}"
)

`export default AdminEditBackupController`
