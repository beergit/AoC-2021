#!/usr/bin/ruby
require_relative 'advent3'
require 'test/unit'
class TestAdvent3 < Test::Unit::TestCase
 
TestData = <<EOF
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
EOF

  def setup
    @test1_1  = [TestData, 198]
    @test2_1  = [TestData, 230]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent3.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent3.new(@test2_1[0]).part2)
  end
end
