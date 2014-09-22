window.onload = ->
  draw_canvas()

draw_canvas = ->
  canvas = document.getElementById "c"
  cw = canvas.width = window.innerWidth
  ch = canvas.height = window.innerHeight

  ctx = canvas.getContext "2d"

  random = (n) ->
    Math.random() * n

  class Square
    constructor: ->
      @x = random cw
      @y = random ch
      @speed = 2 + random 3
      @size = 1 + random 4

    move: ->
      @x = @x + @speed
      @y = @y + @speed
      @out_square_in()

    out_square_in: ->
      @x = cw if @x < 0
      @x = 0 if @x > cw
      @y = ch if @y < 0
      @y = 0 if @y > ch

  instances = []
  for n in [0...200]
    instances.push new Square()

  (mainLoop = ->
    ctx.clearRect 0, 0, cw, ch

    ctx.fillStyle = "black"
    ctx.fillRect 0, 0, cw, ch

    for i in [0...instances.length]
      p = instances[i]
      ctx.fillStyle = "white"
      ctx.fillRect p.x, p.y, p.size, p.size

      p.move()
      # console.log p.speed

    setTimeout mainLoop, 50
  )()
