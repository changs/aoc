require 'pry'

#inp = [16,1,2,0,4,2,7,1,2,14]
inp = File.read('./aoc7_in.txt').split(',').map(&:to_i)
dist = {}
# naive
(0..inp.max).each do |i|
  dist[i] = inp.map do |pos|
    (pos - i).abs
  end.sum
end

puts dist.values.min
# part 2

(0..inp.max).each do |i|
  dist[i] = inp.map do |pos|
    n = (pos - i).abs
    (n * (n + 1)) / 2
  end.sum
end

puts dist.values.min
