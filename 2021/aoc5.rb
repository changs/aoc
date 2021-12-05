inp = File.read('./aoc5_in.txt')

x = 0
y = 1

coordinates = inp.split("\n").map { |_| _.split(' -> ') }.map { |_| _.map { |_| _.split(',').map(&:to_i) } }
lines = coordinates.select do |l|
  (l[0][x] == l[1][x] || l[0][y] == l[1][y])
end

coords_to_add = lines.map do |l|
  if l[0][x] == l[1][x]
    ([l[0][y], l[1][y]].min..[l[0][y], l[1][y]].max).map { |y1| [l[0][x], y1] }
  else
    ([l[0][x], l[1][x]].min..[l[0][x], l[1][x]].max).map { |x1| [x1, l[0][y]] }
  end
end

f = Hash.new(0)
coords_to_add.each { |c| c.each { |coord| f[coord] += 1 } }
count = f.select { |_, v| v > 1 }.count
puts count

# second part ... the first part could be done in similar fashion than the second part and it'd much clenar.
# I leave it for the sake of preserving thought process.

lines_diag = coordinates.select do |l|
  (l[0][x] - l[1][x]).abs == (l[0][y] - l[1][y]).abs
end

dcoords_to_add = lines_diag.map do |l|
  s = l[1][x] <=> l[0][x]
  s1 = l[1][y] <=> l[0][y]
  xs = l[0][x].step(to: l[1][x], by: s).to_a
  ys = l[0][y].step(to: l[1][y], by: s1).to_a
  xs.zip(ys)
end

dcoords_to_add.each { |c| c.each { |coord| f[coord] += 1 } }
count = f.select { |_, v| v > 1 }.count
puts count
