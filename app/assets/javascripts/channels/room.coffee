App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $notes = $('#notes')
    $notes.append data
    $notes.scrollTop $notes.prop('scrollHeight')
    # Called when there's incoming data on the websocket for this channel

  speak: (note)->
    @perform 'speak', note:note
