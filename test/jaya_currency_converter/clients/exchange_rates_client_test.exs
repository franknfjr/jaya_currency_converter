defmodule JayaCurrencyConverter.ExchangeRatesClient do
  use JayaCurrencyConverter.DataCase

  alias JayaCurrencyConverter.Clients.ExchangeRatesClient

  describe "request" do
    test "get_all_rates return value of a currency when base currency is valid" do
      assert ExchangeRatesClient.get_all_rates() == %{
               "BRL" => 6.435513,
               "EUR" => 1,
               "JPY" => 129.741406,
               "USD" => 1.134039
             }
    end

    test "get_all_rates return value of a currency when invalid base" do
      assert ExchangeRatesClient.get_all_rates("FOM") == {:error, "invalid_base_currency"}
    end
  end
end
