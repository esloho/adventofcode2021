defmodule Adventofcode2021.Day01.Puzzle1 do
  @default_path "lib/day01/input.txt"

  def analyze_depth_increases(path \\ @default_path) do
    path
    |> File.stream!([:utf8], :line)
    |> convert_input()
    |> count_depth_increases()
  end

  def convert_input(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list()
  end

  def count_depth_increases(measures) do
    measures
    |> Enum.reduce({_count = 0, _last = -1}, fn
      measure, {count, -1} ->
        {count, measure}

      measure, {count, last} when measure > last ->
        {count + 1, measure}

      measure, {count, _last} ->
        {count, measure}
    end)
    |> elem(0)
  end
end
