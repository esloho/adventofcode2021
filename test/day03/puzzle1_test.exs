defmodule Adventofcode2021.Day03.Puzzle1Test do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day03.Puzzle1

  @path "test/day03/input_test.txt"

  test "count_most_common/1" do
    file_stream = File.stream!(@path, [:utf8], :line)

    assert Puzzle1.count_most_common(file_stream) == ["1", "0", "1", "1", "0"]
  end

  test "calculate_gamma_rate/1" do
    assert Puzzle1.calculate_gamma_rate(["1", "0", "1", "1", "0"]) == 22
  end

  test "calculate_epsilon_rate/1" do
    assert Puzzle1.calculate_epsilon_rate(["1", "0", "1", "1", "0"]) == 9
  end

  test "binary_diagnostic/1" do
    assert Puzzle1.binary_diagnostic(@path) == 198
  end
end
