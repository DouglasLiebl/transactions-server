defmodule :"Elixir.TransactionsServer.Repo.Migrations.Create tbAccounts" do
  use Ecto.Migration

  def change do
    execute """
    CREATE TYPE public.money_with_currency AS (amount INTEGER, currency VARCHAR(3))
    """

    create table(:tb_accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :cpf, :string
      add :password, :string
      add :balance, :money_with_currency

      timestamps(type: :utc_datetime)
    end

    create unique_index(:tb_accounts, [:cpf])
  end
end
