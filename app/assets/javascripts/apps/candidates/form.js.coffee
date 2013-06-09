class @Candidates.Form extends App.Component

  events:
    'ajax:success #edit-candidate-link': 'renderForm'
    'click #edit-candidate-cancel'     : 'cancelEdit'
    'ajax:success .form'               : 'candidateUpdated'

  renderForm: (e, xhr, status) =>
    @$('#edit-candidate-link').hide()
    @$('#candidate-attributes').hide()
    @$('#edit-candidate-form').html(xhr)

  cancelEdit: (e) =>
    e.preventDefault()
    @$('#edit-candidate-form').empty()
    @$('#candidate-attributes').show()
    @$('#edit-candidate-link').show()
    $('body').animate({ scrollTop: 0 }, 500);

  candidateUpdated: (e, xhr, status) =>
    App.vent.trigger 'vitals:updated', xhr
    @$('#edit-candidate-form').empty()
    @$('#candidate-attributes').empty().html(xhr).show()
    @$('#edit-candidate-link').show()
    $('body').animate({ scrollTop: 0 }, 500);
