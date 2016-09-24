require 'lawnmowers'

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

describe Lawnmower do
  context 'position' do
     it 'is "0 0 N"' do
      lawnmower = Lawnmower.new(0, 0, "N")
      expect(lawnmower.x_coordinate).to eq 0
      expect(lawnmower.y_coordinate).to eq 0
      expect(lawnmower.orientation).to eq "N"
    end
    it 'is "1 2 N"' do
      lawnmower = Lawnmower.new(1, 2, "N")
      expect(lawnmower.x_coordinate).to eq 1
      expect(lawnmower.y_coordinate).to eq 2
      expect(lawnmower.orientation).to eq "N"
    end
    it 'is "3 3 E"' do
      lawnmower = Lawnmower.new(3, 3, "E")
      expect(lawnmower.x_coordinate).to eq 3
      expect(lawnmower.y_coordinate).to eq 3
      expect(lawnmower.orientation).to eq "E"
    end
  end

  context 'when orientation is "N",' do
    it 'can turn 90 degrees to the left' do
      lawnmower = Lawnmower.new(0, 0, "N")
      lawnmower.turn_left
      expect(lawnmower.orientation).to eq "W"
    end
    it 'can turn 90 degrees to the right' do
      lawnmower = Lawnmower.new(0, 0, "N")
      lawnmower.turn_right
      expect(lawnmower.orientation).to eq "E"
    end
  end

  context 'when orientation is "W",' do
    it 'can turn 90 degrees to the left' do
      lawnmower = Lawnmower.new(0, 0, "W")
      lawnmower.turn_left
      expect(lawnmower.orientation).to eq "S"
    end
    it 'can turn 90 degrees to the right' do
      lawnmower = Lawnmower.new(0, 0, "W")
      lawnmower.turn_right
      expect(lawnmower.orientation).to eq "N"
    end
  end

  context 'when orientation is "E",' do
    it 'can turn 90 degrees to the left' do
      lawnmower = Lawnmower.new(0, 0, "E")
      lawnmower.turn_left
      expect(lawnmower.orientation).to eq "N"
    end
    it 'can turn 90 degrees to the right' do
      lawnmower = Lawnmower.new(0, 0, "E")
      lawnmower.turn_right
      expect(lawnmower.orientation).to eq "S"
    end
  end

  context 'when orientation is "S",' do
    it 'can turn 90 degrees to the left' do
      lawnmower = Lawnmower.new(0, 0, "S")
      lawnmower.turn_left
      expect(lawnmower.orientation).to eq "E"
    end
    it 'can turn 90 degrees to the right' do
      lawnmower = Lawnmower.new(0, 0, "S")
      lawnmower.turn_right
      expect(lawnmower.orientation).to eq "W"
    end
  end

  context 'movement' do
    it 'can move one grid forward when facing N' do
      lawnmower = Lawnmower.new(0, 0, "N")
      lawnmower.move
      expect(lawnmower.x_coordinate).to eq 0
      expect(lawnmower.y_coordinate).to eq 1
    end
    it 'can move one grid forward when facing S' do
      lawnmower = Lawnmower.new(1, 1, "S")
      lawnmower.move
      expect(lawnmower.x_coordinate).to eq 1
      expect(lawnmower.y_coordinate).to eq 0
    end
    it 'can move one grid forward when facing E' do
      lawnmower = Lawnmower.new(1, 1, "E")
      lawnmower.move
      expect(lawnmower.x_coordinate).to eq 2
      expect(lawnmower.y_coordinate).to eq 1
    end
    it 'can move one grid forward when facing W' do
      lawnmower = Lawnmower.new(1, 1, "W")
      lawnmower.move
      expect(lawnmower.x_coordinate).to eq 0
      expect(lawnmower.y_coordinate).to eq 1
    end
  end
end
