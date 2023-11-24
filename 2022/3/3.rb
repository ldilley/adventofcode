#!/usr/bin/env ruby

# Advent of Code 2022 day 3 solution in Ruby
# http://adventofcode.com/2022/day/3
# Lloyd Dilley

FILE_NAME = "3.dat" # data file name

begin
  priority_sum = 0
  priorities = ['-', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
                'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
                'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
  File.open(FILE_NAME).each_line do |line|
    line = line.chomp
    compart1_contents = line[0 .. line.length / 2 - 1]
    compart2_contents = line[line.length / 2 .. -1]
    compart1_contents.chars.each do |char|
      if compart2_contents.include?(char)
        dupe_item = char
        priority_sum += priorities.index(dupe_item)
        break
      end
    end
  end
  puts("Priority sum: #{priority_sum}")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
