#!/usr/bin/ruby
require_relative 'advent25'
require 'test/unit'
class TestAdvent25 < Test::Unit::TestCase

TestData = <<EOF
...>...
.......
......>
v.....>
......>
.......
..vvv..
EOF

  def setup
    @test1_1  = [TestData, 58]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent25.new(@test1_1[0]).part1)
  end

  def test_part2
  end
end
