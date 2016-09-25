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
