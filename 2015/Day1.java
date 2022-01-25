/*
 * Advent of Code 2015 day 1 solution in Java
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Day1
{
  public static final char UP = '(';              // instruction to go up a floor
  public static final char DOWN = ')';            // instruction to go down a floor
  public static final String FILE_NAME = "1.dat"; // data file name

  public static void main(String[] args)
  {
    try
    {
      int position = 0;                           // current floor number
      BufferedReader data_file = new BufferedReader(new FileReader(new File(FILE_NAME)));
      int direction = 0;
      while((direction = data_file.read()) != -1)
      {
        if((char)direction == UP)
          position++;
        if((char)direction == DOWN)
          position--;
        System.out.println("Current floor: #" + position);
      }
      data_file.close();
      System.out.println("Arrived at destination floor: #" + position);
    }
    catch(Exception e)
    {
      System.out.println("Unable to parse input file: " + e);
    }
    return;
  }
}