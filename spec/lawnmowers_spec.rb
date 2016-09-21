require 'lawnmowers'

class Lawn
  attr_reader :width, :length

  def initialize
    @width = 0
    @length = 0
  end
end


describe 'lawnmowers' do
  it 'creates a lawn of size 0,0' do
    lawn = Lawn.new
    expect(lawn.width).to eq 0
    expect(lawn.length).to eq 0
  end
end
