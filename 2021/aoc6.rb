require 'pry'
init = [3,4,3,1,2]

#init = File.read('./aoc6_in.txt').split(',').map(&:to_i)

#naive 
def cycle(init)
  new_fish = []
  init.each_index do |i|
    init[i] -= 1
    if init[i] == -1
      init[i] = 6
      new_fish.push(8)
    end
  end
  init.concat(new_fish)
end

#256.times { |i| p i; p cycle(init).size }
#puts init.size

fish = Hash.new(0)
File.read('./aoc6_in.txt').split(',').map(&:to_i).each { |f| fish[f] += 1 }

def cycleh(fish)
  nf = {}
  nf[0] = fish[1]
  nf[1] = fish[2]
  nf[2] = fish[3]
  nf[3] = fish[4]
  nf[4] = fish[5]
  nf[5] = fish[6]
  nf[6] = fish[7] + fish[0]
  nf[7] = fish[8]
  nf[8] = fish[0]
  nf
end
256.times { fish = cycleh(fish) }
p fish.values.sum

