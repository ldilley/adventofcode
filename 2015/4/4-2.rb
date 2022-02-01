#!/usr/bin/env ruby

# Advent of Code 2015 day 4 part 2 solution in Ruby
# http://adventofcode.com/2015/day/4
# Lloyd Dilley

require 'digest'

SECRET_KEY = "bgvyzdsv"

number = 0
done = false
until done do
  md5 = Digest::MD5.new
  md5.update SECRET_KEY + number.to_s
  puts md5.hexdigest
  done = true if md5.hexdigest[0 .. 5] == "000000"
  puts number if done
  number += 1
end