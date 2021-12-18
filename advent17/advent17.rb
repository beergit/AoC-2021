class Advent17

  PROBE_RANGE = 300
  def initialize(input)
    pm = /target area: x=(-?\d+)\.\.(-?\d+), y=(-?\d+)\.\.(-?\d+)/.match input
    @x_range = (pm[1].to_i..pm[2].to_i)
    @y_range = (pm[3].to_i..pm[4].to_i)
  end

  def part1
    probe.max{|v1, v2| v1[2] <=> v2[2]}[2]
  end

  def part2
    probe.map{|v| [v[0], v[1]]}.uniq.count
  end

private
  def probe
    values = []
    2*PROBE_RANGE.times do |xv|
      (-PROBE_RANGE..PROBE_RANGE).each do |yv|
        v = calculate(xv, yv)
        values << [xv, yv, v] if v 
      end
    end
    values
  end

  def calculate(xv, yv)
    y_max = 0
    pos = [0, 0]
    loop do
      return y_max if @x_range.include?(pos[0]) and @y_range.include?(pos[1])
      pos = [pos[0] + xv, pos[1] + yv]
      xv -= 1 unless xv == 0
      yv -= 1
      y_max = pos[1] if pos[1] > y_max
      return nil if( xv == 0 and pos[0] < @x_range.first or pos[0] > @x_range.last or pos[1] < @y_range.first) 
    end  
  end
end
