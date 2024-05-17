defmodule TransactionsServer.Models.Entities.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key{:id, :binary_id, autogenerate: true}
  schema "tb_accounts" do
    field :first_name, :string
    field :last_name, :string
    field :cpf, :string
    field :password, :string
    field :balance, Money.Ecto.Amount.Type

    timestamps(type: :utc_datetime)
  end

  def changeset(account, attrs) do
    account
    |> cast(attrs, [:first_name, :last_name, :cpf, :password])
    |> validate_required([:first_name, :last_name, :cpf, :password])
    |> put_balance(attrs)
    |> put_hash_password()
  end

  defp put_balance(changeset, %{"balance" => %{"ammount" => ammount, "currency" => currency}}) do
    put_change(changeset, :balance, Money.new(ammount, currency))
  end

  defp put_hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Argon2.hash_pwd_salt(password))
  end
end
