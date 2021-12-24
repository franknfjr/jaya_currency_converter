defmodule JayaCurrencyConverter.Exchange do
  @moduledoc """
  This is the Exchange core module that fetch rates and calculate the amount 

  """
  alias JayaCurrencyConverter.ExchangeRatesClient

  @doc """
    The function `fetch_rates_from_currency/1` receives a string with the currency.

      Returns a `float` value.
        
        iex>Exchange.fetch_rates_from_currency("BRL")
        6.418483
  """
  def fetch_rates_from_currency(currency) do
    {:ok, value_rates} =
      ExchangeRatesClient.get_all_rates()
      |> Map.fetch(currency)

    value_rates
  end

  @doc """
      The function `calculate_amount/3` receives a currency of origin, destination currency and amount.

      Returns a `float` value.
        
        iex>Exchange.calculate_amount "BRL", "USD", 1 
        0.1762
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
