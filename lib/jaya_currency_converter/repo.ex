defmodule JayaCurrencyConverter.Repo do
  @moduledoc false
  use Ecto.Repo,
    otp_app: :jaya_currency_converter,
    adapter: Ecto.Adapters.Postgres
end
