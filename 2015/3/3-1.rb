#!/usr/bin/env ruby

# Advent of Code 2015 day 3 part 1 solution in Ruby
# http://adventofcode.com/2015/day/3
# Lloyd Dilley

NORTH = '^'             # instruction to go up
EAST = '>'              # instruction to go right
SOUTH = 'v'             # instruction to go down
WEST = '<'              # instruction to go left
FILE_NAME = "3.dat"     # data file name

# Add a gift to an existing home. If the home does not exist at the coordinates,
# then add a new home along with a gift.
def add_gift(homes, x, y)
  match_found = false
  homes.each do |house|
    if house[:x] == x && house[:y] == y
      match_found = true
      house[:gift_count] += 1
      break
    end
  end
  homes << House.new(x, y, 1) unless match_found
end

begin
  x = 0
  y = 0
  House = Struct.new("House", :x, :y, :gift_count)
  house = House.new(0, 0, 1)
  homes = []
  homes << house
  File.open(FILE_NAME).each_char do |direction|
    x += 1 if direction == NORTH
    y += 1 if direction == EAST
    x -= 1 if direction == SOUTH
    y -= 1 if direction == WEST
    add_gift(homes, x, y)
    puts("Current coordinates: #{x}, #{y}")
    puts("Homes visited: #{homes.size}")
  end
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
