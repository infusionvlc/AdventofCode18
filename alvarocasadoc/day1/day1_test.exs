# AdventOfCode2018
# @alvarocasadoc
# Day 1

Code.require_file("day1.exs")
ExUnit.start()


defmodule Day1Test do
  use ExUnit.Case

  test "sum_frequencies should return the sum of al list elements" do
    input = String.split("+1, +1, +1", ", ", trim: true)
    assert Day1.sum_frequencies(input) == 3

    input = String.split("+1, +1, -2", ", ", trim: true)
    assert Day1.sum_frequencies(input) == 0

    input = String.split("-1, -2, -3", ", ", trim: true)
    assert Day1.sum_frequencies(input) == -6
  end

  test "find_first_cycle should return the first recurring sum of all previous elements in a list" do
    input = String.split("+3, +3, +4, -2, -4", ", ", trim: true)
    assert Day1.find_first_cycle(input) == 10

    input = String.split("-6, +3, +8, +5, -6", ", ", trim: true)
    assert Day1.find_first_cycle(input) == 5

    input = String.split("+7, +7, -2, -7, -4", ", ", trim: true)
    assert Day1.find_first_cycle(input) == 14
  end
end