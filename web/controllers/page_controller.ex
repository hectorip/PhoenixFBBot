defmodule Bot.PageController do
  use Bot.Web, :controller

  def index(conn, _params) do
    text conn, "Swiftly Messenger Bot"
  end
  def coontact(conn, params) do
    json conn, params
  end
end
