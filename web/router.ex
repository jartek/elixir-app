defmodule Upwoot.Router do
  use Upwoot.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Upwoot do
    pipe_through :api
    resources "/sessions", SessionsController, only: [:index]
  end
end
