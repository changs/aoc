require 'pry'

adapters = File.read("aoc10_in.txt").split("\n").map(&:to_i).unshift(0).then do |a|
  a.push(a.max + 3).sort!
end
dist = adapters.each_cons(2).map { |n| n[1] - n[0] }
dist.reduce(Hash.new { |h, k| h[k] = 0 }) do |part_sum, c|
  part_sum[c] += 1; part_sum
end.then { |d| puts d[1] * d[3] }

# Part 2
dist.chunk_while(&:==).then do |chunks|
  mul = 1
binding.pry
  chunks.each do |chunk|
    next if chunk.include? 3
    mul *= {1 => 1, 2 => 2, 3 => 4, 4 => 7}[chunk.length]
  end
  puts mul
end
