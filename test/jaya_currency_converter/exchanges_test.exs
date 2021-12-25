defmodule JayaCurrencyConverter.ExchangesTest do
  use JayaCurrencyConverter.DataCase

  alias JayaCurrencyConverter.Accounts
  alias JayaCurrencyConverter.Accounts.User
  alias JayaCurrencyConverter.Exchanges
  alias JayaCurrencyConverter.Exchanges.Transaction

  describe "transactions" do
    @valid_attrs %{amount: 10, currency_from: "BRL", currency_to: "USD", rate: 1.24232}

    test "list_transactions/0 return all transactions" do
      {:ok, %User{} = user} = Accounts.create_user(%{name: "Frank"})
      {:ok, transaction} = Exchanges.create_transaction(user, @valid_attrs)
      assert Exchanges.list_transactions() == [transaction]
    end

    test "list_transactions/1 return all transactions when passing an user" do
      {:ok, %User{} = user} = Accounts.create_user(%{name: "Frank"})
      {:ok, transaction} = Exchanges.create_transaction(user, @valid_attrs)
      assert Exchanges.list_transactions(user) == [transaction]
    end

    test "create_transaction/2 return a transaction" do
      {:ok, %User{} = user} = Accounts.create_user(%{name: "Frank"})
      {:ok, transaction} = Exchanges.create_transaction(user, @valid_attrs)

      assert transaction.user_id == user.id
      assert transaction.amount == Decimal.new(@valid_attrs.amount)
    end

    test "get_transaction!/1 return a transaction specific of one user" do
      {:ok, %User{} = user} = Accounts.create_user(%{name: "Frank"})
      {:ok, transaction} = Exchanges.create_transaction(user, @valid_attrs)
      assert Exchanges.get_transaction!(transaction.id) == transaction
    end
  end
end
