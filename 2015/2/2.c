/*
 * Advent of Code 2015 day 2 solution in C
 * http://adventofcode.com/2015/day/2
 * Lloyd Dilley
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const char* const FILE_NAME = "2.dat"; // data file name
static const char* const DELIMITER = "x";     // delimiter from data file

unsigned int gift_area(unsigned int length, unsigned int width, unsigned int height);
unsigned int calculate_padding(unsigned int length, unsigned int width, unsigned int height);
unsigned int calculate_ribbon(unsigned int length, unsigned int width, unsigned int height);

// Calculate surface area of gift
unsigned int gift_area(unsigned int length, unsigned int width, unsigned int height)
{
  return 2 * length * width + 2 * width * height + 2 * height * length;
}

// Determine how much additional wrap is required
unsigned int calculate_padding(unsigned int length, unsigned int width, unsigned int height)
{
  unsigned int area1 = length * width;
  unsigned int area2 = height * width;
  unsigned int area3 = height * length;
  unsigned int padding = 0;

  if(area1 <= area2 && area1 <= area3)
    padding = area1;
  else if(area2 <= area1 && area2 <= area3)
    padding = area2;
  else
    padding = area3;

  return padding;
}

// Determine ribbon requirements
unsigned int calculate_ribbon(unsigned int length, unsigned int width, unsigned int height)
{
  unsigned int ribbon_amount = 0;

  if(length <= width && length <= height)
  {
    if(width <= height)
      ribbon_amount = length * 2 + width * 2;
    else
      ribbon_amount = length * 2 + height * 2;
  }
  else if(width <= length && width <= height)
  {
    if(length <= height)
      ribbon_amount = width * 2 + length * 2;
    else
      ribbon_amount = width * 2 + height * 2;
  }
  else // height is least
  {
    if(length <= width)
      ribbon_amount = height * 2 + length * 2;
    else
      ribbon_amount = height * 2 + width * 2;
  }

  return ribbon_amount + length * width * height;
}

int main()
{
  FILE *data_file = fopen(FILE_NAME,"r");         // data file
  unsigned int length = 0, width = 0, height = 0; // dimensions of box in feet
  char line[128];                                 // holds a line from data file
  char *token = NULL;                             // refers to length, width, and height values during strtok()
  unsigned long wrap_total = 0;                   // total amount in square feet of wrapping paper required
  unsigned long ribbon_total = 0;                 // total amount in feet of ribbon required

  if(data_file == NULL)
  {
    fprintf(stderr, "Error opening: %s\n", FILE_NAME);
    exit(EXIT_FAILURE);
  }

  while(fgets(line, sizeof(line), data_file))
  {
    token = strtok(line, DELIMITER);
    length = atoi(token);
    token = strtok(NULL, DELIMITER);
    width = atoi(token);
    token = strtok(NULL, DELIMITER);
    height = atoi(token);
    //printf("%u %u %u\n", length, width, height);
    wrap_total += gift_area(length, width, height);
    wrap_total += calculate_padding(length, width, height);
    ribbon_total += calculate_ribbon(length, width, height);
  }

  printf("Total wrapping paper required: %lu sq. ft.\n", wrap_total);
  printf("Total ribbon required: %lu ft.\n", ribbon_total);
  fclose(data_file);
  return 0;
}
