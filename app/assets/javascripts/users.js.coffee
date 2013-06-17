$ ->
  $("#sign_up").click ->
    $.ajax
      url: "/users/choose_type"
      cache: false
      success: (data) -> 
        $("#register").empty()
        $("#register").append(data)

  $(document).on "click", ".new-user-type", (e) ->
    e.preventDefault()
    url = $(this).attr("href")
    $.ajax
      url: url
      cache: false
      success: (data) ->
        $("#register").html(data)

  $(document).on 'focus.autocomplete', '#education-school-name', (e) ->
    $(this).autocomplete
      source: $('#education-school-name').data('autocomplete-source')
      messages:
        noResults: "No results"
        results: ->
    $(document).off 'focus.autocomplete', '#education-school-name'
