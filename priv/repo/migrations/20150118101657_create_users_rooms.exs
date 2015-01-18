defmodule Punky.Repo.Migrations.CreateUsersRooms do
  use Ecto.Migration

  def up do
    "
    CREATE TABLE users_rooms (
      user_id integer,
      room_id integer
    )
    "
  end

  def down do
    "DROP TABLE users_rooms"
  end
end
