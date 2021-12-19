# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :jaya_currency_converter,
  ecto_repos: [JayaCurrencyConverter.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :jaya_currency_converter, JayaCurrencyConverterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "il7AKJDQYOzm96l3+V4PeXEi/87eSzgfCUqL39GLATT51WvaPyhNlgwRyVq2Xwvc",
  render_errors: [view: JayaCurrencyConverterWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: JayaCurrencyConverter.PubSub,
  live_view: [signing_salt: "F/pBLGTr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
