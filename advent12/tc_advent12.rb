#!/usr/bin/ruby
require_relative 'advent12'
require 'test/unit'
class TestAdvent12 < Test::Unit::TestCase

TestData1 = <<EOF
start-A
start-b
A-c
A-b
b-d
A-end
b-end
EOF

TestData2 = <<EOF
dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc
EOF

TestData3 = <<EOF
fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW
EOF

  def setup
    @test1_1  = [TestData1, 10]
    @test1_2  = [TestData2, 19]
    @test1_3  = [TestData3, 226]
    @test2_1  = [TestData1, 36]
    @test2_2  = [TestData2, 103]
    @test2_3  = [TestData3, 3509]
#@test2_1  = [TestData, 195]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent12.new(@test1_1[0]).part1)
    assert_equal(@test1_2[1], Advent12.new(@test1_2[0]).part1)
    assert_equal(@test1_3[1], Advent12.new(@test1_3[0]).part1)
  end

    def test_part2
    assert_equal(@test2_1[1], Advent12.new(@test2_1[0]).part2)
    assert_equal(@test2_2[1], Advent12.new(@test2_2[0]).part2)
    assert_equal(@test2_3[1], Advent12.new(@test2_3[0]).part2)
  end
end
