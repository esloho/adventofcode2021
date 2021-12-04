defmodule Adventofcode2021.Day04.Puzzle2Test do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day04.Puzzle2

  @path "test/day04/input_test.txt"

  test "bingo/1" do
    assert Puzzle2.bingo(@path) == 1924
  end
end
