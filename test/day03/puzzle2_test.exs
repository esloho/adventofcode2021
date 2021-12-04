defmodule Adventofcode2021.Day03.Puzzle2Test do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day03.Puzzle2

  @path "test/day03/input_test.txt"

  describe "convert_input/1" do
    test "return matrix of individual bits" do
      file_stream = File.stream!(@path, [:utf8], :line)

      expected = [
        ["0", "0", "1", "0", "0"],
        ["1", "1", "1", "1", "0"],
        ["1", "0", "1", "1", "0"],
        ["1", "0", "1", "1", "1"],
        ["1", "0", "1", "0", "1"],
        ["0", "1", "1", "1", "1"],
        ["0", "0", "1", "1", "1"],
        ["1", "1", "1", "0", "0"],
        ["1", "0", "0", "0", "0"],
        ["1", "1", "0", "0", "1"],
        ["0", "0", "0", "1", "0"],
        ["0", "1", "0", "1", "0"]
      ]

      assert Puzzle2.convert_input(file_stream) == expected
    end
  end

  describe "get_filter_char_at/2" do

    @input [
      ["0", "0"],
      ["1", "1"],
      ["1", "0"],
      ["0", "0"]
    ]

    test "return 1 when searching most common char in equal freqs" do
      assert Puzzle2.get_filter_char_at(@input, 0, &Puzzle2.get_most_common/1) == "1"
    end

    test "return most common when no equal freqs" do
      assert Puzzle2.get_filter_char_at(@input, 1, &Puzzle2.get_most_common/1) == "0"
    end

    test "return 0 when searching least common char in equal freqs" do
      assert Puzzle2.get_filter_char_at(@input, 0, &Puzzle2.get_least_common/1) == "0"
    end

    test "return least common when no equal freqs" do
      assert Puzzle2.get_filter_char_at(@input, 1, &Puzzle2.get_least_common/1) == "1"
    end
  end

  describe "find_oxygen_gen_rating/1" do

    test "returns number in decimal if last element" do
      list = [["0", "0", "1", "0", "0"]]

      assert Puzzle2.find_oxygen_gen_rating(list) == 4
    end

    test "returns rating using most common bit criteria" do
      list = [
        ["0", "0", "1", "0", "0"],
        ["1", "1", "1", "1", "0"],
        ["1", "0", "1", "1", "0"],
      ]

      assert Puzzle2.find_oxygen_gen_rating(list) == 30
    end
  end

  describe "find_co2_scrubber_rating/1" do

    test "returns number in decimal if last element" do
      list = [["0", "0", "1", "0", "0"]]

      assert Puzzle2.find_co2_scrubber_rating(list) == 4
    end

    test "returns rating using least common bit criteria" do
      list = [
        ["0", "0", "1", "0", "0"],
        ["1", "1", "1", "1", "0"],
        ["1", "0", "1", "1", "0"],
      ]

      assert Puzzle2.find_co2_scrubber_rating(list) == 4
    end
  end

  describe "binary_diagnostic/1" do

    test "return oxygen rating multiplied by co2 rating" do
      assert Puzzle2.binary_diagnostic(@path) == 230
    end
  end
end
