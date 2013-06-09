class @Header.UserPanel extends App.Component

  initialize: ->
    App.vent.bind 'vitals:updated', @updateVitals

  updateVitals: (e, vitals) =>
    
