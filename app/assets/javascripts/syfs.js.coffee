@App = do ->

  users:
    show: ->
      new Header.UserPanel el: '.settings'
      new Experiences.List el: '#experience-list'
      new Experiences.Form el: '#new-experience-wrapper'
      new Educations.Form  el: '#new-education-wrapper'
      new Positions.Form   el: '#new-position-wrapper'
      new Educations.List  el: '#education-list'
      new Candidates.Form  el: '#edit-candidate-wrapper'
    dashboard: ->
      new Content.Skip     el: '#content'


  # The following should be encapsulated into an App object. We
  # should use App = new Namespace.Application()

  exec: (controller, action) ->
    action = if (action is `undefined`) then "init" else action
    App[controller][action]() if controller isnt "" and App[controller] and typeof App[controller][action] is "function"

  start: ->
    controller = $('body').data('controller')
    action = $('body').data('action')
    App.exec controller
    App.exec controller, action
