defmodule Punky.User do
  use Ecto.Model

  schema "users" do
    field :name,            :string
    field :email,           :string
    field :password,        :virtual
    field :password_digest, :string
    field :created_at,      :datetime, default: Ecto.DateTime.local
    field :updated_at,      :datetime, default: Ecto.DateTime.local
  end

  validate user,
    name:  present(),
    name:  has_length(min: 3),
    email: present(),
    password:  has_length(min: 6),
    also: validate_uniqueness

  validatep validate_uniqueness(user),
    name: unique(),
    email: unique()

  def encrypt_password(user) do
    password_digest = :erlpass.hash(user.password)
    %{user | password_digest: password_digest}
  end

  def authenticate(user, password) do
    :erlpass.match(password, user.password_digest)
  end

  def find_by(field, value) do
    Punky.Repo.one(from u in __MODULE__, where: field(u, ^field) == ^value)
  end

  def rooms(user) do
    query = from r in Punky.Room,
              select: r,
              join:   ur in Punky.UsersRoom, on: r.id == ur.room_id,
              join:   u in Punky.User, on: u.id == ur.user_id,
              where:  u.id == ^user.id
    Punky.Repo.all(query)
  end

  defp unique(field, value, opts \\ []) do
    unless find_by(field, value) do
      opts[:message] || "#{field} is already exist"
    end
  end
end

