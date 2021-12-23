defmodule JayaCurrencyConverter.Exchange do
  alias JayaCurrencyConverter.ExchangeRatesClient

  def fetch_rates_from_currency(currency) do
    {:ok, value_rates} =
      ExchangeRatesClient.get_all_rates()
      |> Map.fetch(currency)

    value_rates
  end

  def calculate_amount(currency_from, currency_to, amount) when amount > 0 do
    cf = fetch_rates_from_currency(currency_from)
    ct = fetch_rates_from_currency(currency_to)

    (amount / cf * ct)
    |> Float.floor(4)
  end

  def calculate_amount(_currency_from, _currency_to, _amount), do: {:error, "error"}
end
