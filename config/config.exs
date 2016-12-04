# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pt,
  ecto_repos: [Pt.Repo]

# Configures the endpoint
config :pt, Pt.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m8KlcDDIlC0bgnXjDIyQhBLEZsnqRZkMuV0RYnW2/E360OJWxyPy1gN2jLs2EXMX",
  render_errors: [view: Pt.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pt.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  # Configures Passport authentication
  config :passport,
        resource: Pt.User,
        repo: Pt.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
