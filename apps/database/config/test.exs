use Mix.Config

# Configure your database
config :database, Database.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "database_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
