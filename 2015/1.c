/*
 * Advent of Code 2015 day 1 solution in C
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

#include <stdio.h>
#include <stdlib.h>

static const char UP = '(';                   // instruction to go up a floor
static const char DOWN = ')';                 // instruction to go down a floor
static const char* const FILE_NAME = "1.dat"; // data file name

int main()
{
  char direction = '-';                       // up or down
  signed int position = 0;                    // current floor number
  FILE *data_file = fopen(FILE_NAME,"r");     // data file

  if(data_file == NULL)
  {
    fprintf(stderr, "Unable to open %s.\n", FILE_NAME);
    exit(EXIT_FAILURE);
  }

  while(!feof(data_file))
  {
    direction = fgetc(data_file);
    if(direction == EOF)
      break;
    if(direction == UP)
      position++;
    if(direction == DOWN)
      position--;
    printf("Current floor: #%d\n", position);
  }
  fclose(data_file);
  printf("Arrived at destination floor: #%d\n", position);
  return 0;
}
