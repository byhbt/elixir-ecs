defmodule DemoElixirApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :demo_elixir_app,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        lint: :test,
        coverage: :test,
        coveralls: :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {DemoElixirApp.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "test/factories"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:credo, "~> 1.6.1", [only: [:dev, :test], runtime: false]},
      {:dialyxir, "~> 1.1.0", [only: [:dev], runtime: false]},
      {:ecto_sql, "~> 3.4"},
      {:ex_machina, "~> 2.7.0", [only: :test]},
      {:excoveralls, "~> 0.14.4", [only: :test]},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:mimic, "~> 1.5.1", [only: :test]},
      {:mime, "~> 2.0.1", override: true},
      {:phoenix, "~> 1.5.7"},
      {:phoenix_ecto, "~> 4.1"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:plug_cowboy, "~> 2.0"},
      {:postgrex, ">= 0.0.0"},
      {:sobelow, "~> 0.11.1", [only: [:dev, :test], runtime: false]},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:wallaby, "~> 0.29.1", [only: :test, runtime: false]}
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
      "assets.compile": &compile_assets/1,
      coverage: ["coveralls.html --raise"],
      codebase: [
        "deps.unlock --check-unused",
        "format --check-formatted",
        "credo --strict",
        "sobelow --config"
      ],
      setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end

  defp compile_assets(_) do
    Mix.shell().cmd("npm run --prefix assets build:dev", quiet: true)
  end
end
