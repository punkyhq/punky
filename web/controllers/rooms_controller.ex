defmodule Punky.RoomsController do
  use Punky.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, _params) do
    render conn, "show.html"
  end
end
