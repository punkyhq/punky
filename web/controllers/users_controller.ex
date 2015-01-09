defmodule Punky.UsersController do
  use Punky.Controller

  alias Punky.User

  plug :put_layout, :signin
  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    user = struct(User, params |> user_params)
    if User.validate(user) do
      user
      |> User.encrypt_password
      |> Punky.Repo.insert
    end

    redirect conn, to: "/"
  end

  defp user_params(params) do
    user = params["user"]
    %{name: user["name"], email: user["email"], password: user["password"]}
  end
end
