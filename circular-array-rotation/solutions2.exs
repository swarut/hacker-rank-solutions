# https://www.hackerrank.com/challenges/circular-array-rotation/problem
#
#  Ideas:
#   - Instead of actual rotating the list, we need to calculate
#     the query into the absolute index compare to the original list.
#
#  Notes:
#   - This one yields a better performance as it's just mathematic operations.

defmodule Solution2 do
  def solve(item_count, items, rotation_time, queries) do
    queries
    |> Enum.map(fn(index) ->
      IO.puts(Enum.at(items, absolute_position(item_count, rotation_time, index)))
    end)
  end

  def absolute_position(item_count, rotation_time, query) do
    index = query - rem(rotation_time, item_count)

    cond do
      index >= 0 ->
        #IO.puts "rotation time #{rotation_time}, query #{query}, index[1] #{index}"
        index
      index < 0 ->
        #IO.puts "rotation time #{rotation_time}, query #{query}, index[2] #{item_count + index}"
        item_count + index
    end
  end

end


[count, rotation_time, query_count] = String.trim(IO.gets("")) |> String.split(" ") |> Enum.map(fn(y) -> String.to_integer(y) end )
items = String.trim(IO.gets("")) |> String.split(" ") |> Enum.map(fn(y) -> String.to_integer(y) end )

range = 1..query_count
stream = Stream.map(range, fn(_) ->
  String.trim(IO.gets(""))
end)

queries = Enum.to_list(stream) |> Enum.map(fn(i) -> String.to_integer(i) end)


sol = Solution2.solve(count, items, rotation_time, queries)
