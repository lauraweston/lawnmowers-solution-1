require 'parser'

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
