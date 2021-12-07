class Advent7

  def initialize(input)
    @positions = input.split(',').map(&:to_i)
  end

  def part1
    (@positions.min..@positions.max).map{|move| @positions.inject(0){|fuel, pos| fuel += (move - pos).abs}}.min
  end  

  def part2
    (@positions.min..@positions.max).map{|move| @positions.inject(0){|fuel, pos| fuel += ((move - pos).abs*((move - pos).abs + 1))/2}}.min
  end

end
