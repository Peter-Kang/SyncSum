class Positions.List extends App.Component

  initialize: ->
    App.vent.bind 'position:created', @addposition

  events:
    'click .more' : 'renderDetails'
    'click .less' : 'hideDetails'

  renderDetails: (e) =>
    e.preventDefault()
    $(e.currentTarget).siblings('.position-more').slideDown ->
      $(this).siblings('.less').show()
      $(this).siblings('.more').hide()

  hideDetails: (e) =>
    e.preventDefault()
    $(e.currentTarget).siblings('.position-more').slideUp ->
      $(this).siblings('.more').show()
      $(this).siblings('.less').hide()

  addposition: (e, position) =>
    $(@el).prepend(position)
