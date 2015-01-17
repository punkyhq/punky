defmodule Punky.RoomsController do
  use Punky.Controller

  plug :action

  def index(conn, _params) do
    conn
    |> authenticate_user!
    |> render "index.html", current_user: current_user(conn)
  end

  def show(conn, _params) do
    conn
    |> authenticate_user!
    |> render "show.html", current_user: current_user(conn)
  end
end

