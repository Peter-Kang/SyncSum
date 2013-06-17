class @Educations.Form extends App.Component

  events:
    'ajax:success #new-education-link': 'renderForm'
    'click #new-education-cancel'     : 'cancelCreate'
    'ajax:success .form'              : 'educationCreated'
    'ajax:error .form'                : 'renderErrors'

  renderForm: (e, xhr, status) =>
    @$('#new-education-form').html(xhr)
    @toggleView()

  renderErrors: (e, xhr, status) =>
    @$('#education-errors').html(xhr.responseText)

  cancelCreate: (e) =>
    e.preventDefault()
    @toggleView()

  educationCreated: (e, res, status) =>
    @toggleView()
    App.vent.trigger 'education:created', res

  toggleView: ->
    if @$('#new-education').is(':visible')
      @$('#new-education').slideUp =>
        @$('#new-education-form').empty()
        @$('#education-errors').empty()
        @$('#new-education-link').show()
    else
      @$('#new-education').slideDown()
      @$('#new-education-link').hide()
