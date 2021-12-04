require 'pry'

def valid_byr?(arg)
  (1920..2002).include? arg.to_i
end
def valid_iyr?(arg)
  (2010..2020).include? arg.to_i
end
def valid_eyr?(arg)
  (2020..2030).include? arg.to_i
end
def valid_hgt?(arg)
  height, unit = arg.scan(/(\d+)([A-Za-z]*)/).flatten
  case unit
  when 'cm'
    (150..193).include? height.to_i
  when 'in'
    (59..76).include? height.to_i
  else
    false
  end
end
def valid_hcl?(arg)
  !!(/^#[0-9a-f]{6}$/ =~ arg)
end
def valid_ecl?(arg)
  %w[amb blu brn gry grn hzl oth].include?(arg)
end
def valid_pid?(arg)
  !!(/^[0-9]{9}$/ =~ arg)
end
def valid_cid(arg)
  true
end
def expected_fields
  %i{byr iyr eyr hgt hcl ecl pid}
end
def valid?(tuples)
  not(expected_fields.map { |field| send("valid_#{field}?", tuples[field]) }.include?(false))
end

valid_nr = 0

passports = File.read('aoc4_in.txt').split("\n\n")
passports.each do |pass|
  h = pass.split("\n").map { |p| p.split(" ") }.flatten
  tuples_array = h.map { |tuple| tuple.split(":") }
  tuples = {}
  tuples_array.each { |i| tuples[i[0].to_sym] = i[1] }
  if(!expected_fields.map { |field| tuples.key? field }.include?(false))
    valid_nr += 1 if valid?(tuples)
  end
end
puts valid_nr
