class Advent10

  Brackets = {'(' => ')', '[' => ']', '{' => '}', '<' => '>'}
  R_Brackets = Brackets.invert
  Scores = {')' => 3, ']' => 57, '}' => 1197, '>' => 25137, '(' => 1, '[' => 2, '{'=> 3, '<' => 4}

  def initialize(input)
    @lines = input.each_line(chomp: true)
  end

  def part1
    @lines.inject(0){|score, line| score += Scores[check_line(line)].to_i}
  end

  def part2
    scores = []
    @lines.each do |line|
      stack = check_line(line)
      if stack.is_a? Hash
        score = 0
        loop do
          stack.delete_if{|k, v| v.empty?}
          break if stack.empty?
          st = stack.max{|a, b| a[1].last <=> b[1].last}
          score = 5*score + Scores[st[0]]
          st[1].pop
        end
        scores << score
      end
    end
    scores.sort[scores.size/2]
  end

  private
  def check_line(line)
    stack = Brackets.keys.map{|k| [k, []]}.to_h
    line.chars.each_with_index do |ch, pos|
      stack[ch] << pos if Brackets.has_key? ch
      if R_Brackets.has_key? ch
        op_pos = stack[R_Brackets[ch]].last
        return ch if op_pos.nil? or stack.values.any?{|v| v.any?{|pos| pos > op_pos}}
        stack[R_Brackets[ch]].pop
      end  
    end
    stack
  end

end
