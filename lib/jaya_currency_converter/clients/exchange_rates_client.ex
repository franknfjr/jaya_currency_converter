defmodule JayaCurrencyConverter.ExchangeRatesClient do
  @moduledoc """
  This is the ExchangeRatesClient module that makes the request for the Exchanges Rates API.

  """
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://api.exchangeratesapi.io/v1"
  plug Tesla.Middleware.Headers, [{"User-Agent", "request"}]
  plug Tesla.Middleware.JSON

  @symbols "BRL,USD,EUR,JPY"
  @base "EUR"
  @acess_key Application.compile_env!(:jaya_currency_converter, :exchange)[:acess_key]

  @doc """
  The function `get_all_rates` receives a string with the currency.

    Returns `map` in success or `error` if some thing was wrong.

  ## Examples
      iex> ExchangeRatesClient.get_all_rates "EUR"
      %{"BRL" => 6.418483, "EUR" => 1, "JPY" => 129.340028, "USD" => 1.131029}
      
      iex> ExchangeRatesClient.get_all_rates "FOM"
      {:error, "invalid_base_currency"}
  """
  def get_all_rates(base \\ @base) do
    request =
      ("latest?access_key=" <> @acess_key <> "&base=" <> base <> "&symbols=" <> @symbols)
      |> get()

    case request do
      {:ok, %Tesla.Env{status: 200} = response} ->
        body = response.body

        %{
          "BRL" => body["rates"]["BRL"],
          "EUR" => body["rates"]["EUR"],
          "JPY" => body["rates"]["JPY"],
          "USD" => body["rates"]["USD"]
        }

      {:ok, response} ->
        body = response.body
        msg = body["error"]["code"]

        {:error, msg}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
