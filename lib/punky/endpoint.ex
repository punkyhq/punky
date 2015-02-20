defmodule Punky.Endpoint do
  use Phoenix.Endpoint, otp_app: :punky

  plug Plug.Static,
    at: "/", from: :punky,
    only: ~w(assets favicon.ico robots.txt)

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_punky_key",
    signing_salt: "GhMsTD5s",
    encryption_salt: "QU7o0CPu"

  plug :router, Punky.Router
end
