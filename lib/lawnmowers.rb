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

  def initialize(x, y, orientation)
    @x_coordinate = x
    @y_coordinate = y
    @orientation = orientation
  end

  def turn_left
    @orientation = @@compass[@@compass.index(@orientation) - 1]
  end

  def turn_right
    @orientation = @@compass[@@compass.index(@orientation) + 1]
  end
end
