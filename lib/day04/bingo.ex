defmodule Adventofcode2021.Day04.Bingo do

  def find_winner_board({bingo_numbers, initial_boards}) do
    Enum.reduce_while(bingo_numbers, initial_boards, fn number, boards ->
      result =
        boards
        |> Enum.map(&mark_board(&1, number))
        |> Enum.reduce_while({:no_win, []}, fn board, {_, acc} ->
          case check_win(board) do
            :no_win -> {:cont, {:no_win, [board | acc]}}
            :win -> {:halt, {:win, board}}
          end
        end)

      case result do
        {:win, winner} -> {:halt, {winner, String.to_integer(number)}}
        {:no_win, updated_boards} -> {:cont, updated_boards}
      end
    end)
  end

  def find_loser_board({bingo_numbers, initial_boards}) do
    Enum.reduce_while(bingo_numbers, initial_boards, fn number, boards ->
      result =
        boards
        |> Enum.map(&mark_board(&1, number))
        |> Enum.reduce({[], []}, fn board, {winners, losers} ->
          case check_win(board) do
            :no_win -> {winners, [board | losers]}
            :win -> {[board | winners], losers}
          end
        end)

      case result do
        {[last_winner], []} -> {:halt, {last_winner, String.to_integer(number)}}
        {_winners, losers} -> {:cont, losers}
      end
    end)
  end

  def mark_board(board, number) do
    Enum.reduce(board, [], fn row, acc ->
      marked_row = Enum.map(row, fn
        ^number -> "*"
        el -> el
      end)
      [marked_row | acc]
    end)
  end

  def check_win(board) do
    all_rows =
      board
      |> Enum.zip()
      |> Enum.map(&Tuple.to_list/1)
      |> Enum.concat(board)

    Enum.reduce_while(all_rows, :no_win, fn row, _ ->
      case Enum.reject(row, &(&1 == "*")) do
        [] -> {:halt, :win}
        _ -> {:cont, :no_win}
      end
    end)
  end

  def calculate_score({winner, number}) do
    winner
    |> Enum.concat()
    |> Enum.reject(&(&1 == "*"))
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
    |> then(fn total_sum -> total_sum * number end)
  end
end
