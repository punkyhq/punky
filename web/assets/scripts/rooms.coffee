module.exports = ->
  socket = new Phoenix.Socket("/ws")

  $messages  = $("#messages")
  $input     = $("#message-input")
  sanitize   = (html) ->
    $("<div/>").text(html).html()

  messageTemplate = (message) ->
    username = sanitize(message.username || "anonymous")
    body     = sanitize(message.body)
    "<p><a href='#'>[#{username}]</a>&nbsp; #{body}</p>"

  socket.join "rooms:lobby", {}, (chan) ->
    $input.on "keypress", (e) ->
      if e.keyCode == 13
        chan.send("new:message", {username: "Meck", body: $input.val()})
        $input.val("")

    chan.on "join", (message) ->
      console.log(message)

    chan.on "new:message", (message) ->
      $messages.append(messageTemplate(message))
      scrollTo(0, document.body.scrollHeight)

    chan.on "user:entered", (msg) ->
      console.log(message)
      username = sanitize(msg.username || "anonymous")
      $messages.append("<br/><i>[#{username} entered]</i>")
