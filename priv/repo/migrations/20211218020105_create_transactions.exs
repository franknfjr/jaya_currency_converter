defmodule JayaCurrencyConverter.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :currency_from, :string
      add :amount, :decimal
      add :currency_to, :string
      add :rate, :decimal

      add :user_id, references(:users, type: :binary_id, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:transactions, [:user_id])
  end
end
