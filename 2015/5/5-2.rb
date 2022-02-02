#!/usr/bin/env ruby

# Advent of Code 2015 day 5 part 2 solution in Ruby
# http://adventofcode.com/2015/day/5
# Lloyd Dilley

FILE_NAME = "5.dat"                                     # data file name

begin
  nice_count = 0                                        # amount of strings that are considered nice
  File.open(FILE_NAME).each do |line|
    if line =~ /([a-zA-Z]{2})[a-zA-Z]*\1/               # contains a pair of any 2 letters that occurs 2 or more times, but not in immediate succession
      nice_count += 1 if line =~ /([a-zA-Z])[a-zA-Z]\1/ # contains a trigraph sequence with 2 of the same letters separated by any different letter
      puts line
    end
  end
  puts("Amount of strings that are considered nice: #{nice_count}")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
