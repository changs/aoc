require 'pry'

answers = File.read('aoc6_in.txt')
groups = answers.split("\n\n")
puts groups.reduce(0) { |sum, group| group.gsub("\n","").chars.uniq.count + sum }

# part 2

a = groups.reduce(0) do |sum, group|
  count = group.gsub("\n","").chars.reduce(Hash.new { |hash, key| hash[key] = 0 }) do |part_sum, c|
    part_sum[c] += 1
    part_sum
  end
  all = count.select { |k,v| v == group.split("\n").count }.count
  sum += all
  sum
end

puts a
