#!/usr/bin/ruby
require_relative 'advent2'
require 'test/unit'
class TestAdvent2 < Test::Unit::TestCase
 
TestData = <<EOF
forward 5
down 5
forward 8
up 3
down 8
forward 2
EOF

  def setup
    @test1_1  = [TestData, 150]
    @test2_1  = [TestData, 900]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent2.new(@test1_1[0]).part1)
  end

def test_part2
    assert_equal(@test2_1[1], Advent2.new(@test2_1[0]).part2)
  end
end
