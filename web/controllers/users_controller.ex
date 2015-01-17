defmodule Punky.UsersController do
  use Punky.Controller

  alias Punky.User

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    user = struct(User, params |> user_params)
    if User.validate(user) do
      user = user
              |> User.encrypt_password
              |> Punky.Repo.insert
      conn = sign_in(conn, user)
    end

    redirect conn, to: home_path(conn, :index)
  end

  defp user_params(params) do
    user = params["user"]
    %{name: user["name"], email: user["email"], password: user["password"]}
  end
end
