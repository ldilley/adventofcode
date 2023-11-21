#!/usr/bin/env ruby

# Advent of Code 2022 day 1 part 1 solution in Ruby
# http://adventofcode.com/2022/day/1
# Lloyd Dilley

FILE_NAME = "1.dat" # data file name

begin
  current_total = 0
  largest_total = 0
  elf_number = 1
  wealthiest_elf = 0
  File.open(FILE_NAME).each_line do |line|
    if line.chomp.empty?
      #puts("Last total: #{current_total} calories")
      if current_total > largest_total
        largest_total = current_total
        wealthiest_elf = elf_number
      end
      current_total = 0
      elf_number += 1
      #puts("Elf number: ##{elf_number}")
    else
      current_total += line.to_i
      #puts("Current total: #{current_total} calories")
    end
  end
  puts("Wealthiest elf: ##{wealthiest_elf}")
  puts("Largest total: #{largest_total} calories")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
