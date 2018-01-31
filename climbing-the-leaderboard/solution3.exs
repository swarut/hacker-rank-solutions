defmodule Solution3 do
  def solve(scores, alice_scores) do

  end

  def rank([s|s_tail], [a|a_tail]) do
    
  end
end

_ = String.trim(IO.gets("Input total current scores:")) |> String.to_integer
scores = String.trim(IO.gets("Input current scores:")) |> String.split(" ") |> Enum.map(fn(i) -> String.to_integer(i) end)
scores = Enum.reverse(scores)
_ = String.trim(IO.gets("Input total alice scores")) |> String.to_integer
alice_scores = String.trim(IO.gets("Input alice scores")) |> String.split(" ") |> Enum.map(fn(i) -> String.to_integer(i) end)
result = Solution2.solve(scores, alice_scores)
