use Mix.Config

# Configure your database
config :database, Database.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "database_dev",
  hostname: "localhost",
  pool_size: 10
