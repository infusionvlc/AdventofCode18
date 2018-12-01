# AdventOfCode2018
# @alvarocasadoc
# Day 1

defmodule Day1 do

  # Part 1
  def sum_frequencies(input) do
    items = Enum.map(input, fn x -> Integer.parse(x) |> elem(0) end)
    Enum.sum(items)
  end

  # Part 2
  def find_first_cycle(input) do
    items = Enum.map(input, fn x -> Integer.parse(x) |> elem(0) end)
    stream = Stream.scan(Stream.cycle(items), &(&1 + &2))

    Enum.reduce_while(stream, [], fn current, prev ->
      if current in prev, do: {:halt, current}, else: {:cont, [current | prev]}
    end)
  end
end