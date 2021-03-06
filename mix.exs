defmodule JayaCurrencyConverter.MixProject do
  use Mix.Project

  @source_url "https://github.com/franknfjr/jaya_currency_converter"
  @version "0.1.0"

  def project do
    [
      app: :jaya_currency_converter,
      version: @version,
      elixir: "~> 1.11.4",
      source_url: @source_url,
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.json": :test,
        "coveralls.html": :test
      ],
      description: "Jaya Currency Converter is a converter exchange",
      package: package(),
      docs: docs(),
      name: "Currency Converter"
    ]
  end

  defp package do
    [
      licenses: ["MIT lincense"],
      maintainers: [
        "Frank Ferreira"
      ],
      files: ["docs", "lib", "mix.exs", "LICENSE.md", "CHANGELOG.md", "README.md"],
      links: %{
        "GitHub" => @source_url
      }
    ]
  end

  defp docs do
    [
      name: "Jaya",
      main: "readme",
      logo: "./assets/jaya_currency_converter.png",
      output: "docs",
      extras: [
        "README.md",
        "CHANGELOG.md",
        "LICENSE.md"
      ],
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {JayaCurrencyConverter.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.13"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:sobelow, "~> 0.8", only: :dev},
      {:tesla, "~> 1.3.0"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
