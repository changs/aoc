require 'pry'

r = 0
File.readlines('./aoc8_in.txt').map do |l|
  input = l.split(' | ').last.chop.split
  r+= input.select { |o| [2,4,3,7].include? o.size }.flatten.size
end
puts r

r = 0

File.readlines('./aoc8_in.txt').map do |l|
  sample, input = l.split(' | ')
  sample = sample.split.sort_by(&:length).map{|x| x.chars }
  input.chop!

  h = {}
  proper = {}

  h[1] = sample.select { |i| i.size == 2 }.flatten
  h[4] = sample.select { |i| i.size == 4 }.flatten
  h[7] = sample.select { |i| i.size == 3 }.flatten
  proper['a'] = h[7] - h[1]

  h[8] = sample.select { |i| i.size == 7 }.flatten

  t = h[4] + proper['a']
  h[9] = sample.select{ |s| s.length == 6 }.select { |a| (a - t).length == 1 }.flatten
  proper['g'] = h[9] - (h[4] + proper['a'])

  sample.select { |s| s.length == 6 }.reject { |s| s == h[9] }.each do |i|
    if (h[1] & i) == h[1]
      h[0] = i
    else
      h[6] = i
    end
  end

  proper['d'] = h[8] - h[0]
  proper['c'] = h[8] - h[6]
  proper['f'] = h[1] - proper['c']
  proper['e'] = h[8] - h[9]
  proper['b'] = h[4] - proper['d'] - h[1]

  h[0] = h[8] - proper['d']
  h[2] = h[8] - proper['b'] - proper['f']
  h[3] = h[8] - proper['b'] - proper['e']
  h[5] = h[6] - proper['e']
  decode = h.each { |k, v| h[k] = v.sort }.invert
  r += input.split.map(&:chars).map(&:sort).map { |i| decode[i] }.join.to_i
end
puts r
