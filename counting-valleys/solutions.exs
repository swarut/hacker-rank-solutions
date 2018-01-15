# https://www.hackerrank.com/challenges/counting-valleys/problem
# Ideas:
#   - Use a map to store the height and number of occurence valleys.
#   - Read the input, if U, increase the height. if D, decrease the height.
#     Record the number of time where the new height is 0 by the effect
#     of U.

defmodule Solution do
  def solve(path) do
    tracker = %{current_height: 0, valley_occurence: 0}
    Enum.reduce(path, tracker, fn(step, acc) ->

      case step do
        "U" ->
          new_height = acc[:current_height] + 1
          valley_occurence = case new_height do
            0 -> acc[:valley_occurence] + 1
            _ -> acc[:valley_occurence]
          end
          acc
          |> Map.replace(:current_height, new_height)
          |> Map.replace(:valley_occurence, valley_occurence )
        "D" ->
          new_height = acc[:current_height] - 1
          acc
          |> Map.replace(:current_height, new_height)
      end
    end)
  end
end

n = String.trim(IO.gets("Input number of step:\n")) |> String.to_integer
path = String.trim(IO.gets("Input step (a string of D and U charaters):")) |> String.split("", trim: true)
IO.puts(inspect Solution.solve(path)[:valley_occurence])
