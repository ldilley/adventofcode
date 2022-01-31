#!/usr/bin/env ruby

# Advent of Code 2015 day 3 part 2 solution in Ruby
# http://adventofcode.com/2015/day/3
# Lloyd Dilley

NORTH = '^'                  # instruction to go up
EAST = '>'                   # instruction to go right
SOUTH = 'v'                  # instruction to go down
WEST = '<'                   # instruction to go left
FILE_NAME = "3.dat"          # data file name

begin
  x = 0                      # generic 'x' coordinate
  y = 0                      # generic 'y' coordinate
  rx = x                     # robot 'x' coordinate
  ry = y                     # robot 'y' coordinate
  sx = x                     # Santa 'x' coordinate
  sy = y                     # Santa 'y' coordinate
  counter = 0                # counter to determine whether it is Santa's or Robo-Santa's turn
  homes = []                 # array of visited home coordinates
  homes << Array.new([x, y]) # add starting coordinates

  File.open(FILE_NAME).each_char do |direction|
    if counter % 2 == 0      # Santa's turn if even
      x = sx
      y = sy
    else                     # Robo-Santa's turn if odd
      x = rx
      y = ry
    end
    x += 1 if direction == NORTH
    y += 1 if direction == EAST
    x -= 1 if direction == SOUTH
    y -= 1 if direction == WEST
    homes << Array.new([x, y])
    # Save coordinates
    if counter % 2 == 0
      sx = x
      sy = y
    else
      rx = x
      ry = y
    end
    counter += 1
  end
  homes.uniq!                # remove duplicate coordinate pairs
  puts("Unique houses visited: #{homes.size}")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
