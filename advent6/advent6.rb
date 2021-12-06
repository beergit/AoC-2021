class Advent6

  def initialize(input)
    @fish = {}
    input.split(',').map(&:to_i).each{|day| @fish[day] = @fish[day].to_i + 1}
  end

  def part1
    calculate(80)
  end  

  def part2
    calculate(256)
  end

  private
  def calculate(days)
    this_generation = @fish.clone
    days.times do
      next_generation = 9.times.to_a.zip([0]*9).to_h
      this_generation.keys.each do |day|
        case day
          when 0
            next_generation[6] += this_generation[0]
            next_generation[8] = this_generation[0]
          when 7
            next_generation[6] += this_generation[7]
          else
            next_generation[day - 1] = this_generation[day]  
        end
      end
      this_generation = next_generation
    end  
    this_generation.values.sum
  end
end
    
