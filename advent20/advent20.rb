class Advent20

  def initialize(input)
    @image = input.each_line(chomp: true).to_a
    @map = @image.shift
    @image.shift
  end

  def part1
    enhanche! 2
  end

  def part2
    enhanche! 50
  end

private
  def border!(ch)
    @image = [ch*(@image[0].size + 6)]*3 + @image.map{|im| ch*3 + im + ch*3} + [ch*(@image[0].size + 6)]*3
  end

  def translate(x, y)
    @map[@image[y, 3].map{|line| line[x, 3]}.join.tr('.#', '01').to_i(2)] 
  end

  def enhanche!(tms)
    tms.times do |t|
      border!(@map[0] == '#' ? (t%2 == 0 ? '.' : '#') : '.')
      out_image = []
      (@image.size - 2).times do |y|
        line = ''
        (@image[0].size - 2).times{|x| line += translate(x, y)}
        out_image << line
      end
      @image = out_image
    end
    @image.join.count '#'
  end
end
