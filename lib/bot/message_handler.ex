defmodule Bot.MessageHandler do
  require Logger
  @fb_page_access_token System.get_env("FB_PAGE_ACCESS_TOKEN")
  @fb_page "https://graph.facebook.com/v2.6/me/messages?access_token="
  IO.puts @fb_page_access_token

  def handle(msg = %{"message" => %{"text" => _text}}) do
    buttons = [
      %{type: "web_url", title: "hectoripm.com", url: "http://hectoripm.com"},
      %{type: "postback", title: "About Swiftly", payload: "swiftly_info"}
    ]
    IO.inspect msg
    send_button_message msg["sender"]["id"], "Escoge una de las siguientes opciones", buttons
  end
  # postbacks messages carry the "postback" parameter with a pyload
  def handle(msg = %{"postback" => %{"payload"=> "PB_NAME"}}) do
    send_text_message msg["sender"]["id"], "Me llamo Héctor Patricio"
  end

   def handle(msg = %{"postback" => %{"payload"=> "swiftly_info"}}) do
    send_text_message msg["sender"]["id"], "Swiftly is great."
  end

  def handle(msg) do
    Logger.info "I don't know how to handle this message: \n#{inspect msg}"
  end

  def send_button_message(recipient, message, buttons) do
    payload = %{
      recipient: %{id: recipient},
      message: %{
        attachment: %{
          type: "template",
          payload: %{
            template_type: "button",
            text: message,
            buttons: buttons
          }
        }
      }
    }
    send_message payload
  end

  def send_text_message(recipient, message) do
    payload = %{
      recipient: %{id: recipient},
      message: %{
        text: message
      }
    }
    send_message payload
  end

  def send_message(message) do
    IO.puts "Sending message :o"
    url = "https://graph.facebook.com/v2.6/me/messages?access_token=" <> @fb_page_access_token
    IO.inspect url
    headers = [{"Content-type", "application/json"}]
    HTTPoison.post! url, Poison.encode!(message), headers
  end
end
