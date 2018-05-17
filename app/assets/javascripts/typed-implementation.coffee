about = '/about-me'

ready = ->
  Typed.new '.element',
    strings: [
      'Welcome to my portfolio'
      'Software development is the closest concept we have to magic.'
    ]
    typeSpeed: 30
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
