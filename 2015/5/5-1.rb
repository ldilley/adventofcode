#!/usr/bin/env ruby

# Advent of Code 2015 day 5 part 1 solution in Ruby
# http://adventofcode.com/2015/day/5
# Lloyd Dilley

FILE_NAME = "5.dat"                                   # data file name

begin
  nice_count = 0                                      # amount of strings that are considered nice
  File.open(FILE_NAME).each do |line|
    if line.count("aeiou") >= 3                       # contains at least 3 vowels
      if line =~ /([a-zA-Z])\1/                       # contains at least 1 letter that occurs 2 or more times in immediate succession ("aa" for example)
        nice_count += 1 unless line =~ /ab|cd|pq|xy/i # does not contain this group of letters
      end
    end
  end
  puts("Amount of strings that are considered nice: #{nice_count}")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end