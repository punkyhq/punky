defmodule Punky.Router do
  use Phoenix.Router

  socket "/ws", Punky do
    channel "rooms:*", RoomChannel
  end

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

    get "/", HomeController, :index

    get "/sign_up", UsersController, :new
    post "/sign_up", UsersController, :create
    get "/sign_in", SessionsController, :new
    post "/sign_in", SessionsController, :create
    get "/sign_out", SessionsController, :destroy

    resources "/rooms", RoomsController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Punky do
  #   pipe_through :api
  # end
end
