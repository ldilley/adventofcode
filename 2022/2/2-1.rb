#!/usr/bin/env ruby

# Advent of Code 2022 day 2 part 1 solution in Ruby
# http://adventofcode.com/2022/day/2
# Lloyd Dilley

FILE_NAME = "2.dat" # data file name
ROCK_SCORE = 1
PAPER_SCORE = 2
SCISSORS_SCORE = 3
DRAW_SCORE = 3
LOSS_SCORE = 0
WIN_SCORE = 6

begin
  total_score = 0
  File.open(FILE_NAME).each_line do |line|
    shape = line.split
    if shape[0] == 'A' && shape[1] == 'X'    # rock vs rock
      total_score += ROCK_SCORE + DRAW_SCORE
    elsif shape[0] == 'A' && shape[1] == 'Y' # rock vs paper
      total_score += PAPER_SCORE + WIN_SCORE
    elsif shape[0] == 'A' && shape[1] == 'Z' # rock vs scissors
      total_score += SCISSORS_SCORE + LOSS_SCORE
    elsif shape[0] == 'B' && shape[1] == 'X' # paper vs rock
      total_score += ROCK_SCORE + LOSS_SCORE
    elsif shape[0] == 'B' && shape[1] == 'Y' # paper vs paper
      total_score += PAPER_SCORE + DRAW_SCORE
    elsif shape[0] == 'B' && shape[1] == 'Z' # paper vs scissors
      total_score += SCISSORS_SCORE + WIN_SCORE
    elsif shape[0] == 'C' && shape[1] == 'X' # scissors vs rock
      total_score += ROCK_SCORE + WIN_SCORE
    elsif shape[0] == 'C' && shape[1] == 'Y' # scissors vs paper
      total_score += PAPER_SCORE + LOSS_SCORE
    elsif shape[0] == 'C' && shape[1] == 'Z' # scissors vs scissors
      total_score += SCISSORS_SCORE + DRAW_SCORE
    end
  end
  puts("Projected score: #{total_score}")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
