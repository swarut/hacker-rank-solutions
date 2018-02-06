# https://www.hackerrank.com/challenges/picking-numbers/problem
# Ideas:
#   - In general, the problem as you the count of two adjacent number
#   that are 1 different. Thus sorting can help making problem easier to be solved.
#   - After sorting, count the number of occurence, then pick the adjacent pair
#   with those are 1 different and has max summation of counts.

defmodule Solution do
  def solve(items) do
    mapper = items
    |> Enum.sort(fn(a,b) -> a < b end)
    |> Enum.reduce(%{}, fn(item, acc) ->
      case Map.has_key?(acc, item) do
        true ->
          Map.replace!(acc, item, acc[item] + 1)
        false ->
          Map.put(acc, item, 1)
      end
    end)
    |> Map.to_list

    mapper = Enum.sort(mapper, fn({a1, a2}, {b1, b2}) -> a1 < b1 end)
    #IO.puts(inspect mapper)

    find_max_pair(mapper, {0, 0})
  end

  def find_max_pair([{a_key, a_count} | [{aa_key, aa_count}|b]], max) do
    #IO.puts "Comparing #{a_key} with #{aa_key}, max #{inspect max}"
    case (aa_key - a_key) do
      1 ->
        {max_a, max_b} = max
        sum_max = max_a + max_b
        max = cond do
          (a_count + aa_count) >= sum_max -> {a_count, aa_count}
          true -> max
        end
        find_max_pair([{aa_key, aa_count} | b], max)
      _ ->
        find_max_pair([{aa_key, aa_count} | b], max)
    end
  end
  def find_max_pair([{a_key, a_count}], max) do
    {max_a, max_b} = max
    sum_max = max_a + max_b
    max = cond do
      (a_count) >= sum_max -> {a_count, 0}
      true -> max
    end
  end
end

n = String.trim(IO.gets("")) |> String.to_integer
items = String.trim(IO.gets("")) |> String.split(" ") |> Enum.map(fn(x) -> String.to_integer(x) end)
{a, b} = Solution.solve(items)
IO.puts(a+b)
