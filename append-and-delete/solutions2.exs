defmodule Solution2 do
  def solve(original_string, query_string, steps) do

    reduce(original_string, query_string, steps, String.graphemes(original_string), String.graphemes(query_string))
  end

  def reduce(original_string, query_string, steps, [], []) do
    cond do
      rem(steps, 2) == 0 -> true
      steps >= 2*String.length(original_string) -> true
      true -> false
    end
  end
  def reduce(original_string, query_string, steps, original_string_prime, []) do
    step_diff = steps - (length(original_string_prime))
    step_required_rewrite = String.length(original_string) + String.length(query_string)
    cond do
      (step_diff > 0) && rem(step_diff, 2) == 0 -> true
      steps >= step_required_rewrite -> true
      true -> false
    end
  end
  def reduce(original_string, query_string, steps, [], query_string_prime) do
    step_diff = steps - (length(query_string_prime))
    step_required_rewrite = String.length(original_string) + String.length(query_string)
    cond do
      (step_diff > 0) && rem(step_diff, 2) == 0 -> true
      steps >= step_required_rewrite -> true
      true -> false
    end
  end
  def reduce(original_string, query_string, steps, [l_os|r_os], [l_qs|r_qs]) do
    cond do
      l_os == l_qs -> reduce(original_string, query_string, steps, r_os, r_qs)
      true ->
        min_step_required =  length(r_os) + length(r_qs) + 2
        step_diff = steps - min_step_required

        step_required = length(r_os) + length(r_qs) + 2
        step_required_rewrite = String.length(original_string) + String.length(query_string)
        #IO.puts("step required = #{step_required}")
        #IO.puts("step required rewrite = #{step_required_rewrite}")
        cond do
          (steps > step_required) && (rem(steps, 2) == 0) -> true
          steps == step_required -> true
          steps >= step_required_rewrite -> true
          true -> false
        end
    end
  end
end

original_string = String.trim(IO.gets(""))
query_string = String.trim(IO.gets(""))
steps = String.trim(IO.gets("")) |> String.to_integer

sol = Solution2.solve(original_string, query_string, steps)
cond do
  sol == true -> IO.puts("Yes")
  sol == false -> IO.puts("No")
  true -> "x"
end
