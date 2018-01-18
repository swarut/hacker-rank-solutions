# https://www.hackerrank.com/challenges/day-of-the-programmer/problem
# Ideas:
#   - As number of days in other months are constant, the number
#     of days of those months are calculate ( jan + march + .. sep) = 215.
#   - Add number of days in Feb of the input year.
#   - Find the different between 256 and the number in latter step,
#     that should be the number of day from Sep.

defmodule Solution do
  def solve(year) do
    days_excluding_feb = 215
    days_before_prog_day = days_excluding_feb + number_of_day_in_feb(year)
    diff = 256 - days_before_prog_day
    diff
  end

  def number_of_day_in_feb(year) do
    case year do
      1918 -> 15
      _ ->
        case is_leap_year?(year) do
          true -> 29
          _ -> 28
        end
    end
  end

  def is_leap_year?(year) when year <= 1997 do
    rem(year, 4) == 0
  end
  def is_leap_year?(year) do
    (rem(year, 400) == 0) || (rem(year, 4) == 0) && (rem(year, 100) != 0)
  end
end

year = String.trim(IO.gets("Input number of year:")) |> String.to_integer
r = Solution.solve(year)
IO.puts("#{r}.09.#{year}")
