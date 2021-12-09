defmodule Adventofcode2021.Utils.Points do

  def parse_point(point_str) do
    point_str
    |> String.split(",", trim: true)
    |> Enum.map(fn p -> String.to_integer(p) end)
  end

  def fill_middle_points(start_point, end_point) do
    case {start_point, end_point} do
      {[x, y], [x, z]}  -> #fill
    end
  end
end
