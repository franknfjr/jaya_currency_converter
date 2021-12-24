defmodule JayaCurrencyConverterWeb.TransactionView do
  @moduledoc false
  use JayaCurrencyConverterWeb, :view

  alias JayaCurrencyConverterWeb.TransactionView

  def render("index.json", %{transactions: transactions}) do
    render_many(transactions, TransactionView, "transaction.json")
  end

  def render("show.json", %{transaction: transaction}) do
    render_one(transaction, TransactionView, "transaction.json")
  end

  def render("transaction.json", %{transaction: transaction}) do
    %{
      id: transaction.id,
      currency_from: transaction.currency_from,
      currency_to: transaction.currency_to,
      amount: transaction.amount,
      rate: transaction.rate,
      user_id: transaction.user_id,
      amount_to: transaction.amount_to,
      created_at: transaction.inserted_at
    }
  end
end
