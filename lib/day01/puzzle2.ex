defmodule Adventofcode2021.Day01.Puzzle2 do

  @default_path "lib/day01/input.txt"

  def analyze_depth_increases(path \\ @default_path) do
    path
    |> read_input()
    |> convert_input()
    |> count_depth_increases()
  end

  def convert_input(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Stream.chunk_every(3, 1, :discard)
    |> Enum.to_list()
  end

  def count_depth_increases(measures) do
    measures
    |> Enum.map(&Enum.sum/1)
    |> Enum.reduce({0, -1}, &detect_increased/2)
    |> elem(0)
  end

  defp read_input(path) do
    File.stream!(path, [:utf8], :line)
  end

  defp detect_increased(measure, {count, -1}) do
    {count, measure}
  end

  defp detect_increased(measure, {count, last}) when measure > last do
    {count + 1, measure}
  end

  defp detect_increased(measure, {count, _last}) do
    {count, measure}
  end
end
