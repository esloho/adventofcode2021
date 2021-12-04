defmodule Adventofcode2021.Day04.Puzzle1 do

  alias Adventofcode2021.Day04.Bingo

  @default_path "lib/day04/input.txt"


  def bingo(path \\ @default_path) do
      path
      |> File.stream!([:utf8], :line)
      |> parse_input()
      |> Bingo.find_winner_board()
      |> Bingo.calculate_score()
  end

  def parse_input(stream) do
    [[bingo_numbers] | boards] =
      stream
      |> Stream.map(&String.split(&1, ["\n"], trim: true))
      |> Stream.reject(fn list -> list == [] end)
      |> Enum.to_list()

    bingo_numbers = String.split(bingo_numbers, ",", trim: true)
    boards =
      boards
      |> Enum.map(&Enum.join/1)
      |> Enum.map(&String.split(&1, " ", trim: true))
      |> Enum.chunk_every(5)

    {bingo_numbers, boards}
  end
end
