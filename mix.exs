defmodule OriginSimulator.MixProject do
  use Mix.Project

  @description """
  A tool to simulate a (flaky) upstream origin during load and stress tests.
  """

  def project do
    [
      app: :origin_simulator,
      version: "1.1.0",
      # elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),

      # Docs
      name: "OriginSimulator",
      description: @description,
      source_url: "https://github.com/bbc/origin_simulator",
      homepage_url: "https://github.com/bbc/origin_simulator",
      docs: [
        main: "README",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {OriginSimulator.Application, []}
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.13"},
      {:cowboy, "~> 2.9"},
      {:plug_cowboy, "~> 2.6"},
      {:poison, "~> 5.0"},
      {:httpoison, "~> 2.0"},
      {:distillery, "~> 2.1"},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "origin_simulator",
      maintainers: [
        "bbc",
        "JoeARO",
        "ettomatic",
        "samfrench"
      ],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/bbc/origin_simulator"}
    ]
  end
end
