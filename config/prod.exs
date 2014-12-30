use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :punky, Punky.Endpoint,
  url: [host: "example.com"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "sdqgCVtirlPAuOZcewYtkuWse3SdKRTkO6fWSFmgzumd6gz3oj9MUd32vAzQ2HVt"

config :logger,
  level: :info

config :database,
  host: "localhost",
  database: "punky_prod",
  username: "punky",
  password: System.get_env("PUNKY_DATABASE_PASSWOD")
