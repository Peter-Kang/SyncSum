class Educations.List extends App.Component

  initialize: ->
    App.vent.bind 'education:created', @addEducation

  addEducation: (e, education) =>
    $(@el).prepend(education)
