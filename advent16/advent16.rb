class Advent16

  def initialize(input)
    hexmap = (0..15).map{|n| [n.to_s(16).upcase, "%04d" % [n.to_s(2)]]}.to_h
    @transmission = input.chomp.chars.map{|ch| hexmap[ch]}.join.chars
  end

  def part1
    decode[:packet].version_sum
  end

  def part2
    decode[:packet].value
  end

private
  def decode
    sz = @transmission.size
    version = @transmission.shift(3).join.to_i(2)
    type_id = @transmission.shift(3).join.to_i(2)
    packet = Packet.new(version: version, type: type_id)
    if(type_id == 4)
      literal = []      
      literal << @transmission.shift(5) while literal.empty? or literal.last.first != '0'
      literal.each(&:shift)
      packet.literal = literal.join.to_i(2)
    else
      if(@transmission.shift == '0')
        length = @transmission.shift(15).join.to_i(2)
        while length > 0
          sub = decode
          packet.sub_packets << sub[:packet]
          length -= sub[:size]
        end  
      else
        num = @transmission.shift(11).join.to_i(2)
        num.times do
          sub = decode
          packet.sub_packets << sub[:packet]
        end
      end
    end
    return {:packet => packet, :size => sz - @transmission.size}  
  end

  class Packet
    attr_reader :value, :sub_packets 
    attr_accessor :literal
    def initialize(version: nil, type: nil)
      @version = version
      @type = type
      @sub_packets = []
      @literal = nil
    end

     def version_sum
       @version + @sub_packets.inject(0){|v, sp| v += sp.version_sum}
     end         

    def value
      case @type
        when 0
          @sub_packets.inject(0){|s, sp| s += sp.value}
        when 1
          @sub_packets.inject(1){|p, sp| p *= sp.value}
        when 2
          @sub_packets.min{|p1, p2| p1.value <=> p2.value}.value
        when 3
          @sub_packets.max{|p1, p2| p1.value <=> p2.value}.value
        when 4
          @literal
        when 5
          @sub_packets[0].value > @sub_packets[1].value ? 1 : 0
        when 6
          @sub_packets[0].value < @sub_packets[1].value ? 1 : 0
        when 7
          @sub_packets[0].value == @sub_packets[1].value ? 1 : 0
      end
    end
  end
end
