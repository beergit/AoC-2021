#!/usr/bin/ruby
require_relative 'advent16'
require 'test/unit'
class TestAdvent16 < Test::Unit::TestCase

TestData1 = %w(8A004A801A8002F478 620080001611562C8802118E34 C0015000016115A2E0802F182340 A0016C880162017C3686B18A3D4780)

TestData2 = %w(C200B40A82 04005AC33890 880086C3E88112 CE00C43D881120 D8005AC2A8F0 F600BC2D8F 9C005AC2F8F0 9C0141080250320F1802104A08)

  def setup
    @test1_1  = [TestData1[0], 16]
    @test1_2  = [TestData1[1], 12]
    @test1_3  = [TestData1[2], 23]
    @test1_4  = [TestData1[3], 31]

    @test2_1  = [TestData2[0], 3]
    @test2_2  = [TestData2[1], 54]
    @test2_3  = [TestData2[2], 7]
    @test2_4  = [TestData2[3], 9]
    @test2_5  = [TestData2[4], 1]
    @test2_6  = [TestData2[5], 0]
    @test2_7  = [TestData2[6], 0]
    @test2_8  = [TestData2[7], 1]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent16.new(@test1_1[0]).part1)
    assert_equal(@test1_2[1], Advent16.new(@test1_2[0]).part1)
    assert_equal(@test1_3[1], Advent16.new(@test1_3[0]).part1)
    assert_equal(@test1_4[1], Advent16.new(@test1_4[0]).part1)
  end
  def test_part2
    assert_equal(@test2_1[1], Advent16.new(@test2_1[0]).part2)
    assert_equal(@test2_2[1], Advent16.new(@test2_2[0]).part2)
    assert_equal(@test2_3[1], Advent16.new(@test2_3[0]).part2)
    assert_equal(@test2_4[1], Advent16.new(@test2_4[0]).part2)
    assert_equal(@test2_5[1], Advent16.new(@test2_5[0]).part2)
    assert_equal(@test2_6[1], Advent16.new(@test2_6[0]).part2)
    assert_equal(@test2_7[1], Advent16.new(@test2_7[0]).part2)
    assert_equal(@test2_8[1], Advent16.new(@test2_8[0]).part2)
  end
end
