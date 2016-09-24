class Lawn
  attr_reader :width, :length
  def initialize(x, y)
    @width = x
    @length = y
  end
end

class Lawnmower
  attr_reader :x_coordinate, :y_coordinate, :orientation
  @@compass = ["N", "E", "S", "W"]

  def initialize(lawn, x, y, orientation)
    @lawn = lawn
    @x_coordinate = x
    @y_coordinate = y
    @orientation = orientation
  end

  def turn_left
    @orientation = @@compass[@@compass.index(@orientation) - 1]
  end

  def turn_right
    @orientation = @@compass[@@compass.index(@orientation) - 3]
  end

  def move
    case @orientation
    when "N" then @y_coordinate += 1 unless @y_coordinate == @lawn.length
    when "S" then @y_coordinate -= 1 unless @y_coordinate == 0
    when "E" then @x_coordinate += 1 unless @x_coordinate == @lawn.width
    when "W" then @x_coordinate -= 1 unless @x_coordinate == 0
    end
  end
end
