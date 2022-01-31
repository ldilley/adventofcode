/*
 * Advent of Code 2015 day 1 solution in JavaScript
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

var fs = require("fs");

const UP = '(';            // instruction to go up a floor
const DOWN = ')';          // instruction to go down a floor
const FILE_NAME = "1.dat"; // data file name

position = 0;              // current floor number
fs.readFile(FILE_NAME, function (err, data)
{
  if(err)
  {
    return console.error("Unable to parse input file: " + err);
  }
  for (let direction of data.toString())
  {
    if(direction == UP)
      position++;
    if(direction == DOWN)
      position--;
    console.log("Current floor: #" + position);
  }
  console.log("Arrived at destination floor: #" + position);
});