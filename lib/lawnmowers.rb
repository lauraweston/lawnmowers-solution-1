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

class Parser
  attr_reader :lawn_size, :lawnmower_x_coordinate, :lawnmower_y_coordinate,
              :lawnmower_orientation, :directions

  def initialize(input)
    @input = input
  end

  def parse
    lawn, lawnmower_position, directions = @input.split(/\n/)
    @lawn_size = lawn.split(" ").map {|n| n.to_i}
    x, y, @lawnmower_orientation = lawnmower_position.split(" ")
    @lawnmower_x_coordinate = x.to_i
    @lawnmower_y_coordinate = y.to_i
    @directions = directions.split("")
    [@lawn_size, @lawnmower_x_coordinate, @lawnmower_y_coordinate, @lawnmower_orientation, @directions]
  end
end

class Controller
  attr_reader :lawn, :lawn_size, :lawnmower_x_coordinate, :lawnmower_y_coordinate,
              :lawnmower_orientation, :directions
  def initialize(input)
    @input = input
  end

  def parse
    @lawn_size, @lawnmower_x_coordinate, @lawnmower_y_coordinate, @lawnmower_orientation, @directions = Parser.new(@input).parse
  end

  def create_lawn
    @lawn = Lawn.new(*@lawn_size)
  end
end
