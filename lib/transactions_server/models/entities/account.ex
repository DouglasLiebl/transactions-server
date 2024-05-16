defmodule TransactionsServer.Models.Entities.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key{:id, :binary_id, autogenerate: true}
  schema "tb_accounts" do
    field :first_name, :string
    field :last_name, :string
    field :cpf, :string
    field :balance, Money.Ecto.Amount.Type

    timestamps(type: :utc_datetime)
  end

  def changeset(_account, _attrs) do

  end

end
