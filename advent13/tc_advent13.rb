#!/usr/bin/ruby
require_relative 'advent13'
require 'test/unit'
class TestAdvent13 < Test::Unit::TestCase

TestData = <<EOF
6,10
0,14
9,10
0,3
10,4
4,11
6,0
6,12
4,1
0,13
10,12
3,4
3,0
8,4
1,10
2,14
8,10
9,0

fold along y=7
fold along x=5
EOF

  def setup
    @test1_1  = [TestData, 17]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent13.new(@test1_1[0]).part1)
  end
  def test_part2
    assert_true(Advent13.new(@test1_1[0]).part2)
  end
end
