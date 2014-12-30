defmodule Punky.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    config = Application.get_all_env(:database)
    parse_url "ecto://#{config[:username]}:#{config[:password]}@#{config[:host]}/#{config[:database]}"
  end

  def priv do
    app_dir(:punky, "priv/repo")
  end
end
