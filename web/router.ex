defmodule Bot.Router do
  use Bot.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug CORSPlug, [origin: "*"]
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Bot do
    pipe_through :browser # Use the default browser stack

    post "/contact", PageController, :contact
    get "/contact", PageController, :saludo
    get "/", PageController, :index

  end

  # Other scopes may use custom stacks.
  scope "/api", Bot do
    pipe_through :api
    get "/facebook_webhook", FacebookController, :webhook
    post "/facebook_webhook", FacebookController, :handle_message
  end
end
