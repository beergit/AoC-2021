#!/usr/bin/ruby
require_relative 'advent5'
require 'test/unit'
class TestAdvent5 < Test::Unit::TestCase
TestData = <<EOF
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
EOF

  def setup
    @test1_1  = [TestData, 5]
    @test2_1  = [TestData, 12]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent5.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent5.new(@test2_1[0]).part2)
  end
end
