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
      radian = (Math.PI * 360) * random 1
      @x = random cw
      @y = random ch
      @to_x = Math.cos radian
      @to_y = Math.sin radian
      @speed = 2 + random 3
      @size = 1 + random 4

    move: ->
      @x += @to_x * @speed
      @y += @to_y * @speed
      @out_square_in()

    out_square_in: ->
      @x = cw if @x + @size < 0
      @x = 0 - @size if @x > cw
      @y = ch if @y + @size < 0
      @y = 0 - @size if @y > ch

  # Start
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

    setTimeout mainLoop, 50
  )()
