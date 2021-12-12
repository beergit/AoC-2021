#!/usr/bin/ruby
require_relative 'advent11'
require 'test/unit'
class TestAdvent11 < Test::Unit::TestCase

TestData = <<EOF
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
EOF

  def setup
    @test1_1  = [TestData, 1656]
    @test2_1  = [TestData, 195]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent11.new(@test1_1[0]).part1)
  end

    def test_part2
      assert_equal(@test2_1[1], Advent11.new(@test2_1[0]).part2)
  end
end
