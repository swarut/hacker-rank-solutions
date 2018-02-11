# https://www.hackerrank.com/challenges/append-and-delete/problem

defmodule Solution do
  def solve(original_string, query_string, steps) do
    reduce(original_string, query_string, steps, String.graphemes(original_string), String.graphemes(query_string))
  end

  def reduce(original_string, query_string, steps, [], []) do
    step_diff = steps - String.length(original_string)
    cond do
      rem(steps, 2) == 0 -> true
      step_diff < 0 -> false
      2*(steps) >= String.length(original_string) -> true
      true -> false
    end
  end
  def reduce(original_string, query_string, steps, original_string_prime, []) do
    step_diff = steps - (length(original_string_prime))
    s_step_diff = steps - (String.length(original_string) + String.length(query_string))
    cond do
      step_diff == 0 -> true
      (s_step_diff > 0) -> true
      (step_diff > 0) && (rem(step_diff, 2) == 0) -> true
      true -> false
    end
  end
  def reduce(original_string, query_string, steps, [], query_string_prime) do
    step_diff = steps - length(query_string_prime)
    cond do
      step_diff == 0 -> true
      steps > (2*String.length(original_string) + length(query_string_prime)) -> true
      (step_diff > 0) && (rem(step_diff, 2) == 0) -> true
      true -> false
    end
  end
  def reduce(original_string, query_string, steps, [l_os|r_os], [l_qs|r_qs]) do
    cond do
      l_os == l_qs -> reduce(original_string, query_string, steps, r_os, r_qs)
      true ->
        min_step_required =  length(r_os) + length(r_qs) + 2
        step_diff = steps - min_step_required
        cond do
          step_diff == 0 -> true
          (step_diff > 0) -> true
          true -> false
        end
    end
  end
end

original_string = String.trim(IO.gets(""))
query_string = String.trim(IO.gets(""))
steps = String.trim(IO.gets("")) |> String.to_integer

sol = Solution.solve(original_string, query_string, steps)
cond do
  sol == true -> IO.puts("Yes")
  sol == false -> IO.puts("No")
  true -> IO.puts("No")
end
