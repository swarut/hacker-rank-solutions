# https://www.hackerrank.com/challenges/migratory-birds/problem
# Ideas:
#   - Use the map to remember the count of each type
#   - Use the map to remember the type that has maximum count
defmodule Solution do
  def solve(birds) do
    counter = %{}
    Enum.reduce(birds, counter, fn(bird, acc) ->
      acc =  case Map.has_key?(acc, bird) do
        true ->
          Map.replace(acc, bird, acc[bird] + 1)
        false ->
          Map.put(acc, bird, 1)
      end

      case Map.has_key?(acc, :max_type) do
        true ->
          cond do
            acc[:max_type] != bird ->
              cond do
                (acc[bird] > acc[acc[:max_type]]) -> Map.replace(acc, :max_type, bird)
                (bird < acc[:max_type]) && (acc[bird] == acc[acc[:max_type]]) -> Map.replace(acc, :max_type, bird)
                true -> acc
              end
            true -> acc
          end
        false ->
          Map.put(acc, :max_type, bird)
      end

    end)

  end
end

n = String.trim(IO.gets("Input number of birds:")) |> String.to_integer
birds = String.trim(IO.gets("Input list of birds:")) |> String.split(" ") |> Enum.map(fn(y) -> String.to_integer(y) end)
r = Solution.solve(birds)
IO.puts(r[:max_type])
