require 'lawnmowers'

class Lawn
  attr_reader :width, :length

  def initialize(x, y)
    @width = x
    @length = y
  end
end

describe 'lawnmowers' do
  it 'creates a lawn of size 0,0' do
    lawn = Lawn.new(0,0)
    expect(lawn.width).to eq 0
    expect(lawn.length).to eq 0
  end
  it 'creates a lawn of size 1,1' do
    lawn = Lawn.new(1,1)
    expect(lawn.width).to eq 1
    expect(lawn.length).to eq 1
  end
end
