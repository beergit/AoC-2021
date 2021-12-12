class Advent11

  def initialize(input)
    @dumbomap = input.each_line(chomp: true).map.with_index{|line, y| line.chars.map.with_index{|ch, x| [[y, x], ch.to_i]}}.map(&:to_h).inject({}){|m, h| m.merge!(h)}
  end

  def part1
    flash_cnt = 0
    100.times do
      flash_cnt += increase
    end
    flash_cnt
  end

  def part2
    loop_cnt = 0
    until @dumbomap.values.all?{|v| v == 0}
      loop_cnt += 1
      increase
    end
    loop_cnt

  end

  private
  def neighbors(pos)
    (-1..1).to_a.product((-1..1).to_a).map{|p| [pos[0] + p[0], pos[1] + p[1]]}.reject{|p| p == pos or @dumbomap[p].nil?}
  end

  def increase
    flash_cnt = 0
    @dumbomap.keys.each{|k| @dumbomap[k] += 1}
    loop do
      flash = @dumbomap.select{|k, v| v > 9}
      break if flash.empty?
      flash_cnt += flash.size
      flash.keys.each do |k|
        neighbors(k).each{|n| @dumbomap[n] += (@dumbomap[n] == 0 ? 0 : 1)}
        @dumbomap[k] = 0
      end
    end
    flash_cnt
  end

end
