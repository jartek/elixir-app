# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

config :phoenix, :format_encoders,
  "json-api": Poison

# General application configuration
config :upwoot,
  ecto_repos: [Upwoot.Repo]

# Configures the endpoint
config :upwoot, Upwoot.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+Kr0FUxZHcNLM27ERojacGrq9KQkfJ90T7gNPttTDYjIZ4TFNMT+JC5nL4hIYrD8",
  render_errors: [view: Upwoot.ErrorView, accepts: ~w(json)],
  pubsub: [name: Upwoot.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Upwoot",
  ttl: { 30, :days },
  verify_issuer: true,
  secret_key: System.get_env("GUARDIAN_SECRET") || "Ep5mzuymxU8O5SkHBBgF3dNtQXJiCu+KI6FN+GMxqPkDCdFDiZq34r0R1WHp9wIr",
  serializer: Upwoot.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :phoenix, :format_encoders,
  "json-api": Poison

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
