class Advent2
  def initialize(input)
    @moves = input.each_line.map(&:split).map{|m| [m[0].to_sym, m[1].to_i]}
  end

  def part1
    @moves.select{|m| m[0] == :forward}.map{|m| m[1]}.inject(:+)*
    (@moves.select{|m| m[0] == :down}.map{|m| m[1]}.inject(:+) -
    @moves.select{|m| m[0] == :up}.map{|m| m[1]}.inject(:+))
  end
  
  def part2
    aim = position = depth = 0
    @moves.each do |m|
      case m[0]
        when :forward
          position += m[1].to_i
          depth += m[1]*aim
        when :down
          aim += m[1]
        when :up
          aim -= m[1]
      end
    end
    position*depth
  end
end
