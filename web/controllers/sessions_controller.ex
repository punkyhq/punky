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
      redirect conn, to: "/signin"
    else
      if User.authenticate(user, params["password"]) do
        signin(conn, user)
        redirect conn, to: "/"
      else
        redirect conn, to: "/signin"
      end
    end
  end

  defp signin(conn, user) do
    put_session(conn, :user_id, user.id)
  end
end
