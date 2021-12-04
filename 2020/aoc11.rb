require 'pry'

layout = File.read("aoc11_in_s.txt").split("\n").map { |row| row.chars }

last = layout.clone

layout.each_with_index do |row, y|
  row.each_with_index do |value, x|
    if value == 'L'
      
    binding.pry
  end
end
