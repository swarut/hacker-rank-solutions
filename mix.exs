defmodule HackerRankSolutions.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :hacker_rank_solutions,
      version: "0.1.2",
      elixir: "~> 1.5",
      name: "hacker_rank_solutions",
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/swarut/hacker_rank_solutions"
    ]
  end

  def application do
    []
  end

  defp deps() do
    [
      {:exprof, "~> 0.2.0"}
    ]
  end

  defp description() do
    ""
  end

  defp package() do

    [
      maintainers: ["Warut Surapat"],
      licenses: ["MIT"],
      links: %{"Github" =>"https://github.com/swarut/hacker_rank_solutions"}
    ]

  end
end
