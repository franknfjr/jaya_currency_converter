defmodule JayaCurrencyConverter.Exchanges do
  @moduledoc """
  The Exchanges context.
  """

  import Ecto.Query, warn: false
  alias JayaCurrencyConverter.Repo

  alias JayaCurrencyConverter.Accounts.User
  alias JayaCurrencyConverter.Exchanges.Transaction

  @doc """
  Returns the list of transactions.

  ## Examples

      iex> list_transactions()
      [%Transaction{}, ...]

  """
  def list_transactions(user \\ nil) do
    if user do
      query = from t in Transaction, where: t.user_id == ^user.id
      Repo.all(query)
    else
      Repo.all(Transaction)
    end
  end

  @doc """
  Gets a single transaction.

  Raises `Ecto.NoResultsError` if the Transaction does not exist.

  ## Examples

      iex> get_transaction!(123)
      %Transaction{}

      iex> get_transaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transaction!(id), do: Repo.get!(Transaction, id)

  @doc """
  Creates a transaction.

  ## Examples

      iex> create_transaction(%{field: value})
      {:ok, %Transaction{}}

      iex> create_transaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transaction(%User{} = user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:transactions, attrs)
    |> Transaction.changeset(attrs)
    |> Repo.insert()
  end
end
