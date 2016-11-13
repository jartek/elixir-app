defmodule Upwoot.AuthErrorHandler do
 use Upwoot.Web, :controller

 def unauthenticated(conn, _) do
  conn
   |> put_status(401)
   |> render(Upwoot.ErrorView, "401.json")
 end

 def unauthorized(conn, _) do
  conn
   |> put_status(403)
   |> render(Upwoot.ErrorView, "403.json")
 end
end
