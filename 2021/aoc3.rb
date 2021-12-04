inp = File.read('./aoc3_in.txt').split
#inp =  ["00100", "11110", "10110", "10111", "10101", "01111", "00111", "11100", "10000", "11001", "00010", "01010"]

f = inp.map(&:chars).transpose.map(&:tally).map { |r| r.max_by(&:last) }.map(&:first).join
gamma = f.to_i(2)
epsilion = f.chars.map { |c| c == '1' ? '0' : '1' }.join.to_i(2)

puts gamma * epsilion

# second

f = inp.map(&:chars)

inp.first.length.times do |i|
  freq = f.transpose[i].tally
  bit = if freq.values.uniq.size == 1
          '1'
        else
          freq.max_by(&:last).first
        end

  f.select! { |r| r[i] == bit }
  break if f.size == 1
end


g = inp.map(&:chars)

inp.first.length.times do |i|
  freq = g.transpose[i].tally
  bit = if freq.values.uniq.size == 1
          '0'
        else
          freq.min_by(&:last).first
        end
  g.select! { |r| r[i] == bit }
  break if g.size == 1
end

puts f[0].join.to_i(2) * g[0].join.to_i(2)
