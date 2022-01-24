#!/usr/bin/env python

# Advent of Code 2015 day 1 solution in Python
# http://adventofcode.com/2015/day/1
# Lloyd Dilley

import sys

UP = '('             # instruction to go up a floor
DOWN = ')'           # instruction to go down a floor
INPUT_FILE = "1.dat" # input data file name

position = 0

try:
  data_file = open(INPUT_FILE)
  while True:
    direction = data_file.read(1)
    if direction == UP:
      position += 1
    if direction == DOWN:
      position -= 1
    if not direction:
      break
    print("Current floor: #{}".format(position))
  data_file.close()
except Exception as e:
  print("Unable to parse input file: ")
  print(e)
  sys.exit(1)

print("Arrived at destination floor: #{}".format(position))
