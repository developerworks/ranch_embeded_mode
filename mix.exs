defmodule RanchEmbededMode.Mixfile do
  use Mix.Project

  def project do
    [app: :ranch_embeded_mode,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    dev_packages = Mix.env == :dev && [:exsync] || []
    [applications: [:logger] ++ dev_packages,
     mod: {RanchEmbededMode, []}]
  end

  defp deps do
    [
      {:ranch, "~> 1.2.1"},
      {:exsync, "~> 0.1.3", only: [:dev]}
    ]
  end
end
