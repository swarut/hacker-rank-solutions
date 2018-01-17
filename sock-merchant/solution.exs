# https://www.hackerrank.com/challenges/sock-merchant/problem
# Ideas:
#   - Very straight-forward. Just count the number of sock then count number of pair.
defmodule Solution do
  def sol(socks) do
    socks
    |> Enum.reduce(%{}, fn(item, acc) ->
      case Map.has_key?(acc, item) do
        true ->
          Map.replace(acc, item, acc[item] + 1)
        false ->
          Map.put(acc, item, 1)
      end
    end)
    |> Enum.reduce(0, fn({k, v}, acc) -> acc + Integer.floor_div(v, 2) end)

  end
end

n = String.trim(IO.gets("Input number of sock:")) |> String.to_integer
socks = String.trim(IO.gets("Input sock list:")) |> String.split(" ") |> Enum.map(fn(y) -> String.to_integer(y) end)
r = Solution.sol(socks)
IO.puts("#{inspect r}")
