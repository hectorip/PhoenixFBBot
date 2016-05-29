defmodule Bot.PageController do
  use Bot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
