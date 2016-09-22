require 'lawnmowers'

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

  describe 'lawnmower position' do
    it 'can create a lawnmower with position "0 0 N"' do
      lawnmower = Lawnmower.new(0, 0, "N")
      expect(lawnmower.x_coordinate).to eq 0
      expect(lawnmower.y_coordinate).to eq 0
      expect(lawnmower.orientation).to eq "N"
    end
    it 'can create a lawnmower with position "1 2 N"' do
      lawnmower = Lawnmower.new(1, 2, "N")
      expect(lawnmower.x_coordinate).to eq 1
      expect(lawnmower.y_coordinate).to eq 2
      expect(lawnmower.orientation).to eq "N"
    end
    it 'can create a lawnmower with position "3 3 E"' do
      lawnmower = Lawnmower.new(3, 3, "E")
      expect(lawnmower.x_coordinate).to eq 3
      expect(lawnmower.y_coordinate).to eq 3
      expect(lawnmower.orientation).to eq "E"
    end
  end

  describe 'lawnmower orientation' do
    it 'can turn 90 degrees to the left' do
      lawnmower = Lawnmower.new(0, 0, "N")
      lawnmower.turn_left
      expect(lawnmower.orientation).to eq "W"
    end
  end
  
end
