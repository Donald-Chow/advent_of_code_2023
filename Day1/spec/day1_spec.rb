require "day1"

test_string = "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet"

test_string2 = "12
38
12345
7"

test_string3 = "9vxfg
19qdlpmdrxone7sevennine
1dzntwofour9nineffck
7bx8hpldgzqjheight
joneseven2sseven64chvczzn
seven82683
7onefour1eighttwo5three
8lmsk871eight7
ninefivefive2nine5ntvscdfdsmvqgcbxxxt
onepx6hbgdssfivexs"

test_string4 = "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"


describe "#calibration_value" do
  it "should work on strings that are just number as well" do
    expect(calibration_value("12")).to eq(12)
    expect(calibration_value("38")).to eq(38)
    expect(calibration_value("12345")).to eq(15)
    expect(calibration_value("7")).to eq(77)
  end

  it "should work on strings that are just text as well" do
    expect(calibration_value("onetwo")).to eq(12)
    expect(calibration_value("threeeight")).to eq(38)
    expect(calibration_value("onetwothreefourfive")).to eq(15)
    expect(calibration_value("seven")).to eq(77)
    expect(calibration_value("eightwo")).to eq(82)
    expect(calibration_value("oneight")).to eq(18)
  end

  it "should return the first and last digit of each line" do
    expect(calibration_value("1abc2")).to eq(12)
    expect(calibration_value("pqr3stu8vwx")).to eq(38)
    expect(calibration_value("a1b2c3d4e5f")).to eq(15)
    expect(calibration_value("treb7uchet")).to eq(77)
  end

  it "should return the first and last digit of each for test 2" do
    expect(calibration_value("9vxfg")).to eq(99)
    expect(calibration_value("19qdlpmdrxone7sevennine")).to eq(19)
    expect(calibration_value("7bx8hpldgzqjheight")).to eq(78)
    expect(calibration_value("seven82683")).to eq(73)
  end

  it "should return the first and last digit of each for test advance" do
    expect(calibration_value("two1nine")).to eq(29)
    expect(calibration_value("eightwothree")).to eq(83)
    expect(calibration_value("abcone2threexyz")).to eq(13)
    expect(calibration_value("xtwone3four")).to eq(24)
    expect(calibration_value("4nineeightseven2")).to eq(42)
    expect(calibration_value("zoneight234")).to eq(14)
    expect(calibration_value("7pqrstsixteen")).to eq(76)
  end
end

describe "#trebuchet" do
  it "should return integer" do
    expect(trebuchet(test_string).class).to eq(Integer)
    expect(trebuchet(test_string2).class).to eq(Integer)
    expect(trebuchet(test_string3).class).to eq(Integer)
    expect(trebuchet(test_string4).class).to eq(Integer)
  end

  it "should return sum of calibration values" do
    expect(trebuchet(test_string)).to eq(142)
    expect(trebuchet(test_string2)).to eq(142)
    expect(trebuchet(test_string3)).to eq(572)
    expect(trebuchet(test_string4)).to eq(281)
  end
end
