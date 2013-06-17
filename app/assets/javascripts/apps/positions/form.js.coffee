class @Positions.Form extends App.Component

  events:
    'ajax:success #new-position-link': 'renderForm'
    'click #new-position-cancel'     : 'cancelCreate'
    'ajax:success .form'              : 'positionCreated'
    'ajax:error .form'                : 'renderErrors'

  renderForm: (e, xhr, status) =>
    @$('#new-position-form').html(xhr)
    @toggleView()

  renderErrors: (e, xhr, status) =>
    @$('#position-errors').html(xhr.responseText)

  cancelCreate: (e) =>
    e.preventDefault()
    @toggleView()

  positionCreated: (e, res, status) =>
    @toggleView()
    App.vent.trigger 'position:created', res

  toggleView: ->
    if @$('#new-position').is(':visible')
      @$('#new-position').slideUp =>
        @$('#new-position-form').empty()
        @$('#position-errors').empty()
        @$('#new-position-link').show()
    else
      @$('#new-position').slideDown()
      @$('#new-position-link').hide()
