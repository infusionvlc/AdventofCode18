# AdventOfCode2018
# @alvarocasadoc
# Day 1

Code.require_file("day1.exs")

## Test execution

{:ok, file} = File.open("input1.txt", [:read, :write])
input = IO.read(file, :all)
input = String.split(input, "\n", trim: true)

# Exec part 1
IO.inspect Day1.sum_frequencies(input)

# Exec part 2
IO.inspect Day1.find_first_cycle(input)