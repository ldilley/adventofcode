#!/usr/bin/env bash

# Advent of Code 2015 day 1 solution in bash (ksh93 works as well)
# http://adventofcode.com/2015/day/1
# Lloyd Dilley

UP="("            # instruction to go up a floor
DOWN=")"          # instruction to go down a floor
FILE_NAME="1.dat" # data file name

position=0        # current floor number

while read -n1 direction; do
  if [ "$direction" = "$UP" ]; then
    ((position++))
  fi
  if [ "$direction" = "$DOWN" ]; then
    ((position--))
  fi
  printf "Current floor: #%d\n" $position
done < $FILE_NAME

printf "Arrived at destination floor: #%d\n" $position
