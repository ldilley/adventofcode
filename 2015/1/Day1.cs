/*
 * Advent of Code 2015 day 1 solution in C#
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

using System;
using System.IO;

public class Day1
{
  public const char Up = '(';             // instruction to go up a floor
  public const char Down = ')';           // instruction to go down a floor
  public const string FileName = "1.dat"; // data file name

  public static void Main()
  {
    int position = 0;                     // current floor number
    string data = "";                     // data from input file

    try
    {
      data = File.ReadAllText(FileName);
    }
    catch(Exception e)
    {
      Console.WriteLine("Unable to parse input file:\n{0}", e);
      Environment.Exit(1);
    }

    for(int i = 0; i < data.Length; i++)
    {
      if(data[i] == Up)
        position++;
      if(data[i] == Down)
        position--;
      Console.WriteLine("Current floor: #{0}", position);
    }
    Console.WriteLine("Arrived at destination floor: #{0}", position);
    return;
  }
}