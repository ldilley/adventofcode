#!/usr/bin/env lua

--[[
  Advent of Code 2015 day 1 solution in Lua
  http://adventofcode.com/2015/day/1
  Lloyd Dilley
]]

UP = '('            -- instruction to go up a floor
DOWN = ')'          -- instruction to go down a floor
FILE_NAME = "1.dat" -- data file name

position = 0        -- current floor number
data_file, err = io.open(FILE_NAME, "r")
if not data_file then
  print("Unable to parse input file: " .. err)
end
repeat
  local direction = data_file:read(1)
  if direction == UP then
    position = position + 1
  elseif direction == DOWN then
    position = position - 1
  elseif direction == nil then
    break
  end
  print(string.format("Current floor: #%d", position))
until direction == nil
data_file:close()
print(string.format("Arrived at destination floor: #%d", position))