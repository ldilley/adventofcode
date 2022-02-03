#!/usr/bin/env ruby

# Advent of Code 2015 day 6 part 1 solution in Ruby
# http://adventofcode.com/2015/day/6
# Lloyd Dilley

TURN_OFF = 0        # instruction to turn off light
TURN_ON = 1         # instruction to turn on light
TOGGLE = 2          # instruction to toggle light
FILE_NAME = "6.dat" # data file name

# Turns off/on groups of lights
def set_lights(light_grid, instruction, start_x, start_y, end_x, end_y)
  x = start_x
  y = start_y
  case instruction
    when TURN_OFF
      while x <= end_x
        while y <= end_y
          light_grid[x][y] = 0
          y += 1
        end
        x += 1
        y = start_y
      end
    when TURN_ON
      while x <= end_x
        while y <= end_y
          light_grid[x][y] = 1
          y += 1
        end
        x += 1
        y = start_y
      end
    when TOGGLE
      while x <= end_x
        while y <= end_y
          if light_grid[x][y] == 0
            light_grid[x][y] = 1
          else
            light_grid[x][y] = 0
          end
          y += 1
        end
        x += 1
        y = start_y
      end
    else
      puts("Invalid instruction: #{instruction}")
  end
end

# Returns the amount of lights in the grid that are on
def total_on(light_grid)
  on_count = 0
  light_grid.each do |column|
    column.each do |row|
      on_count += 1 if row == 1
    end
  end
  return on_count
end

begin
  light_grid = Array.new(1000) {Array.new(1000, 0)}
  File.open(FILE_NAME).each do |line|
    data = line.split
    instruction = TOGGLE if data[0] == "toggle"
    instruction = TURN_OFF if data[1] == "off"
    instruction = TURN_ON if data[1] == "on"
    if instruction == TOGGLE
      start_x = data[1].split(',')[0].to_i
      start_y = data[1].split(',')[1].to_i
      end_x = data[3].split(',')[0].to_i
      end_y = data[3].split(',')[1].to_i
    else
      start_x = data[2].split(',')[0].to_i
      start_y = data[2].split(',')[1].to_i
      end_x = data[4].split(',')[0].to_i
      end_y = data[4].split(',')[1].to_i
    end
    #puts("#{instruction} #{start_x},#{start_y} #{end_x},#{end_y}")
    set_lights(light_grid, instruction, start_x, start_y, end_x, end_y)
  end
  puts("Total lights on: #{total_on(light_grid)}")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end