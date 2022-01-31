<?php
/*
 * Advent of Code 2015 day 1 solution in PHP
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

const UP = '(';            # instruction to go up a floor
const DOWN = ')';          # instruction to go down a floor
const FILE_NAME = "1.dat"; # input file name

$position = 0;             # current floor number
$data_file = fopen(FILE_NAME, "r") or die("Unable to parse input file.\n");

while(!feof($data_file))
{
  $direction = fgetc($data_file);
  if($direction == UP)
    $position++;
  if($direction == DOWN)
    $position--;
  print("Current floor: #$position\n");
}
fclose($data_file);
print("Arrived at destination floor: #$position\n");
?>