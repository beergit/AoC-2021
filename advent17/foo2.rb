
X_range = (240..292)
Y_range = (-90..-57)
def calculate(xv, yv)
  y_max = 0
  pos = [0, 0]
    loop do
      return y_max if X_range.include?(pos[0]) and Y_range.include?(pos[1])
      pos = [pos[0] + xv, pos[1] + yv]
      xv -= 1 unless xv == 0
      yv -= 1
      y_max = pos[1] if pos[1] > y_max
      return nil if( xv == 0 and pos[0] < X_range.first or pos[0] > X_range.last or pos[1] < Y_range.first) 
  end  
end

values = []
1000.times do |xv|
1000.times do |yv|
v = calculate(xv, yv)
values << [xv, yv, v] if v 
end
end
puts values.max{|v1, v2| v1[2] <=> v2[2]}[2]
