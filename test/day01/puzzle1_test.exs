defmodule Adventofcode2021.Day01.Puzzle1Test do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day01.Puzzle1

  @path "test/day01/input_test.txt"

  describe "convert_input/1" do

    test "returns measures" do
      file_stream = File.stream!(@path, [:utf8], :line)

      assert Puzzle1.convert_input(file_stream) == [131, 140, 136, 135, 155, 175, 178]
    end
  end

  describe "analyze_depth_increases/1" do

    test "returns the number of increments" do
      assert Puzzle1.analyze_depth_increases(@path) == 4
    end
  end
end
