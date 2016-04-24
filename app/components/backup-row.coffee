`import Ember from 'ember'`

BackupRowComponent = Ember.Component.extend(

  buttonText: Ember.computed '', ->
    return 'Save' if @get('localRow')
    switch
      when @get('selected')
        'Current'
      when @get('overwrite')
        'Overwrite Local'
      else
        'Restore'

  buttonClass: Ember.computed '', ->
    return 'btn' if @get('localRow')
    switch
      when @get('selected')
        'current'
      when @get('overwrite')
        'red-btn'
      else
        'btn'

  actions:
    pullDB: (key) ->
      return if @get('selected') # don't do anything if row is selected
      okToContinue = true
      if @get('overwrite')
        okToContinue = confirm("You have unsaved work on this device which will be lost if you continue. If you'd like to save it go back and press save first. Otherwise you may continue.")
      return unless okToContinue
      fireDB = new Firebase("https://ym-attendance.firebaseio.com/")
      backup = fireDB.child(key)
      backup.once 'value', (snapshot) =>
        dbObj = snapshot.val().data
        dbString = JSON.stringify dbObj
        localStorage.database = dbString
        # Now update remote string to match latest stringification
        backup.update { string: dbString }
        # Report pull
        lastPull = fireDB.child('lastPull')
        lastPull.update {timeStamp: new Date() }

    pushDB: ->
      fireDB = new Firebase('https://ym-attendance.firebaseio.com/')
      today = fireDB.child(@get('key'))
      # keep string version around for checking equality easily
      today.update { data: JSON.parse(localStorage.database), string: localStorage.database }
      fireDB.push
      # Report push
      lastPush = fireDB.child('lastPush')
      lastPush.update {timeStamp: new Date()}

)

`export default BackupRowComponent`
