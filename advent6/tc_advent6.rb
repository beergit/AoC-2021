#!/usr/bin/ruby
require_relative 'advent6'
require 'test/unit'
class TestAdvent6 < Test::Unit::TestCase
TestData = <<EOF
3,4,3,1,2
EOF

  def setup
    @test1_1  = [TestData, 5934]
    @test2_1  = [TestData, 26984457539]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent6.new(@test1_1[0]).part1)
  end

  def test_part2
   assert_equal(@test2_1[1], Advent6.new(@test2_1[0]).part2)
  end
end
