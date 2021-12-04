require 'pry'

class CPU
  attr_accessor :a, :ip, :program, :history
  def initialize(program)
    @program = program
    @a = 0
    @ip = 0
    @history = []
  end

  def run
    while(!@history.include?(@ip)) do
      if @ip == @program.count
        puts "D #{@a}"
        return "D: #{@a}"
      end
      @history.push(@ip)
      ins = parse(program[@ip])
      case ins[:op]
      when 'acc'
        acc(ins[:arg])
      when 'jmp'
        jmp(ins[:arg])
      when 'nop'
        @ip += 1
      end
    end
    @a
  end

  private

  def parse(ins)
    match = /(?<op>[a-z]+) (?<sign>[\+\-])(?<arg>[0-9]+)/.match(ins)
    # if match == nil
    #   binding.pry
    # end
    { op: match[:op], arg: (match[:sign] + match[:arg]).to_i }
  end

  def acc(arg)
    @a += arg
    @ip += 1
  end

  def jmp(arg)
    @ip += arg
  end
end

program = File.read('aoc8_in.txt').split("\n")
puts CPU.new(program).run

# try nop
nops = program.select{ |x| x.split(" ").first == "nop" }.count
previous_nop = 0
nops.times do
  ind = program[previous_nop..-1].find_index { |x| x.split(" ").first == "nop" } + previous_nop
  program[ind].sub!("nop", "jmp")
  CPU.new(program).run
  program[ind].sub!("jmp", "nop")
  previous_nop = ind+1
end

#try jmp

jmps = program.select{ |x| x.split(" ").first == "jmp" }.count
previous_jmp = 0
jmps.times do
  ind = program[previous_jmp..-1].find_index { |x| x.split(" ").first == "jmp" } + previous_jmp
  program[ind].sub!("jmp", "nop")
  CPU.new(program).run
  program[ind].sub!("nop", "jmp")
  previous_jmp = ind+1
end
