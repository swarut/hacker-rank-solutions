# https://www.hackerrank.com/challenges/save-the-prisoner/problem

defmodule Solution do
  def solve(items) do
    items
    |> Enum.map(fn(i) -> IO.puts solve_case(i) end)
  end

  def solve_case([n, m, s]) do
    step = rem(m, n)
    v = rem((s + step - 1), n)
    if v != 0 do
      v
    else
      n
    end
  end

end

t = String.trim(IO.gets("")) |> String.to_integer

range = 1..t
stream = Stream.map(range, fn(_) ->
  String.trim(IO.gets(""))
end)

items = Enum.to_list(stream)
|> Enum.map(fn(i) ->
  i
  |> String.split(" ")
  |> Enum.map(fn(y) -> String.to_integer(y) end)
end)

Solution.solve(items)
