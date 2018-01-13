# https://www.hackerrank.com/challenges/divisible-sum-pairs/problem
# Ideas:
#   - From the input list, create a new list(1) that each number in
#     that list is modulo  with k.
#   - Create a list(2) of the count of total occurence of each number in (1).
#     Such list has k length.
#   - Calculate the total possible pair by this formula:
#       Given c[i] is the element at i index of (2)
#       if k is odd
#         no_of_possible_pair = ncr(c[0], 2) + ((c[1] * c[k-1]) ... (c[k/2] * c[k - k/2])
#       if k is even
#         no_of_possible_pair = ncr(c[0], 2) + ncr(c[k/2], 2) + ((c[1] * c[k-1]) ... (c[k/2 - 1] * c[k - (k/2 - 1)])
#       where ncr(x,y) is a combination of y items from x items. ncr(x,y) = (x!)/(y!)(x-y)!
#
# Note:
#   - Using Elixir, I do not want to user List to construct (2), as it will
#     be hard to be used on the last step (need to divide such list into 2 and
#     reverse the latter half). Thus, I use the Map to store the count of each
#     item under the key create from a Set of [i, k-i].

defmodule Solution do
  def sol(numbers, k) do
    res = Enum.reduce(numbers, %{}, fn(i, acc) ->
      mod = rem(i, k)
      #IO.puts("read #{i} , mod #{mod}")

      m = case mod do
        0 -> MapSet.new |> MapSet.put(mod)
        _ -> MapSet.new |> MapSet.put(mod) |> MapSet.put(k - mod)
      end

      case acc[m] do
        nil -> Map.put(acc, m, %{mod => 1})
        _ ->
          case acc[m][mod] do
            nil -> Map.replace(acc, m, Map.put(acc[m], mod, 1))
            _ -> Map.replace(acc, m, Map.replace(acc[m], mod, acc[m][mod] + 1))
          end
      end
    end)
    #IO.puts(inspect(res))
    cases = Enum.map(res, fn({key, val}) ->
      list = MapSet.to_list(key)
      #IO.puts("processing key #{inspect key}, val #{inspect val}, list #{inspect list}")
      case list do
        [a] ->
          #IO.puts("map [a], val #{inspect val}, val[a] = #{inspect val[a]}")
          case val[a] do
            1 -> 0
            2 -> 1
            _ ->
              factorial(val[a])/(factorial(2) * factorial(val[a] - 2))
          end
        [a, b] ->
          if Map.has_key?(res[key], a) && Map.has_key?(res[key], b) do
            res[key][a] * res[key][b]
          else
            0
          end
      end
    end)
    #IO.puts("FINAL CASES = #{inspect cases}")
    Enum.reduce(cases, 0, fn(i, acc) -> acc + i end)
  end

  def factorial(1) do
    1
  end

  def factorial(n) do
    n * factorial(n-1)
  end

end
k = String.trim(IO.gets("Please input the number K:\n")) |> String.to_integer
numbers = String.trim(IO.gets("Please input the list of numbers (space separated): \n"))
          |> String.split(" ") |> Enum.map(fn(y) -> String.to_integer(y) end)
result = Solution.sol(numbers, k)
IO.puts(round(result))
