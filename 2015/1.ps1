<#
  Advent of Code 2015 day 1 solution in PowerShell
  http://adventofcode.com/2015/day/1
  Lloyd Dilley
#>

Set-Variable UP -Option Constant -Value '('            # instruction to go up a floor
Set-Variable DOWN -Option Constant -Value ')'          # instruction to go down a floor
Set-Variable FILE_NAME -Option Constant -Value "1.dat" # data file name

try
{
  $position = 0                                        # current floor number
  $data_file = New-Object System.IO.StreamReader($FILE_NAME)
  while(!$data_file.EndOfStream)
  {
    $direction = [char]$data_file.Read()
    if($direction -eq $UP)
    {
      $position++
    }
    if($direction -eq $DOWN)
    {
      $position--
    }
    Write-Output "Current floor: #$position"
  }
  $data_file.Dispose()
  Write-Output "Arrived at destination floor: #$position"
}
catch
{
  Write-Output "Unable to parse input file:"
  Write-Output $_
}