defmodule JayaCurrencyConverter.Core.Exchange do
  @moduledoc """
  This is the Exchange core module that fetch rates and calculate the amount 

  """
  alias JayaCurrencyConverter.Clients.ExchangeRatesClient

  @doc """
    The function `fetch_rates_from_currency/1` receives a string with the currency.

      Returns a `float` value.
        
        iex>Exchange.fetch_rates_from_currency("BRL")
        6.418483
        
        iex>Exchange.fetch_rates_from_currency("USD")
        1.134039

        iex>Exchange.fetch_rates_from_currency("EUR")
        1

        iex>Exchange.fetch_rates_from_currency("JPY")
        129.741406
  """
  def fetch_rates_from_currency(currency) when currency in ["BRL", "USD", "EUR", "JPY"] do
    {:ok, value_rates} =
      ExchangeRatesClient.get_all_rates()
      |> Map.fetch(currency)

    value_rates
  end

  @doc false
  def fetch_rates_from_currency(_currency), do: {:error, "error"}

  @doc """
      The function `calculate_amount/3` receives a currency of origin, destination currency and amount.

      Returns a `float` value.
        
        iex>Exchange.calculate_amount "BRL", "USD", 1 
        0.1762

        iex>Exchange.calculate_amount "USD", "JPY", 1 
        114.4064
  """
  def calculate_amount(currency_from, currency_to, amount) when amount > 0 do
    cf = fetch_rates_from_currency(currency_from)
    ct = fetch_rates_from_currency(currency_to)

    (amount / cf * ct)
    |> Float.floor(4)
  end

  @doc false
  def calculate_amount(_currency_from, _currency_to, _amount), do: {:error, "error"}
end
