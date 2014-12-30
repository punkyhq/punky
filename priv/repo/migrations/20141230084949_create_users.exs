defmodule Punky.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    "CREATE TABLE users( \
    id serial primary key, \
    email varchar(255), \
    created_at timestamp, \
    updated_at timestamp)"
  end

  def down do
    "DROP TABLE users"
  end
end
