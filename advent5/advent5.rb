class Advent5

  def initialize(input)
    @lines = input.each_line.map{|line| line.scan(/\d+/).map(&:to_i).each_slice(2).to_a}
  end

  def part1
    calc_points
  end

  def part2
    calc_points(with_diagonal: true)
  end

private 
  def calc_points(with_diagonal: false)
    points = {}
    @lines.each do |line|
      dx = line[1][0] <=> line[0][0]
      dy = line[1][1] <=> line[0][1]
      if(dx*dy == 0 or (with_diagonal and (line[0][0] - line[1][0]).abs == (line[0][1] - line[1][1]).abs))
        pos = line[0]
        loop do 
          points[pos] = points[pos].to_i + 1
          break if pos == line[1]
          pos = [pos[0] + dx, pos[1] + dy]
        end  
      end
    end  
    points.values.count{|v| v > 1}
  end
end
    
