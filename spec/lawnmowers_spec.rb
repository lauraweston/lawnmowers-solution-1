require 'lawnmowers'

class Lawn
  attr_reader :width, :length
  def initialize(x, y)
    @width = x
    @length = y
  end
end

class Lawnmower
  attr_reader :x_coordinate, :y_coordinate, :orientation
  def initialize
    @x_coordinate = 0
    @y_coordinate = 0
    @orientation = "N"
  end
end

describe 'lawnmowers' do

  describe 'lawn' do
    it 'can create a lawn of size 0,0' do
      lawn = Lawn.new(0,0)
      expect(lawn.width).to eq 0
      expect(lawn.length).to eq 0
    end
    it 'can create a lawn of size 1,1' do
      lawn = Lawn.new(1,1)
      expect(lawn.width).to eq 1
      expect(lawn.length).to eq 1
    end
    it 'can create a lawn of size 1,2' do
      lawn = Lawn.new(1,2)
      expect(lawn.width).to eq 1
      expect(lawn.length).to eq 2
    end
    it 'can create a lawn of size 2,1' do
      lawn = Lawn.new(2,1)
      expect(lawn.width).to eq 2
      expect(lawn.length).to eq 1
    end
  end

  describe 'lawnmower' do
    it 'can create a lawnmower with position "0 0 N"' do
      lawnmower = Lawnmower.new
      expect(lawnmower.x_coordinate).to eq 0
      expect(lawnmower.y_coordinate).to eq 0
      expect(lawnmower.orientation).to eq "N"
    end
  end

end
