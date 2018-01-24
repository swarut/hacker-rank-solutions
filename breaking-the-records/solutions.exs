# https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem
#
#  Ideas:
#   - Straight forward, use Map to record the max and min break, update everytimes
#     the break is happened.

defmodule Data do
  defstruct max: 0, min: 0, max_break: 0, min_break: 0, first_item_processed: false
end

defmodule Solution do
  def solve(scores) do
    Enum.reduce(scores, %Data{}, fn(score, data) ->
      case data.first_item_processed do
        true ->
          cond do
            score > data.max -> Map.merge(data, %{max: score, max_break: data.max_break + 1})
            score < data.min -> Map.merge(data, %{min: score, min_break: data.min_break + 1})
            true -> data
          end
        false ->
          Map.merge(data, %{first_item_processed: true, max: score, min: score })
      end
    end)
  end
end

_ = String.trim(IO.gets("Input number of scores:")) |> String.to_integer
scores = String.trim(IO.gets("Input scores:")) |> String.split(" ") |> Enum.map(fn(y) -> String.to_integer(y) end)

result = Solution.solve(scores)
IO.puts("#{result.max_break} #{result.min_break}")
