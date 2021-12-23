defmodule JayaCurrencyConverter.ExchangeRatesClient do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://api.exchangeratesapi.io/v1"
  plug Tesla.Middleware.Headers, [{"User-Agent", "request"}]
  plug Tesla.Middleware.JSON

  @symbols "BRL,USD,EUR,JPY"
  @base "EUR"
  @acess_key Application.compile_env!(:jaya_currency_converter, :exchange)[:acess_key]

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
