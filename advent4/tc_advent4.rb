#!/usr/bin/ruby
require_relative 'advent4'
require 'test/unit'
class TestAdvent4 < Test::Unit::TestCase
 
TestData = <<EOF
7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
EOF

  def setup
    @test1_1  = [TestData, 4512]
    @test2_1  = [TestData, 1924]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent4.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent4.new(@test2_1[0]).part2)
  end
end
