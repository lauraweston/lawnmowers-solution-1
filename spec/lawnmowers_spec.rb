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
  lawn = Lawn.new(4, 5)
  context 'on a lawn of size "5 5"' do
     it 'can have position "0 0 N"' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "N")
      expect(lawnmower.x_coordinate).to eq 0
      expect(lawnmower.y_coordinate).to eq 0
      expect(lawnmower.orientation).to eq "N"
    end
    it 'can have position "1 2 N"' do
      lawnmower = Lawnmower.new(lawn, 1, 2, "N")
      expect(lawnmower.x_coordinate).to eq 1
      expect(lawnmower.y_coordinate).to eq 2
      expect(lawnmower.orientation).to eq "N"
    end
    it 'can have position "3 3 E"' do
      lawnmower = Lawnmower.new(lawn, 3, 3, "E")
      expect(lawnmower.x_coordinate).to eq 3
      expect(lawnmower.y_coordinate).to eq 3
      expect(lawnmower.orientation).to eq "E"
    end
    it 'can turn 90 degrees to the left when orientation is "N"' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "N")
      lawnmower.turn_left
      expect(lawnmower.orientation).to eq "W"
    end
    it 'can turn 90 degrees to the right when orientation is "N"' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "N")
      lawnmower.turn_right
      expect(lawnmower.orientation).to eq "E"
    end
    it 'can turn 90 degrees to the left when orientation is "W"' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "W")
      lawnmower.turn_left
      expect(lawnmower.orientation).to eq "S"
    end
    it 'can turn 90 degrees to the right when orientation is "W"' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "W")
      lawnmower.turn_right
      expect(lawnmower.orientation).to eq "N"
    end
    it 'can turn 90 degrees to the left when orientation is "E"' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "E")
      lawnmower.turn_left
      expect(lawnmower.orientation).to eq "N"
    end
    it 'can turn 90 degrees to the right when orientation is "E"' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "E")
      lawnmower.turn_right
      expect(lawnmower.orientation).to eq "S"
    end
    it 'can turn 90 degrees to the left when orientation is "S"' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "S")
      lawnmower.turn_left
      expect(lawnmower.orientation).to eq "E"
    end
    it 'can turn 90 degrees to the right when orientation is "S"' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "S")
      lawnmower.turn_right
      expect(lawnmower.orientation).to eq "W"
    end
    it 'can move one grid forward when facing N' do
      lawnmower = Lawnmower.new(lawn, 0, 0, "N")
      lawnmower.move
      expect(lawnmower.x_coordinate).to eq 0
      expect(lawnmower.y_coordinate).to eq 1
    end
    it 'can move one grid forward when facing S' do
      lawnmower = Lawnmower.new(lawn, 1, 1, "S")
      lawnmower.move
      expect(lawnmower.x_coordinate).to eq 1
      expect(lawnmower.y_coordinate).to eq 0
    end
    it 'can move one grid forward when facing E' do
      lawnmower = Lawnmower.new(lawn, 1, 1, "E")
      lawnmower.move
      expect(lawnmower.x_coordinate).to eq 2
      expect(lawnmower.y_coordinate).to eq 1
    end
    it 'can move one grid forward when facing W' do
      lawnmower = Lawnmower.new(lawn, 1, 1, "W")
      lawnmower.move
      expect(lawnmower.x_coordinate).to eq 0
      expect(lawnmower.y_coordinate).to eq 1
    end

    context 'facing "S" at south edge of lawn' do
      it 'cannot move off the lawn' do
        lawnmower = Lawnmower.new(lawn, 0, 0, "S")
        lawnmower.move
        expect(lawnmower.x_coordinate).to eq 0
        expect(lawnmower.y_coordinate).to eq 0
        expect(lawnmower.orientation).to eq "S"
      end
    end

    context 'facing "W" at west edge of lawn' do
      it 'cannot move off the lawn' do
        lawnmower = Lawnmower.new(lawn, 0, 0, "W")
        lawnmower.move
        expect(lawnmower.x_coordinate).to eq 0
        expect(lawnmower.y_coordinate).to eq 0
        expect(lawnmower.orientation).to eq "W"
      end
    end

    context 'facing "N" at north edge of lawn' do
      it 'cannot move off the lawn' do
        lawnmower = Lawnmower.new(lawn, 0, 5, "N")
        lawnmower.move
        expect(lawnmower.x_coordinate).to eq 0
        expect(lawnmower.y_coordinate).to eq 5
        expect(lawnmower.orientation).to eq "N"
      end
    end

    context 'facing "E" at east edge of lawn' do
      it 'cannot move off the lawn' do
        lawnmower = Lawnmower.new(lawn, 4, 0, "E")
        lawnmower.move
        expect(lawnmower.x_coordinate).to eq 4
        expect(lawnmower.y_coordinate).to eq 0
        expect(lawnmower.orientation).to eq "E"
      end
    end
  end
end
