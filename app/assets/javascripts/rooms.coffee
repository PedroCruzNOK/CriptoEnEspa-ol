# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

->
  $notes= $('#notes')
  $notes.scrollTop $notes.prop('scrollHeight')
  $('#notes_input').focus()

  $(document).on 'keypress', '#message_input', (e)->
    if e.keyCode == 13 and e.target.value
      App.room.speak(e.target.value)
      e.target.value = ''
      e.preventDefault()
