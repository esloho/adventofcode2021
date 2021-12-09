defmodule Adventofcode2021.Utils.Matrix do

  @spec transpose([[any()]]) :: [[any()]]
  def transpose(matrix) do
    matrix
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end
