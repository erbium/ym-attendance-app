`import Ember from 'ember'`

ThisQuarterComponent = Ember.Component.extend(

  currentQuarter: Ember.computed '', ->
    today = new Date()
    @getQuarter today

  lastQuarter: Ember.computed 'currentQuarter', ->
    @get('currentQuarter') - 1

  header: Ember.computed 'currentQuarter', ->
    "Q#{@get('lastQuarter')}"

  quarterMonths: Ember.computed 'currentQuarter', ->
    switch @get('lastQuarter')
      when 1 then 'January - March'
      when 2 then 'April - June'
      when 3 then 'July - September'
      when 4 then 'October - December'

  attendanceRatio: Ember.computed 'people', ->
    people = @get('people')
    quarter = @get('lastQuarter')
    attendedCount = 0
    youngManCount = 0
    didNotAttendNames = []
    for person in people.toArray()
      youngManCount++
      entries = person.get('entries').toArray()
      if @anyEntryInQuarter(entries, quarter)
        attendedCount++
      else
        didNotAttendNames.push person.get('name')
    # Before giving back the ratio, I'll set this property;
    # There's probably a better way.
    @set('didNotAttendNames', didNotAttendNames)
    "#{attendedCount}/#{youngManCount}"

  didntAttend: Ember.computed 'attendanceRatio', ->
    didNotAttendNames = @get('didNotAttendNames')
    namesList = didNotAttendNames.join('<br>')
    Ember.String.htmlSafe(namesList)

  getQuarter: (date) ->
    Math.floor( (date.getMonth() + 1) / 3 ) + 1

  anyEntryInQuarter: (entries, quarter) ->
    # Create array of entries stating whether they are in this quarter.
    results = for entry in entries.toArray()
      @entryInQuarter(entry, quarter)
    # If `true` is anywhere in the array then one entry was created during that quarter
    true in results

  entryInQuarter: (entry, quarter) ->
    date = entry.get('createdAt')
    entryQuarter = @getQuarter(date)
    entryQuarter is quarter
)

`export default ThisQuarterComponent`
