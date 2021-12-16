require 'fibonacci_heap'

class Advent15

  def initialize(input)
    @nodes = {}
    lines = input.each_line(chomp: true).to_a
    @dim = [lines.size, lines.first.size] 
    ext = (0..4).to_a.product((0..4).to_a).reject{|p| p == [0,0]}
    lines.each_with_index do |line, row|
      line.chars.each_with_index do |ch, col| 
        @nodes[[row, col]] = FibonacciHeap::Node.new(Cell.new([row, col], ch.to_i))
        ext.each do |ex|
          idx = [ex[0]*@dim[0] + row, ex[1]*@dim[1] + col]
          @nodes[idx] =  FibonacciHeap::Node.new(Cell.new(idx, @nodes[[row, col]].key.risk_level + ex[0] + ex[1], extended: true))
        end
      end
    end
    @heap = FibonacciHeap::Heap.new
  end

  def part1
    dijkstra()
    @nodes[[@dim[0] - 1, @dim[1] - 1]].key.total_risk
  end

  def part2
    dijkstra(extended: true)
    @nodes[[5*@dim[0] - 1, 5*@dim[1] - 1]].key.total_risk
  end

  private
  def neighbors(pos, extended)
      nbs = []
      [[-1, 0], [0, -1], [1, 0], [0, 1]].each do |n|
        nb_pos = [pos[0] + n[0], pos[1] + n[1]]
        nbs << @nodes[nb_pos] unless @nodes[nb_pos].nil? or @nodes[nb_pos].key.finished or (not extended and @nodes[nb_pos].key.extended)
      end
    nbs
  end 
  
  def update_node(act_node, new_risk)
    if act_node.key.total_risk.nil?
      act_node.key.total_risk = new_risk
      @heap.insert(act_node)
    end
    if new_risk < act_node.key.total_risk
      act_node.key.total_risk = new_risk
      @heap.decrease_key(act_node)
    end
  end

  def dijkstra(extended = false)
    update_node(@nodes[[0, 0]], 0)
    until @heap.empty?
      act_node = @heap.pop
      act_node.key.finished = true
      neighbors(act_node.key.pos, extended).each do |nb_node|
        new_risk = act_node.key.total_risk + nb_node.key.risk_level
        update_node(nb_node, new_risk)
      end
    end
  end
    
  class Cell
  include Comparable
  attr_reader :pos, :risk_level, :extended
  attr_accessor :total_risk, :finished, :parent
    def initialize(pos, lev, extended = false) 
      @risk_level = (lev >= 10 ? lev%10 + 1 : lev)
      @pos = pos           
      @finished = false
      @total_risk = nil
      @extended = extended
    end
    def <=>(other)
      total_risk <=> other.total_risk
    end           
  end

end
