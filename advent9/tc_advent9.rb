#!/usr/bin/ruby
require_relative 'advent9'
require 'test/unit'
class TestAdvent9 < Test::Unit::TestCase

TestData = <<EOF
2199943210
3987894921
9856789892
8767896789
9899965678
EOF

  def setup
    @test1_1  = [TestData, 15]
    @test2_1  = [TestData, 1134]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent9.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent9.new(@test2_1[0]).part2)
  end
end
