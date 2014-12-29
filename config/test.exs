use Mix.Config

config :punky, Punky.Endpoint,
  http: [port: System.get_env("PORT") || 4001]
