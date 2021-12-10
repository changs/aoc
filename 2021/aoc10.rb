require 'pry'

inp = File.read('./aoc10_in.txt').split

start = ['[', '{', '(', '<']
stop = [']', '}', ')', '>']
stack = []
pts = { ')' => 3, ']' => 57, '}' => 1197, '>' => 25137 }
sum = 0
to_remove = []
inp.each_with_index do |line, i|
  line.chars do |c|
    if start.include? c
      stack << c
    else
      if stack.last == start[stop.rindex(c)]
        stack.pop
      else
        puts c
        to_remove << i
        sum += pts[c]
        break
      end
    end
  end
end
puts sum

incomplete  = inp.reject.with_index { |e, i| to_remove.include? i }

pts2 = { ')' => 1, ']' => 2, '}' => 3, '>' => 4 }

sums = []
incomplete.each_with_index do |line, i|
  stack = []
  line.chars do |c|
    if start.include? c
      stack << c
    else
      stack.pop
    end
  end
  autocomplete = stack.reverse.map { |p| stop[start.rindex(p)] }
  sum = 0
  autocomplete.each do |c|
    sum *= 5
    sum += pts2[c]
  end
  sums << sum
end

puts sums.sort[((sums.size-1) / 2)]
