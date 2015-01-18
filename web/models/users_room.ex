defmodule Punky.UsersRoom do
  use Ecto.Model

  schema "users_rooms" do
    belongs_to :user, User
    belongs_to :room, Room
  end
end
