require 'pry'

numbers = File.read("aoc9_in.txt").split("\n").map(&:to_i)
n = 0
numbers.each_cons(26) do |arr|
  n = arr.pop
  unless arr.combination(2).to_a.map { |n| n[0] + n[1] }.include? n
    puts n
    break
  end
end

i = 2
while(true) do
  if numbers.each_cons(i).to_a.map { |arr| arr.sum }.include? n
    h = {}
    numbers.each_cons(i).to_a.map { |arr| h[arr.sum] = arr }
    cont = h[n]
    puts cont.min + cont.max
    break
  end
  i += 1
end
