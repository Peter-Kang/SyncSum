class Experiences.List extends App.Component

  initialize: ->
    App.vent.bind 'experience:created', @addExperience

  events:
    'click .more' : 'renderDetails'
    'click .less' : 'hideDetails'

  renderDetails: (e) =>
    e.preventDefault()
    $(e.currentTarget).siblings('.experience-more').slideDown ->
      $(this).siblings('.less').show()
      $(this).siblings('.more').hide()

  hideDetails: (e) =>
    e.preventDefault()
    $(e.currentTarget).siblings('.experience-more').slideUp ->
      $(this).siblings('.more').show()
      $(this).siblings('.less').hide()

  addExperience: (e, experience) =>
    $(@el).prepend(experience)
