defmodule JayaCurrencyConverterWeb.HomeController do
  use JayaCurrencyConverterWeb, :controller

  def home(conn, _params) do
    text(conn, "# JayaCurrencyConverter")
  end
end
