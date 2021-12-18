#!/usr/bin/ruby
require_relative 'advent17'
require 'test/unit'
class TestAdvent17 < Test::Unit::TestCase

TestData = 'target area: x=20..30, y=-10..-5'

  def setup
    @test1_1  = [TestData, 45]
    @test2_1  = [TestData, 112]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent17.new(@test1_1[0]).part1)
  end
  def test_part2
    assert_equal(@test2_1[1], Advent17.new(@test2_1[0]).part2)
  end
end
