defmodule SampleRunner do
  import ExProf.Macro

  @doc "analyze with profile macro"
  def do_analyze do
    profile do
      #:timer.sleep 2000
      # IO.puts "message\n"
      Enum.reverse([1,2,3,4,5,5,6,6,7,7,8,8,88,8,8,8,8,8,8,8,8,8])
      Enum.reverse([1,2,3,4,5,5,6,6,7,7,8,8,88,8,8,8,8,8,8,8,8,8])
      Enum.reverse([1,2,3,4,5,5,6,6,7,7,8,8,88,8,8,8,8,8,8,8,8,8])
      Enum.reverse([1,2,3,4,5,5,6,6,7,7,8,8,88,8,8,8,8,8,8,8,8,8])
      Enum.reverse([1,2,3,4,5,5,6,6,7,7,8,8,88,8,8,8,8,8,8,8,8,8])
    end
  end

  @doc "get analysis records and sum them up"
  def run do
    {records, _block_result} = do_analyze
    total_percent = Enum.reduce(records, 0.0, &(&1.percent + &2))
    IO.inspect "totalx = #{total_percent}"
  end
end
