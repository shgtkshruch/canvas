window.onload = ->
  draw_canvas()

draw_canvas = ->
  canvas = document.getElementById "c"
  cw = canvas.width = window.innerWidth
  ch = canvas.height = window.innerHeight

  ctx = canvas.getContext "2d"

  color = ["red", "blue", "green", "pink", "yellow"]

  random = (n) ->
    Math.floor Math.random() * n

  clear = ->
    canvas.width = cw
    canvas.height = ch

  y = 0
  l = 100

  (mainLoop = ->
    clear()

    y = 0 if y > ch

    # for i in [1..cw/15]
    #   x = (i + 0.5) * 15
    #   ctx.moveTo x, y
    #   ctx.lineTo x, y + l

    ctx.moveTo 100, y
    ctx.lineTo 100, y + l

    ctx.stroke()

    y += 200

    # setTimeout mainLoop, 1000
  )()
