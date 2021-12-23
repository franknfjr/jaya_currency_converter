defmodule JayaCurrencyConverter.Exchanges.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  alias JayaCurrencyConverter.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "transactions" do
    field :amount, :decimal
    field :amount_to, :decimal, virtual: true
    field :currency_from, :string
    field :currency_to, :string
    field :rate, :decimal
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:currency_from, :amount, :currency_to, :rate, :user_id])
    |> foreign_key_constraint(:user_id)
    |> validate_required([:currency_from, :amount, :currency_to, :rate, :user_id],
      message: "field required"
    )
    |> validate_number(:amount, greater_than: 0)
  end
end
