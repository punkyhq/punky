defmodule Punky.Controller do
  defmacro __using__(_options) do
    quote do
      use Phoenix.Controller

      import Punky.Router.Helpers

      def sign_in(conn, user) do
        put_session(conn, :user_id, user.id)
      end

      def sign_out(conn) do
        put_session(conn, :user_id, nil)
      end
    end
  end
end
