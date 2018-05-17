about = '/about-me'

ready = ->
  Typed.new '.element',
    strings: [
      'Welcome to my portfolio'
      'Software development is the closest concept we have to magic.'
      "Find more <a href='/about-me'>about me</a>"
    ]
    typeSpeed: 30
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
