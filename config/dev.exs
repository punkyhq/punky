use Mix.Config

config :punky, Punky.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  debug_errors: true

# Enables code reloading for development
config :phoenix, :code_reloader, true

config :database,
  host: "localhost",
  database: "punky_dev",
  username: "postgres",
  password: ""
