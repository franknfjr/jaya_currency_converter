defmodule JayaCurrencyConverter.Accounts.User do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias JayaCurrencyConverter.Exchanges.Transaction

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :name, :string
    has_many(:transactions, Transaction)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> cast_assoc(:transactions)
    |> validate_required([:name])
  end
end
