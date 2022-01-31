#!/usr/bin/env ruby

# Advent of Code 2015 day 2 solution in Ruby
# http://adventofcode.com/2015/day/2
# Lloyd Dilley

DELIMITER = "x"     # delimiter from data file
FILE_NAME = "2.dat" # data file name

# Calculate surface area of gift
def gift_area(length, width, height)
  return 2 * length * width + 2 * width * height + 2 * height * length
end

# Determine how much additional wrap is required
def calculate_padding(length, width, height)
  area1 = length * width
  area2 = height * width
  area3 = height * length
  padding = 0

  if area1 <= area2 && area1 <= area3
    padding = area1
  elsif area2 <= area1 && area2 <= area3
    padding = area2
  else
    padding = area3
  end

  return padding
end

# Determine ribbon requirements
def calculate_ribbon(length, width, height)
  ribbon_amount = 0

  if length <= width && length <= height
    if(width <= height)
      ribbon_amount = length * 2 + width * 2
    else
      ribbon_amount = length * 2 + height * 2
    end
  elsif width <= length && width <= height
    if(length <= height)
      ribbon_amount = width * 2 + length * 2
    else
      ribbon_amount = width * 2 + height * 2
    end
  else # height is least
    if(length <= width)
      ribbon_amount = height * 2 + length * 2
    else
      ribbon_amount = height * 2 + width * 2
    end
  end

  return ribbon_amount + length * width * height
end

begin
  data_file = File.open(FILE_NAME, 'r') # data file
  wrap_total = 0                        # total amount in square feet of wrapping paper required
  ribbon_total = 0                      # total amount in feet of ribbon required

  data_file.readlines.each do |line|
    dimensions = line.split(DELIMITER)
    #puts("Dimensions: #{dimensions[0]} x #{dimensions[1]} x #{dimensions[2]}")
    wrap_total += gift_area(dimensions[0].to_i, dimensions[1].to_i, dimensions[2].to_i)
    wrap_total += calculate_padding(dimensions[0].to_i, dimensions[1].to_i, dimensions[2].to_i)
    ribbon_total += calculate_ribbon(dimensions[0].to_i, dimensions[1].to_i, dimensions[2].to_i)
  end

  data_file.close
  puts("Total wrapping paper required: #{wrap_total} sq. ft.")
  puts("Total ribbon required: #{ribbon_total} ft.")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
