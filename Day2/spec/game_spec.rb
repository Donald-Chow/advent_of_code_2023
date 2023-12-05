require "game"

data = [
  {:id => 1,
  :results => [
    { :blue => 3, :green => 7, :red => 10 },
    { :green => 4, :red => 4 },
    { :green => 1, :blue => 7, :red => 5 },
    { :blue => 8, :red => 10 },
    { :blue => 7, :red => 19, :green => 1 }]},
  {:id => 9,
  :results => [
    { :green => 4, :red => 1, :blue => 1 },
    { :green => 4, :blue => 7, :red => 7 },
    { :blue => 9, :red => 4 },
    { :blue => 2, :red => 8, :green => 5 },
    { :blue => 6, :green => 2 },
    { :red => 5, :green => 5, :blue => 10 }]}
  ]

data2 = [
  {:id => 1,
  :results => [
    { :blue => 3, :green => 14, :red => 10 }]},
  {:id => 2,
  :results => [
    { :blue => 3, :green => 7, :red => 13 }]},
  {:id => 3,
  :results => [
    { :blue => 15, :green => 7, :red => 10 }]},
  {:id => 4,
  :results => [
    { :blue => 14, :green => 13, :red => 12 }]},
  {:id => 5,
  :results => [
    { :blue => 3, :green => 7, :red => 10 }]}
]

describe "#check_and_sum" do
  it "should return sum of calibration values" do
    expect(check_and_sum(data)).to eq(9)
    expect(check_and_sum(data2)).to eq(9)
  end
end


describe "#parse_game" do
  it "should turn block of string into a hash" do
    expect(parse_game("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green")).to eq([
  {:id=>1,
    :results=>
      [{:blue=>3, :green=>0, :red=>4},
      {:blue=>6, :green=>2, :red=>1},
      {:blue=>0, :green=>2, :red=>0}]},
  { :id=>2,
    :results=>
      [{:blue=>1, :green=>2, :red=>0},
      {:blue=>4, :green=>3, :red=>1},
      {:blue=>1, :green=>1, :red=>0}]},
  { :id=>3,
    :results=>
      [{:blue=>6, :green=>8, :red=>20},
      {:blue=>5, :green=>13, :red=>4},
      {:blue=>0, :green=>5, :red=>1}]},
  { :id=>4,
    :results=>
      [{:blue=>6, :green=>1, :red=>3},
      {:blue=>0, :green=>3, :red=>6},
      {:blue=>15, :green=>3, :red=>14}]},
  { :id=>5,
    :results=>
      [{:blue=>1, :green=>3, :red=>6},
      {:blue=>2, :green=>2, :red=>1}]}
  ])
  end
end

describe "#check_possibility" do
  it "should return the sum of ID that is possible" do
    expect(check_possibility("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green")).to eq(8)

    expect(check_possibility("Game 10: 1 green, 5 blue, 3 red; 4 green, 9 red, 3 blue; 11 red, 2 green, 5 blue; 3 green, 1 blue, 2 red; 6 red, 2 blue
    Game 11: 2 red, 6 green, 12 blue; 2 red, 9 blue, 1 green; 12 green, 3 blue
    Game 12: 1 red, 1 blue, 12 green; 6 green, 2 red, 1 blue; 6 red, 6 green, 1 blue; 3 green, 6 red
    Game 13: 5 red, 19 green, 3 blue; 6 red, 7 blue, 11 green; 8 blue, 6 red; 3 blue, 4 green, 4 red; 8 red, 15 green, 5 blue; 5 blue, 2 red, 10 green
    Game 14: 5 blue, 9 green; 4 green, 6 blue; 14 green, 1 red, 4 blue; 3 blue, 3 green; 2 green; 5 blue, 7 green, 1 red
    Game 15: 5 red, 8 blue; 9 blue, 3 red; 5 red, 1 green, 16 blue; 1 blue, 3 red, 2 green; 5 red, 2 green, 10 blue")).to eq(33)
  end
end

input_with_power = [
  {:id=>1,
    :results=>
      [{:blue=>3, :green=>0, :red=>4},
      {:blue=>6, :green=>2, :red=>1},
      {:blue=>0, :green=>2, :red=>0}],
    :power=> 48},
  { :id=>2,
    :results=>
      [{:blue=>1, :green=>2, :red=>0},
      {:blue=>4, :green=>3, :red=>1},
      {:blue=>1, :green=>1, :red=>0}],
      :power=> 12},
  { :id=>3,
    :results=>
      [{:blue=>6, :green=>8, :red=>20},
      {:blue=>5, :green=>13, :red=>4},
      {:blue=>0, :green=>5, :red=>1}],
      :power=> 1560},
  { :id=>4,
    :results=>
      [{:blue=>6, :green=>1, :red=>3},
      {:blue=>0, :green=>3, :red=>6},
      {:blue=>15, :green=>3, :red=>14}],
      :power=> 630 },
  { :id=>5,
    :results=>
      [{:blue=>1, :green=>3, :red=>6},
      {:blue=>2, :green=>2, :red=>1}],
      :power=> 36 }
  ]

describe "#add_power" do
  it "should add a power to the hash" do
    expect(add_power({ :id=>5, :results=> [{:blue=>1, :green=>3, :red=>6}, {:blue=>2, :green=>2, :red=>1}]})).to eq(
      { :id=>5,
      :results=>
        [{:blue=>1, :green=>3, :red=>6},
        {:blue=>2, :green=>2, :red=>1}],
        :power=> 36 })
        expect(add_power({ :id=>5, :results=> [{:blue=>1, :green=>3, :red=>6}, {:blue=>2, :green=>2, :red=>1}]})[:power]).to eq(36)
        expect(add_power({ :id=>4,
        :results=>
          [{:blue=>6, :green=>1, :red=>3},
          {:blue=>0, :green=>3, :red=>6},
          {:blue=>15, :green=>3, :red=>14}]})[:power]).to eq(630)
  end
end

describe "#sum_power" do
  it "should return an positive integer" do
    expect(sum_power(input_with_power).class).to eq(Integer)
    expect(sum_power(input_with_power)).to be >= 0
  end
  it "should return the sum of all powers for all the game" do
    expect(sum_power(input_with_power)).to eq(2286)
  end
end

input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

describe "#part_two" do
it "should return an positive integer" do
  expect(part_two(input).class).to eq(Integer)
  expect(part_two(input)).to be >= 0
end
it "should return the sum of all powers for all the game" do
  expect(part_two(input)).to eq(2286)
end
end
