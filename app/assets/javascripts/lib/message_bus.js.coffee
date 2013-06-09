# Event Aggregator
#
# A module that collects and published application level events.

@App.vent =

  bind: (event, args, fn) ->
    $(this).bind event, args, fn

  trigger: (event, args) ->
    $(this).trigger event, args

@App.reqres =

  request: (event) ->
    $(this).triggerHandler event

  register: (event, fn) ->
    $(this).bind event, fn
