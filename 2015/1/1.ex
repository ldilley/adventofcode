# Advent of Code 2015 day 1 solution in Elixir
# http://adventofcode.com/2015/day/1
# Lloyd Dilley

defmodule Day1 do
  @up "("                         # instruction to go up a floor
  @down ")"                       # instruction to go down a floor
  @file_name "1.dat"              # data file name

  def traverse_floors do
    data_file = File.open!(@file_name)
    data = IO.read(data_file, :all)
    data = String.graphemes(data) # convert string to characters
    File.close(data_file)
    result = Enum.reduce data, {0}, fn(direction, {position}) when direction == @up ->
      {position + 1}
      direction, {position} when direction == @down ->
      {position - 1}
      direction, {position} when direction == "\n" ->
      {position}
    end 
    {position} = result
    IO.puts("Arrived at destination floor: ##{position}")
  end
end

Day1.traverse_floors