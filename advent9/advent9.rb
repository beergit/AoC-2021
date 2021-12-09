class Advent9

  def initialize(input)
    @heightmap = input.each_line(chomp: true).map.with_index{|line, y| line.chars.map.with_index{|ch, x| [[y, x], ch.to_i]}}.map(&:to_h).inject({}){|m, h| m.merge!(h)}
  end

  def part1
    @heightmap.keys.inject(0){|sx, k| sx += isLowpoint?(k) ? @heightmap[k] + 1 : 0}
  end

  def part2
    @heightmap.keys.select{|k| isLowpoint?(k)}.map{|k| basin([], k)}.sort[-3, 3].inject(:*)
  end

  private
  def basin(bas, pos)
    bas << pos unless bas.include?(pos)
    neighbors(pos).reject{|n| bas.include?(n) or @heightmap[n] == 9}.each{|n| basin(bas, n)}
    bas.size
  end  
    
  def neighbors(pos)
    [[-1, 0], [0, -1], [1, 0], [0, 1]].map{|p| [pos[0] + p[0], pos[1] + p[1]]}.select{|sx| @heightmap.has_key?(sx)}
  end

  def isLowpoint?(pos)
    neighbors(pos).none?{|nb| @heightmap[nb] <= @heightmap[pos]}
  end

end
