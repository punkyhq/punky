defmodule Punky.View do
  use Phoenix.View, root: "web/templates"

  # The quoted expression returned by this block is applied
  # to this module and all other views that use this module.
  using do
    quote do
      # Import common functionality
      import Punky.Router.Helpers

      # Use Phoenix.HTML to import all HTML functions (forms, tags, etc)
      use Phoenix.HTML

      # Common aliases
      alias Phoenix.Controller.Flash
    end
  end

  # Functions defined here are available to all other views/templates
  def csrf_token(conn) do
    Plug.Conn.get_session(conn, :csrf_token)
  end

  def user_signed_in?(conn) do
    !!current_user(conn)
  end

  def current_user(conn) do
    case Plug.Conn.get_session(conn, :user_id) do
      nil ->
        nil
      user_id ->
        Punky.Repo.get Punky.User, user_id
    end
  end
end

