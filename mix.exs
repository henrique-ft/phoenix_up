defmodule PhoenixUp.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_up,
      version: "0.1.6",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "Extra generators for develop Phoenix projects faster.",
      package: package(),
      docs: [logo: "priv/static/logo-orange.png", extras: ["README.md"], main: "readme"],
      name: "PhoenixUp",
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev, runtime: false}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support", "test"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      name: :phoenix_up,
      maintainers: ["Henrique Fernandez Teixeira"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/henriquefernandez/phoenix_up"}
    ]
  end
end
