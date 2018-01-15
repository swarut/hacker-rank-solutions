# https://www.hackerrank.com/challenges/drawing-book/problem
# Ideas:
#   - Calculate number of time from front and tail, then give the min.
#   - Calculating number of time from tail is confusing, instead, calulating
#     from target page up to the tail is easier to reason.
#   - The only special case is when turning from target page that is odd,
#     to the last page that is even (need +1).

defmodule Solution do
  def solve(total_page, target_page) do
    turn_from_head = Integer.floor_div(target_page, 2)

    turn_from_tail = case [rem(target_page, 2), rem(total_page, 2)] do
      [1, 0] -> Integer.floor_div((total_page - target_page), 2) + 1
      [_, _] -> Integer.floor_div((total_page - target_page), 2)
    end
    Enum.min([turn_from_head, turn_from_tail])
  end
end

total_page = String.trim(IO.gets("Input number of page")) |> String.to_integer
target_page = String.trim(IO.gets("Input target page")) |> String.to_integer
IO.puts(Solution.solve(total_page, target_page))
