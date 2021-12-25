defmodule JayaCurrencyConverter.ExchangeTest do
  use JayaCurrencyConverter.DataCase

  alias JayaCurrencyConverter.Core.Exchange

  describe "exchange" do
    test "fetch_rates_from_currency/1 return value of a currency when currency is valid" do
      rates_brl =
        "BRL"
        |> Exchange.fetch_rates_from_currency()

      assert Exchange.fetch_rates_from_currency("BRL") == rates_brl
    end

    test "fetch_rates_from_currency/1 return value of a currency when invalid currency" do
      assert Exchange.fetch_rates_from_currency("FOM") == {:error, "error"}
    end

    test "calculate_amount/3 return a conversion of currency" do
      assert Exchange.calculate_amount("BRL", "USD", 1) == 0.1762
    end
  end
end
