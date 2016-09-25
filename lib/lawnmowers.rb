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
  attr_reader :lawn_size, :lawnmowers

  def initialize(input)
    @input = input
  end

  def parse
    input_lines = @input.split(/\n/)
    @lawn_size = input_lines[0].split(" ").map {|n| n.to_i}
    @lawnmowers = []
    i = 1
    while i < input_lines.length
      x, y, orientation = input_lines[i].split(" ")
      directions = input_lines[i+1].split("")
      @lawnmowers << { x: x.to_i, y: y.to_i, orientation: orientation, directions: directions }
      i += 2
    end
    [@lawn_size, @lawnmowers]
  end
end

class Controller
  attr_reader :lawn, :lawnmowers_data, :lawn_size, :lawnmowers

  def initialize(input)
    @input = input
  end

  def execute
    parse
    create_lawn
    @lawnmowers = @lawnmowers_data.map do |data|
      lawnmower = create_lawnmower(data)
      direct_lawnmower(lawnmower, data[:directions])
    end
    @lawnmowers.collect { |lawnmower| "#{lawnmower.x_coordinate} #{lawnmower.y_coordinate} #{lawnmower.orientation}" }.join("\n")
  end

  def parse
    @lawn_size, @lawnmowers_data = Parser.new(@input).parse
  end

  def create_lawn
    @lawn = Lawn.new(*@lawn_size)
  end

  def create_lawnmower(lawnmower)
    Lawnmower.new(@lawn, lawnmower[:x], lawnmower[:y], lawnmower[:orientation])
  end

  def direct_lawnmower(lawnmower, directions)
    if !directions.empty?
      directions.each do |direction|
        case direction
        when "L" then lawnmower.turn_left
        when "R" then lawnmower.turn_right
        when "M" then lawnmower.move
        end
      end
    end
    lawnmower
  end

end
