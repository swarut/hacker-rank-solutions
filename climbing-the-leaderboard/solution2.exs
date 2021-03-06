# https://www.hackerrank.com/challenges/climbing-the-leaderboard/problem
#
#  Ideas:
#   - This is the second solution of this problem. It aims at
#     fixing performance issue.
#   - Based on the previous solution, the slow part is the leaderboard ranking
#     lookup construction. It processed the list two times, first time to
#     get rid of duplicate item, and next time is to mark the ranking.
#   - Instead of doing that, we can process them all at once and use
#     Map to store data. We remember the previous score as we process so
#     that we can save time checking for duplication.

defmodule Solution2 do
  def solve(scores, alice_scores) do
    lookup = better_score_lookup(scores)[:lookup]
    last_rank = length(Map.keys(lookup))
    IO.puts("lookup = #{inspect lookup}")
    IO.puts("last rank = #{last_rank}")

    Enum.reduce(alice_scores, %{ranks: [], last_rank: last_rank, last_score: nil}, fn(score, acc) ->
      current_rank = cond do
        acc[:last_rank] >= (last_rank + 1) -> last_rank
        true -> acc[:last_rank]
      end
      rank = case acc[:last_score] do
        ^score -> acc[:last_rank]
        _ -> compute_rank(lookup, score, 1, current_rank)
      end

      IO.puts ":: Rank for score #{score} is #{rank}"
      IO.puts "----------------------------------------\n\n"
      IO.puts(rank)
      acc
      |> Map.replace(:last_rank, rank)
      |> Map.replace(:last_score, score)
    end)
  end

  def better_score_lookup(scores) do
    Enum.reduce(scores, %{current_rank: 1, lookup: %{}, last: nil}, fn(score, acc) ->
      case acc[:last] do
        nil ->
          acc
          |> Map.replace(:last, score)
          |> Map.replace(:lookup, %{ acc[:current_rank] => score})
          |> Map.replace(:current_rank, acc[:current_rank] + 1)
        ^score -> acc
        _ ->
          acc
          |> Map.replace(:last, score)
          |> Map.replace(:lookup, Map.put(acc[:lookup], acc[:current_rank], score))
          |> Map.replace(:current_rank, acc[:current_rank] + 1)
      end
    end)
  end

  def filter_unique_scores(scores) do
    Enum.reduce(scores, %{unique_scores: [], last: nil}, fn(score, acc) ->
      case acc[:last] do
        nil -> Map.replace(acc, :last, score) |> Map.replace(:unique_scores, [score])
        ^score -> acc
        _ -> Map.replace(acc, :last, score) |> Map.replace(:unique_scores, acc[:unique_scores] ++ [score])
      end
    end)
  end

  def compute_rank(lookup, score, upper_bound_rank, lower_bound_rank) when upper_bound_rank == lower_bound_rank do
    IO.puts("---- root : score = #{score}, lookup[:upper_bound_rank] = #{lookup[upper_bound_rank]}")
    cond do
      score > lookup[upper_bound_rank] -> upper_bound_rank
      score == lookup[upper_bound_rank] -> upper_bound_rank
      score < lookup[upper_bound_rank] -> upper_bound_rank + 1
    end
  end
  def compute_rank(lookup, score, upper_bound_rank, lower_bound_rank) when lower_bound_rank < upper_bound_rank do
    compute_rank(lookup, score, lower_bound_rank, lower_bound_rank)
  end
  def compute_rank(lookup, score, upper_bound_rank, lower_bound_rank) do

    guess_rank = Integer.floor_div(upper_bound_rank + lower_bound_rank, 2)
    IO.puts("== compute_rank, score = #{score}")
    IO.puts("== upper_bound = #{upper_bound_rank}, upper_bound_score = #{lookup[upper_bound_rank]}")
    IO.puts("== lower_bound = #{lower_bound_rank}, lower_bound_score = #{lookup[lower_bound_rank]}")
    IO.puts("== guess_rank = #{guess_rank}")
    IO.puts("== guess_rank_score = #{lookup[guess_rank]}")
    cond do
      lookup[guess_rank] == score ->
        guess_rank
      lookup[guess_rank] > score  ->
        IO.puts "------> compute_rank(#{guess_rank + 1}, #{lower_bound_rank})"
        compute_rank(lookup, score, guess_rank + 1, lower_bound_rank )
      lookup[guess_rank] < score  ->
        IO.puts "------> compute_rank(#{upper_bound_rank}, #{guess_rank - 1})"
        compute_rank(lookup, score, upper_bound_rank, guess_rank - 1)
    end
  end

end

_ = String.trim(IO.gets("Input total current scores:")) |> String.to_integer
scores = String.trim(IO.gets("Input current scores:")) |> String.split(" ") |> Enum.map(fn(i) -> String.to_integer(i) end)
_ = String.trim(IO.gets("Input total alice scores")) |> String.to_integer
alice_scores = String.trim(IO.gets("Input alice scores")) |> String.split(" ") |> Enum.map(fn(i) -> String.to_integer(i) end)
result = Solution2.solve(scores, alice_scores)
