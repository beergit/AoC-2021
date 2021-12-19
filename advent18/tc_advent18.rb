#!/usr/bin/ruby
require_relative 'advent18'
require 'test/unit'
class TestAdvent18 < Test::Unit::TestCase

TestData = <<EOF
[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
[[[5,[2,8]],4],[5,[[9,9],0]]]
[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
[[[[5,4],[7,7]],8],[[8,3],8]]
[[9,3],[[9,9],[6,[4,9]]]]
[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
EOF

  def setup
    @test1_1  = [TestData, 4140]
    @test2_1  = [TestData, 3993]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent18.new(@test1_1[0]).part1)
  end
  def test_part2
    assert_equal(@test2_1[1], Advent18.new(@test2_1[0]).part2)
  end
end
