class @Content.Skip extends App.Component

  events:
    'click .skip' : 'skipContent'

  skipCopntent: (e) =>
    e.preventDefault()
    console.log('perfection')
    false
