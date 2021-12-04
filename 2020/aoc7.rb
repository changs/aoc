require 'pry'

class Graph
  attr_accessor :nodes
  def initialize
    @nodes = []
  end

  def add(name, value, parent)
    if parent
      parent = nodes.select { |n| n.name == parent }.first
    end
    # binding.pry if name == "drab fuchsia"
    if n = nodes.select { |n| n.name == name }.first
      n.parents << parent if parent
    else
      node = Node.new(name, value.to_i, parent)
      nodes << node
    end
    node
  end
end

class Node
  attr_accessor :parents, :name, :value
  def initialize(name, value, parent)
    @name = name
    @value = value
    if parent
      @parents = [parent]
    else
      @parents = []
    end
  end
end

rules_raw = File.read('aoc7_in.txt').split("\n")
graph = Graph.new
rules = {}
rules_raw.each do |rule|
  main, *contain = rule.chop.split(" contain ")
  main = main.split(" bag").first
  graph.add(main, 1, false)
  rules[main] = []
  contain = contain.first.split(", ")
  contain.each do |bag|
    match = /^(?<number>\d) (?<name>[a-z ]*) bags?/.match(bag)
    if match
      graph.add(match[:name], match[:number], main)
      rules[main] << {name: match[:name], value: match[:number].to_i}
    else
      
    end
  end
end

$names = []
def traverse(graph, space = "")
  # puts "#{space}#{graph.name}: #{graph.value}"
  # graph.parents.each { |x| puts "#{x.name}: #{x.value}" }
  $names << graph.name
  graph.parents.each do |g|
    traverse(g, space += " ")
  end
end

g = graph.nodes.select { |n| n.name == "shiny gold" }.first  
traverse(g)
puts $names.uniq.count
$rules = rules

stack = []

def t(node, space = " ")
  puts "#{space}."
  if node.count == 1 && $rules[node.first[:name]] == []
    puts node.first[:value]
    return
  end
  node.each do |n|
    t($rules[n[:name]], space + " ")
  end
end
t(rules['shiny gold'])
puts "Wynik:"


#get contains

