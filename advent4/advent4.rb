class Advent4
  def initialize(input)
    data = input.split("\n\n")
    draws = data.first.scan(/\d+/).map(&:to_i)
    data.shift
    cards = data.map{|d| Card.new d.each_line(chomp: true).to_a}
    @scores = []
    until cards.empty? or draws.empty? 
      number = draws.shift
      cards.each do |c|
        c.erase! number
        @scores << c.score if c.bingo?
      end
      cards.reject!{|c| c.bingo?}
    end
  end

  def part1
    @scores.first
  end
  
  def part2
    @scores.last
  end 

  private

  class Card
    def initialize(data)
      @card = data.map{|row| row.split.map(&:to_i)}
      @score = nil
    end
    def erase!(number)
      row = @card.index{|r| r.include? number}
      if row
        col = @card[row].index(number) 
        @card[row][col] = nil
        @score = @card.flatten.compact.sum*number if @card.any?{|row| row.compact.empty?} or @card.transpose.any?{|col| col.compact.empty?}
      end
    end
    def bingo?
      not @score.nil?
    end
    def score
      @score
    end
  end  
end
