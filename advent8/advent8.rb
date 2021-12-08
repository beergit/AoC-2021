Digits = [[0, 1, 2, 4, 5, 6], [2, 5], [0, 2, 3, 4, 6], [0, 2, 3, 5, 6], [1, 2, 3, 5], [0, 1, 3, 5, 6], [0, 1, 3, 4, 5, 6], [0, 2, 5], [0, 1, 2, 3, 4, 5, 6,], [0, 1, 2, 3, 5, 6]]
class Advent8

  def initialize(input)
    @segments = input.each_line.to_a.map{|ln| ln.split('|').map(&:split)}
  end

  def part1
    @segments.inject(0){|sum, seg| sum += seg[1].count{|s| [2, 3, 4, 7].include? s.size}}
  end

  def part2
    seg_sum = 0
    digits = Digits.sort_by(&:size)
    @segments.each do |seg|
      (:a..:g).to_a.permutation.each do |perm|
        begin
          digits.each do |dig|
            dig_perm = dig.map{|d| perm[d]}
            seg_perm = seg[0].select{|s| s.size == dig.size}.map{|f| f.chars.map(&:to_sym)}
            raise if seg_perm.none?{|s| (s - dig_perm).empty?}
          end
        rescue
          next
        end
        seg_sum += seg[1].inject('') do |sum, dig|
          dd = dig.chars.map(&:to_sym).map{|p| perm.index(p)}
          sum += Digits.index{|d| d.size == dd.size and (d - dd).empty?}.to_s
        end.to_i
        break
      end
    end
    seg_sum
  end
end
