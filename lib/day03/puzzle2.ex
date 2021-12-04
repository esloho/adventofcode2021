defmodule Adventofcode2021.Day03.Puzzle2 do
  @default_path "lib/day03/input.txt"

  def binary_diagnostic(path \\ @default_path) do
    list_numbers =
      path
      |> File.stream!([:utf8], :line)
      |> convert_input()

    find_oxygen_gen_rating(list_numbers) * find_co2_scrubber_rating(list_numbers)
  end

  def convert_input(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, "", trim: true))
    |> Enum.to_list()
  end

  def find_oxygen_gen_rating(list_numbers) do
    find_rating(list_numbers, 0, &get_most_common/1)
  end

  def find_co2_scrubber_rating(list_numbers) do
    find_rating(list_numbers, 0, &get_least_common/1)
  end

  def find_rating([number | []], _, _) do
    number
    |> Enum.join()
    |> String.to_integer(2)
  end

  def find_rating(list_numbers, pos, search_fun) do
    filter_char = get_filter_char_at(list_numbers, pos, search_fun)

    filtered_list =
      list_numbers
      |> Enum.filter(fn number -> Enum.at(number, pos) == filter_char end)

    find_rating(filtered_list, pos + 1, search_fun)
  end

  def get_filter_char_at(list_numbers, pos, search_fun) do
    list_numbers
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.at(pos)
    |> Enum.frequencies()
    |> search_fun.()
  end

  def get_most_common(freq) do
    if freq["0"] > freq["1"], do: "0", else: "1"
  end

  def get_least_common(freq) do
    if freq["0"] > freq["1"], do: "1", else: "0"
  end
end
