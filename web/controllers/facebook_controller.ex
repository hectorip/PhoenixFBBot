defmodule Bot.FacebookController do
  use Bot.Web, :controller
  
  @verify_token System.get_env("FACEBOOK_VERIFICATION_TOKEN")

  def webhook(conn, %{
    "hub.verify_token" => verify_token,
    "hub.challenge" => challenge})
  do
    IO.puts(@verify_token)
    IO.puts(verify_token)
    case verify_token do
      @verify_token -> text conn, challenge
      _ ->             text conn, "WRONG"
    end
  end

  def webhook(conn, _), do: text conn, "I have no idea of how to respond this"

  def handle_message(conn, params) do

      # I should send to different datastores the content
      IO.inspect params
      text conn, "Responding Message"
  end

  # def handle_message(conn, _params = %{"entry" => entry}) do
  #     %{"id" => _, "messaging" => messaging} = hd(entry)

  #     messaging
  #     |> Enum.each(&Bot.MessageHandler.handle/1)
  #     text conn, "Responding Message"
  # end

end
