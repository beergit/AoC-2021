class Advent18

  def initialize(input)
    @snailfish = input.each_line(chomp: true).map{|line| Snailfish.new(line)}
  end

  def part1
    sn = Snailfish.new
    @snailfish.each do |fish|
      sn = sn + fish
      sn.reduce!
    end
    sn.magnitude
  end

  def part2
    @snailfish.product(@snailfish).map{|sn| (sn[0] + sn[1]).reduce!.magnitude}.max
  end

private
  class Snailfish
    attr_accessor :number

    def initialize(n = nil)
      @number = n
    end

    def +(other)
      Snailfish.new(@number ? (other.number ? "[#{number},#{other.number}]" : @number) : (other.number ? other.number : nil)) 
    end

    def reduce!
      loop do
        while(explode!)
        end
        break unless split!
      end           
      self
    end

    def explode!
      cnt = 0
      @number.size.times do |idx|
        cnt += 1 if number[idx] == '['
        cnt -= 1 if number[idx] == ']'
        if(cnt == 5)
          pm = /\[(\d+),(\d+)\]/.match @number[idx..]
          left_str = @number[..idx - 1]
          left_pos = left_str.rindex /[\[\],](\d+)/
          if(left_pos)
            l_num = $1.to_i + pm[1].to_i
            left_str = left_str[..left_pos] + l_num.to_s + left_str[(left_pos + $1.size + 1)..] 
          end  
          right_str = @number[(idx + pm[0].size)..]
          right_pos = right_str.index /(\d+)/
          if(right_pos)
            r_num = $1.to_i + pm[2].to_i
            right_str = right_str[..right_pos - 1] + r_num.to_s + right_str[right_pos + $1.size..] 
          end  
          @number = left_str + '0' + right_str
          break;
        end
      end
      cnt == 5
    end

    def split!
      cnt = 0
      split_pos = @number.index /(\d{2,})/
      if(split_pos)
        num = $1.to_i
        @number = @number[..(split_pos - 1)] + "[#{num/2},#{num/2 + num%2}]" + @number[(split_pos + $1.size)..]
      end
      split_pos != nil
    end

   def magnitude(str = nil)
      str = @number.chars unless str 
      idx = 0
      pair = []
      until str.empty?
        ch = str.shift
        case ch
          when '['
            pair[idx] = magnitude(str)
          when ','
            idx = 1
          when /\d+/
            pair[idx] = ch.to_i  
          when ']'
            return 3*pair[0] + 2*pair[1]
        end
      end
      pair[0]
    end
  end
end
