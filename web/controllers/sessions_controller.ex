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
        redirect conn, to: page_path(conn, :index)
      else
        render conn, "new.html"
      end
    end
  end

  def destroy(conn, params) do
    conn = sign_out(conn)

    redirect conn, to: page_path(conn, :index)
  end

  defp sign_in(conn, user) do
    put_session(conn, :user_id, user.id)
  end

  def sign_out(conn) do
    put_session(conn, :user_id, nil)
  end
end
