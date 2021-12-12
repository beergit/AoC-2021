#!/usr/bin/ruby
require_relative 'advent10'
require 'test/unit'
class TestAdvent10 < Test::Unit::TestCase

TestData = <<EOF
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
EOF

  def setup
    @test1_1  = [TestData, 26397]
    @test2_1  = [TestData, 288957]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent10.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent10.new(@test2_1[0]).part2)
  end
end
