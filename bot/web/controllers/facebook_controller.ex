defmodule Bot.FacebookController do
  use Bot.Web, :controller
  @verify_token "this_is_my_awesome_token"

  def webhook(conn, params = %{
    "hub.verify_token" => @verify_token,
    "hub.challenge" => challenge})
  do
    text conn, challenge
  end

end
