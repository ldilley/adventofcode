#!/usr/bin/env perl -w

# Advent of Code 2015 day 1 solution in Perl
# http://adventofcode.com/2015/day/1
# Lloyd Dilley

use strict;
use warnings;

use constant UP => '(';             # instruction to go up a floor
use constant DOWN => ')';           # instruction to go down a floor
use constant FILE_NAME => '1.dat';  # data file name

my $position = 0;                   # current floor number
open(my $data_file, '<', FILE_NAME) or die "Unable to parse input file: $!";

while(<$data_file>)
{
  my @data = split //;              # split input string into characters
  for my $direction(@data)
  {
    $position++ if($direction eq UP);
    $position-- if($direction eq DOWN);
    print "Current floor: #$position\n";
  }
}
close $data_file;
print "Arrived at destination floor: #$position\n";
