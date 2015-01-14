defmodule Punky.Controller do
  defmacro __using__(_options) do
    quote do
      use Phoenix.Controller

      import Punky.Router.Helpers
    end
  end
end
