defmodule Punky.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", message, socket) do
    reply socket, "joined", %{status: "connected"}
    {:ok, socket}
  end

  def join("rooms:" <> _private_topic, message, socket) do
    {:error, socket, :unauthorized}
  end

  def handle_in("new:message", message, socket) do
    broadcast socket, "new:message", message
    {:ok, socket}
  end

  def handle_out("new:message", message, socket) do
    reply socket, "new:message", message
    {:ok, socket}
  end
end
