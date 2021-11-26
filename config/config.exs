# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :demo_elixir_app,
  ecto_repos: [DemoElixirApp.Repo]

# Configures the endpoint
config :demo_elixir_app, DemoElixirAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GQUfNtFPIQrATe6OuvqweYXBeLBaOQGYVEQ+vNzB+e04gn6AC6qcVkYHnBbXinjn",
  render_errors: [view: DemoElixirAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DemoElixirApp.PubSub,
  live_view: [signing_salt: "7rlXpllB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
