x_range = (20..30)
y_range = (-10..-5)

x_values = []
300.times do |xv|
  (xv + 1).times do |t|
    val = t*xv - (t*(t - 1))/2
    x_values << [t, xv, val] if x_range.include? val 
  end
end

y_values = []
300.times do |yv|
  t = 0 
  loop do
    val = t*yv - (t*(t - 1))/2
    break if val < y_range.first
    y_values << [t, yv, val] if y_range.include? val 
    t = t + 1
  end
end

puts 
