#!/usr/bin/ruby
require_relative 'advent8'
require 'test/unit'
class TestAdvent8 < Test::Unit::TestCase
TestData = <<EOF
be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
EOF

TestData2 = <<EOF
acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf
EOF

  def setup
    @test1_1  = [TestData, 26]
    @test2_1  = [TestData2, 5353]
    @test2_2  = [TestData, 61229]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent8.new(@test1_1[0]).part1)
  end

  def test_part2
      assert_equal(@test2_1[1], Advent8.new(@test2_1[0]).part2)
      assert_equal(@test2_2[1], Advent8.new(@test2_2[0]).part2)
  end
end
