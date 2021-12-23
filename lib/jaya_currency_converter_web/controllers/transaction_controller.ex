defmodule JayaCurrencyConverterWeb.TransactionController do
  use JayaCurrencyConverterWeb, :controller

  alias JayaCurrencyConverter.{Accounts, Exchange, Exchanges}
  alias JayaCurrencyConverter.Exchanges.Transaction

  def index(conn, %{"user_id" => user_id}) do
    user = Accounts.get_user!(user_id)
    render(conn, "index.json", transactions: user)
  end

  def index(conn, _params) do
    transactions = Exchanges.list_transactions()
    render(conn, "index.json", transactions: transactions)
  end

  def create(conn, %{"transaction" => transaction_params, "user_id" => user_id}) do
    rate = Exchange.fetch_rates_from_currency(transaction_params["currency_to"])

    amount_to =
      Exchange.calculate_amount(
        transaction_params["currency_from"],
        transaction_params["currency_to"],
        transaction_params["amount"]
      )

    transaction_params = Map.put(transaction_params, "rate", rate)

    with {:ok, user} <- Accounts.get_user!(user_id),
         {:ok, %Transaction{} = transaction} <-
           Exchanges.create_transaction(user, transaction_params) do
      transaction = Map.put(transaction, :amount_to, amount_to)

      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.user_transaction_path(conn, :show, user_id, transaction)
      )
      |> render("show.json", transaction: transaction)
    else
      {:error, _msg} ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "fom"})

      {:error, changeset} ->
        conn
        |> put_status(:not_acceptable)
        |> json(%{error: inspect(changeset.errors)})
    end
  end

  def show(conn, %{"id" => id}) do
    transaction = Exchanges.get_transaction!(id)
    render(conn, "show.json", transaction: transaction)
  end
end
