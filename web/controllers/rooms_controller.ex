defmodule Punky.RoomsController do
  use Punky.Controller

  plug :action

  def index(conn, _params) do
    room = Punky.User.rooms(current_user(conn)) |> List.first
    conn
    |> authenticate_user!
    |> redirect to: rooms_path(conn, :show, room.id)
  end

  def show(conn, _params) do
    rooms = Punky.User.rooms(current_user(conn))
    conn
    |> authenticate_user!
    |> render "show.html", rooms: rooms
  end
end

