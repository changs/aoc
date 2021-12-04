cmds = File.read('aoc2_in.txt').split("\n")

position = 0
depth = 0

# first
cmds.each do |cmd|
  opp, arg = cmd.split
  arg = arg.to_i
  case opp
  when 'forward'
    position += arg
  when 'down'
    depth += arg
  when 'up'
    depth -= arg
  end
end

puts position * depth

# second

position = 0
depth = 0
aim = 0

cmds.each do |cmd|
  opp, arg = cmd.split
  arg = arg.to_i
  case opp
  when 'forward'
    position += arg
    depth += aim * arg
  when 'down'
    aim += arg
  when 'up'
    aim -= arg
  end
end

puts position * depth
