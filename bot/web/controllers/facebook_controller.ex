defmodule Bot.FacebookController do
  use Bot.Web, :controller

  def webhook(conn, params = %{"hub.challenge" => token}) do

    render conn, "index.html"
  end

end
