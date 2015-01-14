use Mix.Config

config :punky, Punky.Endpoint,
  http: [port: System.get_env("PORT") || 4001]

# Print only warnings and errors during test
config :logger, level: :warn

config :database,
  host: "localhost",
  database: "punky_test",
  username: "postgres",
  password: ""
