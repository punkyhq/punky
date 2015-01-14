defmodule Punky.Controller do
  import Plug.Conn

  defmacro __using__(_options) do
    quote do
      use Phoenix.Controller

      import Punky.Router.Helpers

      import unquote(__MODULE__)
    end
  end

  def sign_in(conn, user) do
    put_session(conn, :user_id, user.id)
  end

  def sign_out(conn) do
    put_session(conn, :user_id, nil)
  end
end
