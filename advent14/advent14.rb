class Advent14

  def initialize(input)
    @insertions = {}
    template = nil
    input.each_line(chomp: true) do |line|
      template = line if line =~ /^\w+$/
      @insertions[$1] = $2 if line =~ /(\w+)\s+->\s+(\w)/
    end
    @polymers = @insertions.values.uniq.map{|ch| [ch, template.count(ch)]}.to_h
    ps = template.chars.each_cons(2).map(&:join)
    @pairs = @insertions.keys.map{|k| [k, ps.count(k)]}.to_h
  end

  def part1
    polymerize(10)
  end

  def part2
    polymerize(40)
  end

  private
  def polymerize(steps)
    act_pairs = @pairs.clone
    steps.times do
      next_pairs = @insertions.keys.map{|k| [k, 0]}.to_h
      act_pairs.keys.each do |ps|
        [ps[0] + @insertions[ps], @insertions[ps] + ps[1]].each{|pair| next_pairs[pair] += act_pairs[ps]}
        @polymers[@insertions[ps]] += act_pairs[ps]
      end
      act_pairs = next_pairs
    end  
    @polymers.values.max - @polymers.values.min
  end
end
