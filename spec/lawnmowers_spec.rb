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

describe 'parser' do
  it 'can take a set of instructions' do
    parser = Parser.new("5 5\n1 2 N\nLML")
    parser.parse
    expect(parser.lawn_size).to eq [5, 5]
    expect(parser.lawnmowers[0][:x]).to eq 1
    expect(parser.lawnmowers[0][:y]).to eq 2
    expect(parser.lawnmowers[0][:orientation]).to eq "N"
    expect(parser.lawnmowers[0][:directions]).to eq ["L", "M", "L"]
  end
  it 'has a parse method which returns an array' do
    parser = Parser.new("5 5\n1 2 N\nLML")
    expect(parser.parse).to eq [[5,5], [{x: 1, y: 2, orientation: "N", directions: ["L", "M", "L"]}]]
  end
  it 'can parse instructions for multiple lawnmowers' do
    parser = Parser.new("5 5\n1 2 N\nLML\n3 3 E\nMMR")
    expect(parser.parse).to eq [[5,5], [{x: 1, y: 2, orientation: "N", directions: ["L", "M", "L"]}, {x: 3, y: 3, orientation: "E", directions: ["M", "M", "R"]}]]
  end
end

describe 'controller' do
  it 'can parse a string' do
    controller = Controller.new("5 5\n1 2 N\nLML")
    controller.execute
    expect(controller.lawn_size).to eq [5, 5]
    expect(controller.lawnmowers_data[0][:x]).to eq 1
    expect(controller.lawnmowers_data[0][:y]).to eq 2
    expect(controller.lawnmowers_data[0][:orientation]).to eq "N"
    expect(controller.lawnmowers_data[0][:directions]).to eq ["L", "M", "L"]
  end
  it 'can create a lawn' do
    controller = Controller.new("5 5\n1 2 N\nLML")
    controller.execute
    expect(controller.lawn_size).to eq [5, 5]
    expect(controller.lawn.width).to eq 5
    expect(controller.lawn.length).to eq 5
  end
  it 'can create a lawnmower' do
    controller = Controller.new("5 5\n1 2 N\nLML")
    controller.execute
    expect(controller.lawnmowers).not_to be_empty
  end
  it 'can direct a lawnmower' do
    controller = Controller.new("5 5\n1 2 N\nLML")
    controller.execute
    expect(controller.lawnmowers[0].x_coordinate).to eq 0
    expect(controller.lawnmowers[0].y_coordinate).to eq 2
    expect(controller.lawnmowers[0].orientation).to eq "S"
  end
  it 'takes string input and outputs lawnmower final coordinates' do
    controller = Controller.new("5 5\n1 2 N\nLML")
    expect(controller.execute).to eq "0 2 S"
  end
  it 'can direct multiple lawnmowers' do
    controller = Controller.new("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
    expect(controller.execute).to eq "1 3 N\n5 1 E"
  end
end
