defmodule Punky.SessionsController do
  use Punky.Controller

  alias Punky.User

  plug :put_layout, :authentication
  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    user = User.find_by(:email, params["email"])
    if is_nil(user) do
      render conn, "new.html"
    else
      if User.authenticate(user, params["password"]) do
        conn = sign_in(conn, user)
        redirect conn, to: rooms_path(conn, :index)
      else
        render conn, "new.html"
      end
    end
  end

  def destroy(conn, params) do
    conn = sign_out(conn)

    redirect conn, to: home_path(conn, :index)
  end
end
