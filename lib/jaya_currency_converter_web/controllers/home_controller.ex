defmodule JayaCurrencyConverterWeb.HomeController do
  @moduledoc false
  use JayaCurrencyConverterWeb, :controller

  def home(conn, _params) do
    text(conn, "# JayaCurrencyConverter")
  end
end
