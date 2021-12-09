defmodule Adventofcode2021.Day03.Puzzle1 do
  @default_path "lib/day03/input.txt"

  alias Adventofcode2021.Utils.Matrix

  def binary_diagnostic(path \\ @default_path) do
    most_common_bits =
      path
      |> File.stream!([:utf8], :line)
      |> count_most_common()

    calculate_gamma_rate(most_common_bits) * calculate_epsilon_rate(most_common_bits)
  end

  def count_most_common(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, "", trim: true))
    |> Enum.to_list()
    |> Matrix.transpose()
    |> Enum.map(fn list ->
      freq = Enum.frequencies(list)

      cond do
        freq["0"] > freq["1"] -> "0"
        freq["0"] <= freq["1"] -> "1"
      end
    end)
  end

  def calculate_gamma_rate(most_common) do
    most_common
    |> Enum.join()
    |> String.to_integer(2)
  end

  def calculate_epsilon_rate(most_common) do
    most_common
    |> Enum.map(fn
      "0" -> "1"
      "1" -> "0"
    end)
    |> Enum.join()
    |> String.to_integer(2)
  end
end
