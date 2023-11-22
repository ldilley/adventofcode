#!/usr/bin/env ruby

# Advent of Code 2022 day 2 part 2 solution in Ruby
# http://adventofcode.com/2022/day/2#part2
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
    if shape[1] == 'X' # loss
      case shape[0]
        when 'A'
          total_score += SCISSORS_SCORE + LOSS_SCORE
        when 'B'
          total_score += ROCK_SCORE + LOSS_SCORE
        when 'C'
          total_score += PAPER_SCORE + LOSS_SCORE
      end
    elsif shape[1] == 'Y' # draw
      case shape[0]
        when 'A'
          total_score += ROCK_SCORE + DRAW_SCORE
        when 'B'
          total_score += PAPER_SCORE + DRAW_SCORE
        when 'C'
          total_score += SCISSORS_SCORE + DRAW_SCORE
      end
    elsif shape[1] == 'Z' # win
      case shape[0]
        when 'A'
          total_score += PAPER_SCORE + WIN_SCORE
        when 'B'
          total_score += SCISSORS_SCORE + WIN_SCORE
        when 'C'
          total_score += ROCK_SCORE + WIN_SCORE
      end
    end
  end
  puts("Score: #{total_score}")
rescue Exception => e
  puts("Unable to parse input file: #{e.message}")
end
