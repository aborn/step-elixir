defmodule StepElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :step_elixir,
     version: "0.0.1",
     elixir: "~> 1.0",
     source_url: "https://github.com/aborn/step-elixir",
     homepage_url: "https://github.com/aborn/step-elixir",
     name: "step-elixir",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger],
    mod: {SocketDemoServer, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:earmark, "~> 0.1.19", only: :dev},
     {:ex_doc, "~> 0.11.1", only: :dev}]
  end
end
