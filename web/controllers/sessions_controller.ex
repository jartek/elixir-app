defmodule Upwoot.SessionsController do
  use Upwoot.Web, :controller

  def index(conn, _params) do
    conn
    |> json(%{status: "OK"})
  end
end
