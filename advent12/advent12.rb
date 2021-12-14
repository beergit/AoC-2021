class Advent12

  def initialize(input)
    @caves = {}
    input.each_line(chomp: true) do |line|
      cave_names = (line.split '-').map(&:to_sym)
      cave_names.each{|cn| @caves[cn] ||= Cave.new(cn)}
      @caves[cave_names[0]].add_path(cave_names[1])
      @caves[cave_names[1]].add_path(cave_names[0])
      @paths = []
    end
  end

  def part1
  @paths.clear
    walk(:start, [:start])
  end

  def part2
    @paths.clear
    @caves.keys.select{|k| @caves[k].small?}.reject{|k| [:start, :end].include? k}.each do |cv|
      @caves[cv].twice = true 
      walk(:start, [:start])
      @caves[cv].twice = false
    end
    @paths.size 
  end

  private

  def walk(cave_name,  pth)
    if cave_name == :end
      @paths << Array.new(pth) unless @paths.include? pth
    else
      @caves[cave_name].paths.reject{|p| @caves[p].forbidden?}.each do |c_name|
        @caves[c_name].visited += 1
        pth << c_name
        walk(c_name, pth)
        pth.pop
        @caves[c_name].visited -= 1
      end  
    end  
    @paths.size
  end
private     
  class Cave
    attr_accessor :visited, :twice
    attr_reader :paths
    def initialize(n)
      @visited = 0
      @paths = []             
      @small = n.to_s =~ /^[[:lower:]]+$/
      @start = (n == :start)
      @twice = false

    end
    def add_path(cv)
      @paths << cv
    end           
    def forbidden?
      @start or ((@visited == (@twice ? 2 : 1)) and @small)
    end
    def small?
      @small
    end
  end
end
