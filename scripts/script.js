(function() {
  var draw_canvas;

  window.onload = function() {
    return draw_canvas();
  };

  draw_canvas = function() {
    var Square, canvas, ch, ctx, cw, instances, mainLoop, n, random, _i;
    canvas = document.getElementById("c");
    cw = canvas.width = window.innerWidth;
    ch = canvas.height = window.innerHeight;
    ctx = canvas.getContext("2d");
    random = function(n) {
      return Math.random() * n;
    };
    Square = (function() {
      function Square() {
        var radian;
        radian = (Math.PI * 360) * random(1);
        this.x = random(cw);
        this.y = random(ch);
        this.to_x = Math.cos(radian);
        this.to_y = Math.sin(radian);
        this.speed = 2 + random(3);
        this.size = 1 + random(4);
      }

      Square.prototype.move = function() {
        this.x += this.to_x * this.speed;
        this.y += this.to_y * this.speed;
        return this.out_square_in();
      };

      Square.prototype.out_square_in = function() {
        if (this.x + this.size < 0) {
          this.x = cw;
        }
        if (this.x > cw) {
          this.x = 0 - this.size;
        }
        if (this.y + this.size < 0) {
          this.y = ch;
        }
        if (this.y > ch) {
          return this.y = 0 - this.size;
        }
      };

      return Square;

    })();
    instances = [];
    for (n = _i = 0; _i < 200; n = ++_i) {
      instances.push(new Square());
    }
    return (mainLoop = function() {
      var i, p, _j, _ref;
      ctx.clearRect(0, 0, cw, ch);
      ctx.fillStyle = "black";
      ctx.fillRect(0, 0, cw, ch);
      for (i = _j = 0, _ref = instances.length; 0 <= _ref ? _j < _ref : _j > _ref; i = 0 <= _ref ? ++_j : --_j) {
        p = instances[i];
        ctx.fillStyle = "white";
        ctx.fillRect(p.x, p.y, p.size, p.size);
        p.move();
      }
      return setTimeout(mainLoop, 50);
    })();
  };

}).call(this);
