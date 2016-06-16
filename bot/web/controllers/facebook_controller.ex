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
  def webhook(conn, _), do: text conn, "I have no response for this"

  def handle_message(conn, params = %{"entry" => entry}) do
      %{"id" => _, "messaging" => messaging} = hd(entry)

      messaging
      |> Enum.each(&Bot.MessageHandler.handle/1)
      # Responding each message

      text conn, "Responding Message"
  end
  def handle_message(conn, params = %{"entry" => entry}) do
      %{"id" => _, "messaging" => messaging} = hd(entry)

      messaging
      |> Enum.each(&Bot.MessageHandler.handle/1)
      # Responding each message

      text conn, "Responding Message"
  end


end
