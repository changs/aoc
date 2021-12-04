# first
File.read("./aoc1_in.txt").split.map(&:to_i).each_cons(2).to_a.inject(0) { |s, (x, y)| s += 1 if y > x; s }

# second
File.read("./aoc1_in.txt").split.map(&:to_i).each_cons(3).map { |a| a.sum }.each_cons(2).inject(0) { |s, (x, y)| s += 1 if y > x; s }
