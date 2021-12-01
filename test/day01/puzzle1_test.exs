defmodule Adventofcode2021.Day01.Puzzle1Test do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day01.Puzzle1

  describe "analyze_depth_increases/1" do

    @path "test/day01/input_test.txt"

    test "returns the number of increments" do
      assert Puzzle1.analyze_depth_increases(@path) == 4
    end
  end
end
