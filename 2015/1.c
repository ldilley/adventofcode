/*
 * Advent of Code 2015 day 1 solution in C
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

#include <stdio.h>
#include <stdlib.h>

static const char UP = '(';                   // instruction to go up 1 floor
static const char DOWN = ')';                 // instruction to go down 1 floor
static const char* const FILE_NAME = "1.dat"; // data file name

int main()
{
  FILE *dat_file = fopen(FILE_NAME,"r"); // data file
  signed int floor = 0;                  // start floor
  char direction = '-';                  // up or down?
  unsigned int position = 0;             // data file instruction position

  if(dat_file == NULL)
  {
    fprintf(stderr, "Error opening: %s\n", FILE_NAME);
    exit(EXIT_FAILURE);
  }

  while(!feof(dat_file))
  {
    position++;
    direction = fgetc(dat_file);
    if(direction == EOF)
    {
      puts("Last stop!");
      break;
    }
    printf("Position: #%u\n", position);
    printf("Current floor: #%d\n", floor);
    if(direction == UP)
    {
      puts("Going up!");
      floor++;
    }
    if(direction == DOWN)
    {
      puts("Going down!");
      floor--;
    }
    if(floor == -1)
      printf("Basement entered due to instruction at position: #%u\n", position);
    puts("");
  }

  printf("Final floor: #%d\n", floor);
  fclose(dat_file);
  return 0;
}
