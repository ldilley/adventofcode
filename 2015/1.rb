#!/usr/bin/env ruby

# Advent of Code 2015 day 1 solution in Ruby
# http://adventofcode.com/2015/day/1
# Lloyd Dilley

UP = '('             # instruction to go up a floor
DOWN = ')'           # instruction to go down a floor
INPUT_FILE = "1.dat" # input data file name

begin
  position = 0       # current floor number
  File.open(INPUT_FILE).each_char do |direction|
    position += 1 if direction == UP
    position -= 1 if direction == DOWN
    puts("Current floor: ##{position}")
  end  
  puts("Arrived at destination floor: ##{position}")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
