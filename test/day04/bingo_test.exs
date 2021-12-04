defmodule Adventofcode2021.Day04.BingoTest do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day04.Bingo

  test "mark_board/2" do
    board = [
      ["22", "13", "17", "11", "0"],
      ["8", "2", "23", "4", "24"],
      ["21", "9", "14", "16", "7"],
      ["6", "10", "3", "18", "5"],
      ["1", "12", "20", "15", "19"]
    ]

    expected = [
      ["1", "12", "20", "15", "19"],
      ["6", "10", "3", "18", "5"],
      ["21", "9", "14", "16", "7"],
      ["8", "2", "*", "4", "24"],
      ["22", "13", "17", "11", "0"]
    ]

    assert Bingo.mark_board(board, "23") == expected
  end

  describe "check_win/2" do

    test "returns :no_win when no row or column win" do
      board = [
        ["1", "12", "20", "15", "19"],
        ["6", "10", "3", "18", "5"],
        ["21", "9", "14", "16", "7"],
        ["8", "2", "*", "4", "24"],
        ["22", "13", "17", "11", "0"]
      ]

      assert Bingo.check_win(board) == :no_win
    end

    test "returns :win when row win" do
      board = [
        ["1", "12", "20", "15", "19"],
        ["6", "10", "3", "18", "5"],
        ["21", "9", "14", "16", "7"],
        ["*", "*", "*", "*", "*"],
        ["22", "13", "17", "11", "0"]
      ]

      assert Bingo.check_win(board) == :win
    end

    test "returns :win when column win" do
      board = [
        ["1", "12", "*", "15", "19"],
        ["6", "10", "*", "18", "5"],
        ["21", "9", "*", "16", "7"],
        ["8", "2", "*", "4", "24"],
        ["22", "13", "*", "11", "0"]
      ]

      assert Bingo.check_win(board) == :win
    end
  end

  test "find_winner/1" do
    numbers = ["2", "9", "5", "28", "7", "1"]
    boards = [
      [
        ["1", "3"],
        ["2", "4"],
      ],
      [
        ["3", "5"],
        ["1", "7"],
      ],
      [
        ["8", "2"],
        ["6", "0"],
      ]
    ]

    winner = [
      ["1", "*"],
      ["3", "*"],
    ]

    assert Bingo.find_winner_board({numbers, boards}) == {winner, 7}
  end

  test "find_loser/1" do
    numbers = ["3", "2", "5", "4", "28", "1", "19"]
    boards = [
      [
        ["1", "3"],
        ["2", "4"],
      ],
      [
        ["3", "5"],
        ["1", "7"],
      ],
      [
        ["1", "2"],
        ["5", "0"],
      ]
    ]

    loser = [
      ["*", "*"],
      ["*", "0"],
    ]

    assert Bingo.find_loser_board({numbers, boards}) == {loser, 1}
  end
end
