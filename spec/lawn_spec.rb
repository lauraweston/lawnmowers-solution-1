require 'lawn'

describe Lawn do
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
