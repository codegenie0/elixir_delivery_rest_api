# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :delivery_api,
  ecto_repos: [DeliveryApi.Repo]

# Configures the endpoint
config :delivery_api, DeliveryApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TwE8Xy5iLE7sLdEHPNXS/3tJkY4dMfMV7io2gw2GzRkjjVqFps1f/yqLWjZ2L3uI",
  render_errors: [view: DeliveryApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DeliveryApi.PubSub,
  live_view: [signing_salt: "RT+q/t6H"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
