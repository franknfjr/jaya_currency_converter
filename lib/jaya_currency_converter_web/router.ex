defmodule JayaCurrencyConverterWeb.Router do
  use JayaCurrencyConverterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JayaCurrencyConverterWeb do
    get "/", HomeController, :home
  end

  scope "/api", JayaCurrencyConverterWeb do
    pipe_through :api
  end
end
