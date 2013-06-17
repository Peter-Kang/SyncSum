class @App.Component

  constructor: (options) ->
    @el = options.el || undefined
    @bindEvents()
    @ajaxSetup()
    @initialize() if @initialize

  ajaxSetup: ->
    $.ajaxSetup
      dataType: 'html'

  bindEvents: ->
    for event, fn of @events
      [ev, selector] = event.split(" ").filter (word) -> word isnt ""
      $(document).on ev, "#{@el} #{selector}", this[fn]

  $: (selector) ->
    $("#{@el} #{selector}")
