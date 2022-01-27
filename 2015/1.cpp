/*
 * Advent of Code 2015 day 1 solution in C++
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

#include <fstream>
#include <iostream>

using namespace std;

static const char UP = '(';                   // instruction to go up a floor
static const char DOWN = ')';                 // instruction to go down a floor
static const char* const FILE_NAME = "1.dat"; // data file name

int main()
{
  char direction = '-';                       // up or down
  signed int position = 0;                    // current floor number
  ifstream data_file(FILE_NAME);              // data file

  if(!data_file.is_open())
  {
    cerr << "Unable to open " << FILE_NAME << '.' << endl;
    exit(EXIT_FAILURE);
  }

  while(data_file.get(direction))
  {
    if(direction == UP)
      position++;
    if(direction == DOWN)
      position--;
    cout << "Current floor: #" << position << endl;
  }
  data_file.close();
  cout << "Arrived at destination floor: #" << position << endl;
  return 0;
}
