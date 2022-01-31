# Advent of Code 2015 day 1 solution in Julia
# http://adventofcode.com/2015/day/1
# Lloyd Dilley

const UP = '('            # instruction to go up a floor
const DOWN = ')'          # instruction to go down a floor
const FILE_NAME = "1.dat" # data file name

try
  position = 0            # current floor number
  data_file = open(FILE_NAME, "r")
  data = read(data_file, String)
  close(data_file)
  for direction in data
    if direction == UP
      position += 1
    end
    if direction == DOWN
      position -= 1
    end
    println("Current floor: #$position")
  end
  println("Arrived at destination floor: #$position")
catch e
  println("Unable to parse input file: $e")
end