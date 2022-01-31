#!/usr/bin/env tclsh

# Advent of Code 2015 day 1 solution in TCL
# http://adventofcode.com/2015/day/1
# Lloyd Dilley

# instruction to go up a floor
set UP "("

# instruction to go down a floor
set DOWN ")"

# data file name
set FILE_NAME "1.dat"

# current floor number
set position 0

set data_file [open $FILE_NAME r]
set data [read $data_file]
foreach direction [split $data ""] {
  if {$direction == $UP} {incr position}
  if {$direction == $DOWN} {incr position -1}
  puts "Current floor: #$position"
}
close $data_file
puts "Arrived at destination floor: #$position"
