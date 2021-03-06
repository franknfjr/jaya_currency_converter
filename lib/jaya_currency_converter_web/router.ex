defmodule JayaCurrencyConverterWeb.Router do
  @moduledoc false
  use JayaCurrencyConverterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JayaCurrencyConverterWeb do
    get "/", HomeController, :home
  end

  scope "/api", JayaCurrencyConverterWeb do
    pipe_through :api

    resources "/users", UserController, only: [:index, :show, :create] do
      resources "/transactions", TransactionController, only: [:index, :show, :create]
    end
  end
end
