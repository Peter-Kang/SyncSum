class @Experiences.Form extends App.Component

  MAX_JOB_FUNCTIONS = 3
  MAX_BUSINESS_SECTORS = 3

  events:
    'ajax:success #new-experience-link': 'renderForm'
    'click #new-experience-cancel'     : 'cancelCreate'
    'ajax:success .form'               : 'experienceCreated'
    'ajax:error .form'                 : 'renderErrors'
    'click #add-business-sector'       : 'addBusinessSector'
    'click #add-job-function'          : 'addJobFunction'

  renderForm: (e, xhr, status) =>
    @$('#new-experience-form').html(xhr)
    @toggleView()

  renderErrors: (e, xhr, status) =>
    @$('#experience-errors').html(xhr.responseText)

  cancelCreate: (e) =>
    e.preventDefault()
    @toggleView()

  experienceCreated: (e, res, status) =>
    @toggleView()
    App.vent.trigger 'experience:created', res

  addBusinessSector: (e) =>
    e.preventDefault()
    $select = $('.business-sector-select').first().clone()
    $('#business-sectors').append($select)
    if $('.business-sector-select').size() == MAX_BUSINESS_SECTORS
      $(e.currentTarget).remove()

  removeBusinessSector: (e) =>
    e.preventDefault()

  addJobFunction: (e) =>
    e.preventDefault()    
    $select = $('.job-function-select').first().clone()
    $('#job-functions').append($select)
    if $('.job-function-select').size() == MAX_JOB_FUNCTIONS
      $(e.currentTarget).remove()

  toggleView: ->
    if @$('#new-experience').is(':visible')
      @$('#new-experience').slideUp =>
        @$('#new-experience-form').empty()
        @$('#experience-errors').empty()
        @$('#new-experience-link').show()
    else
      @$('#new-experience').slideDown()
      @$('#new-experience-link').hide()

