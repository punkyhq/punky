defmodule Punky.Controller do
  import Plug.Conn
  import Phoenix.Controller
  import Punky.Router.Helpers

  defmacro __using__(_options) do
    quote do
      use Phoenix.Controller

      import Punky.Router.Helpers

      import unquote(__MODULE__)
    end
  end

  def sign_in(conn, user) do
    put_session(conn, :user, user)
  end

  def sign_out(conn) do
    put_session(conn, :user, nil)
  end

  def current_user(conn) do
    get_session(conn, :user)
  end

  def authenticate_user!(conn) do
    case current_user(conn) do
      nil ->
        redirect conn, to: sessions_path(conn, :new)
      user ->
        case Punky.Repo.get(Punky.User, user.id) do
          nil ->
            redirect conn, to: sessions_path(conn, :new)
          user ->
            put_session(conn, :user, user)
        end
    end
  end
end

