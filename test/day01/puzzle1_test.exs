defmodule Adventofcode2021.Day01.Puzzle1Test do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day01.Puzzle1

  @path "test/day01/input_test.txt"

  test "convert_input/1" do
    file_stream = File.stream!(@path, [:utf8], :line)

    assert Puzzle1.convert_input(file_stream) == [131, 140, 136, 135, 155, 175, 178]
  end

  test "analyze_depth_increases/1" do
    assert Puzzle1.analyze_depth_increases(@path) == 4
  end
end
