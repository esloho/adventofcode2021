defmodule Adventofcode2021.Day04.Puzzle1Test do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day04.Puzzle1

  @path "test/day04/input_test.txt"

  test "parse_input/1" do
    file_stream = File.stream!(@path, [:utf8], :line)

    bingo_numbers = ["7", "4", "9", "5", "11", "17", "23", "2", "0", "14", "21", "24", "10", "16",
      "13", "6", "15", "25", "12", "22", "18", "20", "8", "19", "3", "26", "1"]

    boards = [
      [
        ["22", "13", "17", "11", "0"],
        ["8", "2", "23", "4", "24"],
        ["21", "9", "14", "16", "7"],
        ["6", "10", "3", "18", "5"],
        ["1", "12", "20", "15", "19"]
      ],
      [
        ["3", "15", "0", "2", "22"],
        ["9", "18", "13", "17", "5"],
        ["19", "8", "7", "25", "23"],
        ["20", "11", "10", "24", "4"],
        ["14", "21", "16", "12", "6"]
      ],
      [
        ["14", "21", "17", "24", "4"],
        ["10", "16", "15", "9", "19"],
        ["18", "8", "23", "26", "20"],
        ["22", "11", "13", "6", "5"],
        ["2", "0", "12", "3", "7"]
      ]
    ]

    assert Puzzle1.parse_input(file_stream) == {bingo_numbers, boards}
  end

  test "bingo/1" do
    assert Puzzle1.bingo(@path) == 4512
  end
end
