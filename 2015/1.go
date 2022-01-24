/*
 * Advent of Code 2015 day 1 solution in Go
 * http://adventofcode.com/2015/day/1
 * Lloyd Dilley
 */

package main

import (
  "fmt"
  "io/ioutil"
)

const UP = '('
const DOWN = ')'
const FILE_NAME = "1.dat"

func main() {
  var position = 0
  data, err := ioutil.ReadFile(FILE_NAME)
  if err != nil {
    fmt.Println("Unable to parse input file:\n", err)
  }
  for i := 0; i < len(data); i++ {
    if data[i] == UP {
      position++
    }
    if data[i] == DOWN {
      position--
    }
    fmt.Printf("Current floor: #%d\n", position)
  }
  fmt.Printf("Arrived at destination floor: #%d\n", position)
}
