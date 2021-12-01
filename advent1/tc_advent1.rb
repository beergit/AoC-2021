#!/usr/bin/ruby
require_relative 'advent1'
require 'test/unit'
class TestAdvent1 < Test::Unit::TestCase
 
TestData = <<EOF
199
200
208
210
200
207
240
269
260
263
EOF

  def setup
    @test1_1  = [TestData, 7]
    @test2_1  = [TestData, 5]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent1.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent1.new(@test2_1[0]).part2)
  end
end
