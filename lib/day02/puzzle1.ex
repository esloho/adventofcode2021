defmodule Adventofcode2021.Day02.Puzzle1 do
  @default_path "lib/day02/input.txt"

  def dive(path \\ @default_path) do
    path
    |> File.stream!([:utf8], :line)
    |> convert_input()
    |> follow_course()
    |> then(fn {h_pos, depth} -> h_pos * depth end)
  end

  def convert_input(stream) do
    stream
    |> Stream.map(&String.split(&1, [" ", "\n"], trim: true))
    |> Stream.map(fn [action, length] ->
      {String.to_atom(action), String.to_integer(length)}
    end)
    |> Enum.to_list()
  end

  def follow_course(course) do
    course
    |> Enum.reduce({_h_pos = 0, _depth = 0}, fn
      {:forward, length}, {h_pos, depth} ->
        {h_pos + length, depth}

      {:down, length}, {h_pos, depth} ->
        {h_pos, depth + length}

      {:up, length}, {h_pos, depth} ->
        {h_pos, depth - length}
    end)
  end
end
