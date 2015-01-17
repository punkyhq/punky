defmodule Punky.HomeController do
  use Punky.Controller

  plug :action

  def index(conn, _params) do
    conn
    |> authenticate_user!
    |> redirect to: rooms_path(conn, :index)
  end
end
