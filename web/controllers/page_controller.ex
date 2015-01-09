defmodule Punky.PageController do
  use Punky.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
