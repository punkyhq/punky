defmodule Punky.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def up do
    "
    CREATE TABLE rooms (
      id serial primary key,
      name varchar(255),
      creator_id integer,
      created_at timestamp,
      updated_at timestamp
    )
    "
  end

  def down do
    "DROP TABLE rooms"
  end
end
