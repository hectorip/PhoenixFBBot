use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :bot, Bot.Endpoint,
  secret_key_base: "s1OxD+EM1QU0dkdkMU5neTyAHytDMmyyQXGlWaC+EXtTPBwXL6sZCCs1Z3M50GVH"

# Configure your database
config :bot, Bot.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bot_prod",
  pool_size: 20
