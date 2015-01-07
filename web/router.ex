defmodule Punky.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Punky do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/signup", UsersController, :new
    post "/signup", UsersController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Punky do
  #   pipe_through :api
  # end
end
