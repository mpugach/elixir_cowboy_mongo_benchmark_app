defmodule PerfExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :perf_example,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
    ]
  end

  def application do
    [
      extra_applications: [
        :ranch,
        :logger,
        :cowboy,
        :poison,
        :mongodb,
        :poolboy,
      ],
      mod: {PerfExample.Application, []},
    ]
  end

  defp deps do
    [
      {:cowboy, github: "ninenines/cowboy", tag: "2.0.0-pre.6"},
      {:poison, "3.0.0"},
      {:mongodb, github: "ericmj/mongodb"},
      {:poolboy, "1.5.1"},
      {:credo, "~> 0.5", only: [:dev, :test]},
    ]
  end
end
