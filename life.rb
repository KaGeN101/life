require_relative 'engine'


# The Life game run time

# Example of a 10x10 seed
seed = "__**_*____|__***_____|_____*____|__________|__________|__________|__________|__________|__________|__________"


puts "Legend:"
puts "_ -> Represents a empty/dead cell"
puts "* -> Represents a living cell"
puts

engine = Engine.new
engine.seed seed
engine.print
0.upto(4) do |e|
  engine.evolve
  puts "Evolution #{e}"
  engine.print
end  