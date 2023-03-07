require_relative "generation"
require_relative "parsing"


# 1. read input file from ./input.txt
# 2. show the matrix loaded
# 3. go to the next generation

fileName = "./input.txt"
generation = parseFile(fileName)

input = ""
menu = "n) next generation
q) quit"
while input != "q"
  puts "#{generation}"
  puts menu
  input = gets.chomp

  if input == "n"
    generation.next
  end

end
