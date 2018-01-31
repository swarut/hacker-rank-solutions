# https://www.hackerrank.com/challenges/electronics-shop/problem
#
#  Ideas:
#   - Do not do O(n^2)
#   - Sort first list descendingly, the second list ascendingly.
#   - Sum the first elements of each list. If the result is is equal,
#     we return the allow-price. If the result is greater than allow-price,
#     move to check the next item on the first list. If it's less,
#     move to check the next item on the second list.
#   - Do like that until reaching last pair.


defmodule Solution do
  def solve(s, keyboards, usbs) do
    sorted_keyboards = Enum.sort(keyboards, fn(a, b) -> a >= b end)
    sorted_usbs = Enum.sort(usbs, fn(a, b) -> a <= b end)
    best_match(sorted_keyboards, sorted_usbs, s, -1)
  end

  def best_match([k], [u], upper_bound, max) do
    cond do
      (k + u) > upper_bound -> max
      (k + u) == upper_bound -> k + u
      (k + u) < upper_bound -> k + u
        if (k + u) > max do
          k + u
        else
          max
        end
    end
  end
  def best_match([k|keyboards], [u], upper_bound, max) do
    cond do
      (k + u) > upper_bound -> best_match(keyboards, [u], upper_bound, max)
      (k + u) == upper_bound -> k + u
      (k + u) < upper_bound ->
        if (k + u) > max do
          k + u
        else
          max
        end
    end
  end
  def best_match([k], [u|usbs], upper_bound, max) do
    cond do
      (k + u) > upper_bound -> best_match([k], usbs, upper_bound, max)
      (k + u) == upper_bound -> k + u
      (k + u) < upper_bound ->
        if (k + u) > max do
          k + u
        else
          max
        end
    end
  end
  def best_match([k|keyboards], [u|usbs], upper_bound, max) do
    cond do
      (k + u) > upper_bound -> best_match(keyboards, [u|usbs], upper_bound, max)
      (k + u) == upper_bound -> k + u
      (k + u) < upper_bound ->
        if (k + u) > max do
          best_match([k|keyboards], usbs, upper_bound, (k + u))
        else
          best_match([k|keyboards], usbs, upper_bound, max)
        end
    end
  end

end


[s,_,_] = String.trim(IO.gets("")) |> String.split(" ") |> Enum.map(fn(i) -> String.to_integer(i) end)
keyboards = String.trim(IO.gets("")) |> String.split(" ") |> Enum.map(fn(i) -> String.to_integer(i) end)
usbs = String.trim(IO.gets("")) |> String.split(" ") |> Enum.map(fn(i) -> String.to_integer(i) end)
IO.puts "#{Solution.solve(s, keyboards, usbs)}"
