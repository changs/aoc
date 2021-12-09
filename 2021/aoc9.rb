require 'pry'

inp = File.read('./aoc9.in.txt')
inp = inp.split.map(&:chars).map { |a| a.map(&:to_i) }

r = inp.map.with_index do |h_row, y|
  h_row.map.with_index do |h, x|
    next unless h < (inp[y] && x - 1 >= 0 && inp[y][x - 1] || 10)
    next unless h < (inp[y] && inp[y][x + 1] || 10)
    next unless h < (inp[y - 1] && y - 1 >= 0 && inp[y - 1][x] || 10)
    next unless h < (inp[y + 1] && inp[y + 1][x] || 10)
    h
  end.reject(&:nil?)
end
risks = r.reject(&:nil?).flatten
puts risks.sum + risks.size
