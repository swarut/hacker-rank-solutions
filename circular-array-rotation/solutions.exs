# https://www.hackerrank.com/challenges/circular-array-rotation/problem
#
#  Ideas:
#   - Use recurive to rotate items
#
#  Notes:
#   - Recursive is fine, but it's tricky. As Elixir allows mappin only
#     the individual right hand side of the list, we need to reverse the list
#     so that we can get the last time. Next, we need to append that item
#     to list (see rotate([lhs|rhs], n)). Again, using ++ operation to append
#     the item causes the bad performance. For this, even switch appending to use
#       rotate(List.flatten([rhs|[lhs]]), n-1)
#     still having the performance issue that can't pass the hackerrank's expectation.

defmodule Solution do
  def solve(items, rotation_time, queries) do
    rotated_items = do_rotate(items, rotation_time)
    #IO.puts("rotated = #{inspect rotated_items}")
    queries
    |> Enum.map(fn(index) ->
      IO.puts(Enum.at(rotated_items, index))
    end)
  end

  def do_rotate(items, n) do
    rotate(Enum.reverse(items), n)
    |> Enum.reverse
  end

  def rotate(items, 0) do
    items
  end
  def rotate([lhs|rhs], n) do
    rotate(rhs ++ [lhs], n-1)
  end

end


[count, rotation_time, query_count] = String.trim(IO.gets("")) |> String.split(" ") |> Enum.map(fn(y) -> String.to_integer(y) end )
items = String.trim(IO.gets("")) |> String.split(" ") |> Enum.map(fn(y) -> String.to_integer(y) end )

range = 1..query_count
stream = Stream.map(range, fn(_) ->
  String.trim(IO.gets(""))
end)

queries = Enum.to_list(stream) |> Enum.map(fn(i) -> String.to_integer(i) end)

sol = Solution.solve(items, rotation_time, queries)
