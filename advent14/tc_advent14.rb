#!/usr/bin/ruby
require_relative 'advent14'
require 'test/unit'
class TestAdvent14 < Test::Unit::TestCase

TestData = <<EOF
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
EOF

  def setup
    @test1_1  = [TestData, 1588]
    @test2_1  = [TestData, 2188189693529]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent14.new(@test1_1[0]).part1)
  end
  def test_part2
    assert_equal(@test2_1[1], Advent14.new(@test1_1[0]).part2)
  end
end
