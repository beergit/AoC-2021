class Advent1
  def initialize(input)
    @depths = input.each_line.map(&:to_i)
  end
  def part1
    1.upto(@depths.size - 1).count{|d| @depths[d] > @depths[d - 1]}
  end
  def part2
    1.upto(@depths.size - 3).count{|d| @depths[d + 2] > @depths[d - 1]}
  end
end
