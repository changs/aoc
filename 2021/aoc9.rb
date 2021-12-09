require 'pry'

inp = File.read('./aoc9_in.txt')
inp = inp.split.map(&:chars).map { |a| a.map(&:to_i) }

basin_low = []

r = inp.map.with_index do |h_row, y|
  h_row.map.with_index do |h, x|
    next unless h < (inp[y] && x - 1 >= 0 && inp[y][x - 1] || 10)
    next unless h < (inp[y] && inp[y][x + 1] || 10)
    next unless h < (inp[y - 1] && y - 1 >= 0 && inp[y - 1][x] || 10)
    next unless h < (inp[y + 1] && inp[y + 1][x] || 10)

    basin_low.push [y, x]
    h
  end.reject(&:nil?)
end
risks = r.reject(&:nil?).flatten
puts risks.sum + risks.size

@inp = inp

def neighbours(pos)
  y, x = pos
  n = []
  v = @inp[y][x]
  n.push([y, x + 1]) if (x + 1) < @inp[y].size && @inp[y][x + 1] != 9 && @inp[y][x + 1] > v
  n.push([y + 1, x]) if (y + 1) < @inp.size && @inp[y + 1][x] != 9 && @inp[y + 1][x] > v
  n.push([y - 1, x]) if (y - 1) >= 0 && @inp[y - 1][x] != 9 && @inp[y - 1][x] > v
  n.push([y, x - 1]) if (x - 1) >= 0 && @inp[y][x - 1] != 9 && @inp[y][x - 1] > v
  n
end

a = basin_low.map do |b|
  n = [b]
  n.each do |x|
    n.concat(neighbours(x))
  end
  n
end
puts a.map { |b| b.uniq.size }.max(3).inject(1, :*)
