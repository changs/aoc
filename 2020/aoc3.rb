require 'pry'

map = File.read('aoc3_in.txt').split("\n")
# right 3, down 1
def traverse(map, right, down)
  bottom = map.count
  x, y, level, trees = 0, 0, 1, 0

  while level < bottom do
    x += right
    y += down
    trees += 1 if map[y][x.remainder(map[0].size)] == "#"
    level += down
  end
  trees
end


mul = traverse(map, 1, 1) *
      traverse(map, 3, 1) *
      traverse(map, 5, 1) *
      traverse(map, 7, 1) *
      traverse(map, 1, 2)
puts mul
