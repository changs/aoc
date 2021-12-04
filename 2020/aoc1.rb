require 'pry'

#binding.pry

def find_two
  numbers = File.read('input_aoc1.txt').split.map(&:to_i)
  numbers.each do |num|
    numbers.each do |num2|
      return(num * num2) if num + num2 == 2020
    end
  end
end

puts find_two

def find_three
  numbers = File.read('input_aoc1.txt').split.map(&:to_i)
  numbers.each do |num|
    numbers.each do |num2|
      numbers.each do |num3|
        return(num * num2 * num3) if num + num2 + num3 == 2020
      end
    end
  end
end

puts find_three

def sol3
  n = File.read('input_aoc1.txt').split.map(&:to_i)
  n = n.product(n,n)
  n[n.map(&:sum).index(2020)].inject(:*)
end
puts find_three
