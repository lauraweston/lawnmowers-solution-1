require 'controller'

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
