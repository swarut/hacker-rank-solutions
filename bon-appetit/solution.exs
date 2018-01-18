# https://www.hackerrank.com/challenges/bon-appetit/problem
# Ideas:
#   - Find the sum of prices except the unpaid item.
#   - Divide by two and compare with actual charge.
defmodule Solution do
  def sol(k, items, charge) do
    sum = items
    |> Enum.with_index
    |> Enum.reduce(0, fn(item, acc) ->
      case elem(item, 1) do
        ^k ->  acc
        _ -> acc + elem(item, 0)
      end
    end)
    expect = sum/2.0
    if charge == expect do
      "Bon Appetit"
    else
      "#{round(charge - expect)}"
    end

  end
end


[n, k] = String.trim(IO.gets("Input number of items ordered and k:")) |> String.split(" ") |> Enum.map(fn(y) -> String.to_integer(y) end)
items = String.trim(IO.gets("Input price list:")) |> String.split(" ") |> Enum.map(fn(y) -> elem(Float.parse(y), 0) end)
charge = elem(String.trim(IO.gets("Input charge amount:")) |> Float.parse, 0)
r = Solution.sol(k, items, charge)
IO.puts r
