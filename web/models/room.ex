defmodule Punky.Room do
  use Ecto.Model

  schema "rooms" do
    field :name,            :string
    field :created_at,      :datetime, default: Ecto.DateTime.local
    field :updated_at,      :datetime, default: Ecto.DateTime.local

    belongs_to :creator, User
  end
end
