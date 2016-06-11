defmodule Bot.FacebookController do
  use Bot.Web, :controller
  @verify_token "this_is_my_awesome_token"

  def webhook(conn, %{
    "hub.verify_token" => verify_token,
    "hub.challenge" => challenge})
  do
    case verify_token do
      @verify_token -> text conn, challenge
      _ ->             text conn, "Wrong"
    end
  end

end
