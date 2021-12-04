class Advent3
  def initialize(input)
    @codes = input.each_line(chomp: true).to_a
  end

  def part1
    gamma = @codes.first.size.times.map{|cs| @codes.count{|cc| cc[cs] == '1'} > @codes.size/2 ? '1' : '0'}.join.to_i(2)
    epsilon = gamma ^ ('1'*@codes.first.size).to_i(2)
    gamma*epsilon
  end
  
  def part2
    rating(:O2)*rating(:CO2)
  end 
  
  private
  def rating(which)
    cs = Array.new @codes
    idx = 0
    until cs.size == 1
      cnt1 = cs.count{|ch| ch[idx] == '1'}
      cnt0 = cs.size - cnt1
      common = which == :O2 ? cnt1 >= cnt0 ? '1' : '0' : cnt0 <= cnt1 ? '0' : '1'
      cs.select!{|ch| ch[idx] == common}
      idx += 1
    end 
    cs.first.to_i(2)
  end

end
