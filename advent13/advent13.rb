class Advent13

  def initialize(input)
    @dots = []
    @folds = []
    input.each_line(chomp: true) do |line|
      @dots << [$1.to_i, $2.to_i] if line =~ /(\d+),(\d+)/
      @folds << [$1.to_sym, $2.to_i] if line =~ /fold along\s+(x|y)=(\d+)/
    end
  end

  def part1
    fold!(@folds.first)
    @dots.size
  end

  def part2
    @folds.each{|f| fold!(f)}
    puts
    puts to_s
    true
  end

  private
  def fold!(f)
    @dots = (@dots.reject{|d| d[1] > f[1]} + @dots.select{|d| d[1] > f[1]}.map{|d| [d[0], 2*f[1] - d[1]]}).uniq if(f[0] == :y)
    @dots = (@dots.reject{|d| d[0] > f[1]} + @dots.select{|d| d[0] > f[1]}.map{|d| [2*f[1] - d[0], d[1]]}).uniq if(f[0] == :x)
  end

  def to_s
    str = []
    @dots.each do |d|
      str[d[1]] ||= []
      str[d[1]][d[0]] = '#'
    end
    str.map{|y| y.map{|x| x ? '#' : ' '}.join}.join("\n")
  end
end
