defmodule Upwoot.UserController do
  use Upwoot.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: Upwoot.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Upwoot.UserView, "show.json", user: user)
  end
end
