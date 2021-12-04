require 'pry'

passwords = File.read('aoc2_in.txt').split("\n")

def valid?(line)
  rule, letter, password = line.split
  min, max = rule.split('-').map(&:to_i)
  (min..max).include?(password.count(letter.chop))
end

def valid2?(line)
  rule, letter, password = line.split
  pos1, pos2 = rule.split('-').map(&:to_i)
  [password[pos1 - 1], password[pos2 - 1]].count(letter.chop) == 1
end

valid_n1, valid_n2 = [0, 0]
passwords.each do |line|
  valid_n1 += 1 if valid?(line)
  valid_n2 += 1 if valid2?(line)
end

puts valid_n1
puts valid_n2
