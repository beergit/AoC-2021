
class Cucumber
  attr_reader :type, :row, :col

  def initialize(t, pos)
    @type = t
    (@row, @col) = pos
    @blocked = nil
  end

  def move!
    (@row, @col) = [@row + 1 == $size_right ? 0 : @row + 1, @col] if right?
    (@row, @col) = [@row, @col + 1 == $size_down ? 0 : @col + 1] if down?
    [row, col]
  end

  def block!(blocked)
    @blocked = blocked
  end

  def free?
    !@blocked
  end

  def aspirant
    return [row == 0 ? $size_down - 1 : row - 1, col] if right?
    return [row, col == 0 ? $size_right - 1 : col - 1] if down?
  end

  def right?
    type == :Right
  end
  def down?
    type == :Down
  end

  def to_s
    return right? ? '>' : 'V'
  end
end

class Advent25
  def initialize(input)
    @last_direction  = :Right
    @cucumbers = {:Right => [], :Down =>[]}
    @grid = input.each_line(chomp: true).map(&:chars)
    $size_right = @grid[0].size
    $size_down = @grid.size
    @grid.each_index do |row| 
      @grid[row].each_index do |col| 
      case @grid[row][col].upcase
         when '.'
          @grid[row][col] = nil
         when '>'
          @cucumbers[:Right] <<  Cucumber.new(:Right, [row, col])
          @grid[row][col] = @cucumbers[:Right].last
         when 'V'
          @cucumbers[:Down] <<  Cucumber.new(:Down, [row, col])
          @grid[row][col] = @cucumbers[:Down].last
        else
        end
      end
    end
    @cucumbers[:Right].each{|c| c.block!(!@grid[c.row][(c.col + 1) % $size_right].nil?)}
    @cucumbers[:Down].each{|c| c.block!(!@grid[(c.row + 1) % $size_down][c.col].nil?)}
  end

  def block(c, d, b)
      c.block!(b) if c and ((d == :Right and c.down?) or (d == :Down and c.right?)) 
  end

  def move(direction)
    @cucumbers[direction].select{|c| c.free?}.each do |c|
      last_cucumber = @grid[c.aspirant[0]][c.aspirant[1]]
      block(last_cucumber, direction, false)
      aspirant = c.move!
      next_cucumber = @grid[aspirant[0]][aspirant[1]]
      block(next_cucumber, direction, true)
    end
  end

  def to_s
    str = (('.'*$size_right + "\n")*$size_down).each_line(chomp: true).map(&:chars)
    [:Right, :Down].each{|d| @cucumbers[d].each{|c| str[c.row][c.col] = c.to_s}}
    str.map(&:join).join("\n")
  end

  def part
    puts to_s
    move(:Right)
    puts "\n" + ('-'*20) + "\n"
    puts to_s
  end
end

Testdata1 = <<EOF
...>...
.......
......>
v.....>
......>
.......
..vvv..
EOF

Advent25.new(Testdata1).part
