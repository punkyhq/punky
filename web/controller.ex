defmodule Punky.Controller do
  defmacro __using__(_options) do
    quote do
      use Phoenix.Controller
    end
  end
end
