defmodule Adventofcode2021.Day02.Puzzle2 do
  @default_path "lib/day02/input.txt"

  def dive(path \\ @default_path) do
    path
    |> File.stream!([:utf8], :line)
    |> convert_input()
    |> follow_course()
    |> transform_result()
  end

  def convert_input(stream) do
    stream
    |> Stream.map(&String.split(&1, [" ", "\n"], trim: true))
    |> Stream.map(&parse_line/1)
    |> Enum.to_list()
  end

  def follow_course(course) do
    course
    |> Enum.reduce({0, 0, 0}, &move/2)
  end

  defp parse_line([action, length]) do
    {String.to_existing_atom(action), String.to_integer(length)}
  end

  defp move({:forward, units}, {h_pos, depth, aim}) do
    depth_increase = aim * units
    {h_pos + units, depth + depth_increase, aim}
  end

  defp move({:down, units}, {h_pos, depth, aim}) do
    {h_pos, depth, aim + units}
  end

  defp move({:up, units}, {h_pos, depth, aim}) do
    {h_pos, depth, aim - units}
  end

  defp transform_result({h_pos, depth, _aim}) do
    h_pos * depth
  end
end
