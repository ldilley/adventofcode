/*
 * Advent of Code 2015 day 1 solution in Rust
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

use std::fs::File;
use std::io::Read;

const UP : char = '(';            // instruction to go up a floor
const DOWN : char = ')';          // instruction to go down a floor
const FILE_NAME : &str = "1.dat"; // data file name

fn main()
{
  let mut position : i32 = 0;     // current floor number
  let mut data = String::new();   // data from file
  let mut data_file = File::open(FILE_NAME).expect("Unable to open data file.");
  data_file.read_to_string(&mut data).expect("Unable to parse data.");
  for direction in data.chars()
  {
    if direction == UP
    {
      position += 1;
    }
    if direction == DOWN
    {
      position -= 1;
    }
    println!("Current floor: #{}", position);
  }
  println!("Arrived at destination floor: #{}", position);
}
