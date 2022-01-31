/*
 * Advent of Code 2015 day 1 solution in Scala
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

import scala.io.Source

 object Day1
 {
  val UP = '('            // instruction to go up a floor
  val DOWN = ')'          // instruction to go down a floor
  val FILE_NAME = "1.dat" // data file name

  def main(args: Array[String])
  {
    try
    {
      var position = 0    // current floor number
      val data_file = Source.fromFile(FILE_NAME)
      val data = data_file.getLines.mkString
      data_file.close
      for(i <- 0 until data.length())
      {
        if(data.charAt(i) == UP)
        {
          position += 1
        }
        if(data.charAt(i) == DOWN)
        {
          position -= 1
        }
        println("Current floor: #" + position)
      }
      println("Arrived at destination floor: #" + position)
    }
    catch
    {
      case e: Exception =>
      {
        println("Unable to parse in put file: " + e)
      }
    }
  }
}