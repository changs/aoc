require 'pry'

inp =  File.read('./aoc11_in.txt').split.map { |l| l.chars.map(&:to_i) }

def step(inp)
  inp.each_with_index do |row, y|
    row.each_with_index do |_, x|
      inp[y][x] += 1
    end
  end

  to_zero = []
  while true
    flash = inp.map { |r| r.map { |o| o > 9 }}.flatten.select(&:itself)
    break unless flash.size > 0
    inp.each_with_index do |row, y|
      row.each_with_index do |oct, x|
        next unless oct > 9

        if y - 1 >= 0
          inp[y - 1][x] += 1
          inp[y - 1][x - 1] += 1 if x - 1 >= 0
          inp[y - 1][x + 1] += 1 if x + 1 <= row.size - 1
        end

        to_zero << [y, x]
        inp[y][x - 1] += 1 if x - 1 >= 0
        inp[y][x + 1] += 1 if x + 1 <= row.size - 1

        if y + 1 <= inp.size - 1
          inp[y + 1][x] += 1
          inp[y + 1][x - 1] += 1 if x - 1 >= 0
          inp[y + 1][x + 1] += 1 if x + 1 <= row.size - 1
        end
      end
    end
    to_zero.each do |(y, x)|
      inp[y][x] = 0
    end
  end
end
flashes = 0
1000.times do |i|
  step(inp)
  flashes += inp.flatten.select { |x| x == 0 }.size
  if inp.flatten.select { |x| x == 0 }.size == inp.flatten.size
    puts i + 1
    return
  end
end
puts flashes

