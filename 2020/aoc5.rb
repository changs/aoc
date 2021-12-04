require 'pry'

def row(directions)
  r = (0..127)
  partition(directions, r)
end

def column(directions)
  r = (0..7)
  partition(directions, r)
end

def partition(directions, r)
  directions.each do |d|
    case d
    when 'F', 'L'
      r = (r.min..(r.max - r.size/2))
    when 'B', 'R'
      r = ((r.min + r.size/2)..r.max)
    end
  end
  r.first
end

def seat_id(directions)
  r = row(directions.chars[0..6])
  c = column(directions.chars[7..9])
  r * 8 + c
end

# directions = "BFFFBBFRRR"
# puts seat_id(directions)

# directions = "FFFBBBFRRR"
# puts seat_id(directions)

# directions = "BBFFBBFRLL"
# puts seat_id(directions)

seat_ids = []
File.read('aoc5_in.txt').split("\n") do |directions|
  seat_ids.push(seat_id(directions))
end
puts seat_ids.max

seat_h = Hash.new([])
File.read('aoc5_in.txt').split("\n") do |directions|
  seat_h[row(directions.chars[0..6]).to_s] << column(directions.chars[7..9])
end
seat_ids.sort.each_cons(2) { |i1, i2| puts i2 if (i2 - i1) > 1 }

