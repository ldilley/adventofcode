#!/usr/bin/env ruby

# Advent of Code 2022 day 1 part 2 solution in Ruby
# http://adventofcode.com/2022/day/1#part2
# Lloyd Dilley

FILE_NAME = "1.dat" # data file name

begin
  current_total = 0
  first_total = 0
  second_total = 0
  third_total = 0
  combined_total = 0
  elf_number = 1
  first_wealthiest_elf = 0
  second_wealthiest_elf = 0
  third_wealthiest_elf = 0
  File.open(FILE_NAME).each_line do |line|
    if line.chomp.empty?
      #puts("Last total: #{current_total} calories")
      if current_total > third_total && current_total > second_total && current_total >= first_total
        third_total = second_total
        second_total = first_total
        first_total = current_total
        third_wealthiest_elf = second_wealthiest_elf
        second_wealthiest_elf = first_wealthiest_elf
        first_wealthiest_elf = elf_number
      elsif current_total > third_total && current_total >= second_total && current_total < first_total
        third_total = second_total
        second_total = current_total
        third_wealthiest_elf = second_wealthiest_elf
        second_wealthiest_elf = elf_number
      elsif current_total >= third_total && current_total < second_total && current_total < first_total
        third_total = current_total
        third_wealthiest_elf = elf_number
      end
      current_total = 0
      elf_number += 1
      #puts("Elf number: ##{elf_number}")
    else
      current_total += line.to_i
      #puts("Current total: #{current_total} calories")
    end
  end
  puts("First wealthiest elf: ##{first_wealthiest_elf} with #{first_total} calories")
  puts("Second wealthiest elf: ##{second_wealthiest_elf} with #{second_total} calories")
  puts("Third wealthiest elf: ##{third_wealthiest_elf} with #{third_total} calories")
  combined_total = first_total + second_total + third_total
  puts("Combined total: #{combined_total} calories")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
