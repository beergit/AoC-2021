#!/usr/bin/ruby
require_relative 'advent7'
require 'test/unit'
class TestAdvent7 < Test::Unit::TestCase
TestData = <<EOF
16,1,2,0,4,2,7,1,2,14
EOF

  def setup
    @test1_1  = [TestData, 37]
    @test2_1  = [TestData, 168]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent7.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent7.new(@test2_1[0]).part2)
  end
end
