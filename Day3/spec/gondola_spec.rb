require "gondola"

# describe "#function" do
#   it "should do something" do
#     expect(function("--")).to eq([---])
#   end
# end

input = "467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598.."

input2 = "100...100
....@....
...222...
.........
..@222...
.........
...222@..
.........
...222...
....@....
100...100"

input3 = "100...100
...+.+...
...222...
......@..
...222...
.........
...222...
..@......
...222...
.........
100...100"

input4 = "100+..100
....@...+
...222...
.........
..@222...
.........
...222@..
.........
...222...
.+..@....
100..+100"


describe "#check_gondola" do
  it "should sum up all gondola parts and return an integer" do
    expect(check_gondola(input).class).to eq(Integer)
    expect(check_gondola(input)).to be > 0
    expect(check_gondola(input)).to eq(4361)
    expect(check_gondola(input2)).to eq(888)
    expect(check_gondola(input3)).to eq(1088)
    expect(check_gondola(input4)).to eq(1288)
  end
end


describe "#get_parts" do
  it "should return an array of all the parts" do
    expect(get_parts(input).class).to eq(Array)
    expect(get_parts(input).include?(114)).to eq(false)
    expect(get_parts(input).include?(58)).to eq(false)
    expect(get_parts(input).include?(467)).to eq(true)
    expect(get_parts(input).include?(633)).to eq(true)
    expect(get_parts(input).include?(35)).to eq(true)
    expect(get_parts(input).include?(617)).to eq(true)
    expect(get_parts(input).include?(592)).to eq(true)
    expect(get_parts(input).include?(755)).to eq(true)
    expect(get_parts(input).include?(664)).to eq(true)
    expect(get_parts(input).include?(598)).to eq(true)
    expect(get_parts(input).length).to eq(8)
  end
end

lines = input.split("\n")
describe "#check_if_parts" do
  it "should return true if it is a valid part" do
    expect(check_if_parts({:value => "467", :index => 0, :line => 0}, lines)).to eq(true)
    expect(check_if_parts({:value => "35", :index => 2, :line => 2}, lines)).to eq(true)
    expect(check_if_parts({:value => "633", :index => 6, :line => 2}, lines)).to eq(true)
    expect(check_if_parts({:value => "617", :index => 0, :line => 4}, lines)).to eq(true)
    expect(check_if_parts({:value => "592", :index => 2, :line => 6}, lines)).to eq(true)
    expect(check_if_parts({:value => "755", :index => 6, :line => 7}, lines)).to eq(true)
    expect(check_if_parts({:value => "664", :index => 1, :line => 9}, lines)).to eq(true)
    expect(check_if_parts({:value => "598", :index => 5, :line => 9}, lines)).to eq(true)
    expect(check_if_parts({:value => "114", :index => 5, :line => 0}, lines)).to eq(false)
    expect(check_if_parts({:value => "58", :index => 7, :line => 5}, lines)).to eq(false)
  end
end
