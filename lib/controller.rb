require_relative 'lawn'
require_relative 'lawnmower'
require_relative 'parser'

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
