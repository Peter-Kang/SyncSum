@App.config = do ->

  App.reqres.register 'colors:error', -> '#ffccba'
  App.reqres.register 'colors:red',   -> '#fb6c6c'
  App.reqres.register 'colors:green', -> '#66ff66'
