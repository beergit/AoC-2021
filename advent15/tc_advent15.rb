#!/usr/bin/ruby
require_relative 'advent15'
require 'test/unit'
class TestAdvent15 < Test::Unit::TestCase

TestData = <<EOF
1163751742
1381373672
2136511328
3694931569
7463417111
1319128137
1359912421
3125421639
1293138521
2311944581
EOF

  def setup
    @test1_1  = [TestData, 40]
    @test2_1  = [TestData, 315]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent15.new(@test1_1[0]).part1)
  end
  def test_part2
    assert_equal(@test2_1[1], Advent15.new(@test2_1[0]).part2)
  end
end
