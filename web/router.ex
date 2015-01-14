defmodule Punky.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Punky do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/signup", UsersController, :new
    post "/signup", UsersController, :create
    get "/signin", SessionsController, :new
    post "/signin", SessionsController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Punky do
  #   pipe_through :api
  # end
end
