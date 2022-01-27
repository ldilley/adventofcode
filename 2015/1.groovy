/*
 * Advent of Code 2015 day 1 solution in Groovy
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

final UP = '('            // instruction to go up a floor
final DOWN = ')'          // instruction to go down a floor
final FILE_NAME = "1.dat" // data file name

try
{
  position = 0            // current floor number
  File data_file = new File(FILE_NAME)
  String data = data_file.text
  for(i = 0; i < data.length(); i++)
  {
    if(data[i] == UP)
      position++
    if(data[i] == DOWN)
      position--
    println("Current floor: #" + position)
  }
  println("Arrived at destination floor: #" + position)
}
catch(Exception e)
{
  println("Unable to parse input file: " + e)
}