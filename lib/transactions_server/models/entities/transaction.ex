defmodule TransactionsServer.Models.Entities.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key{:id, :binary_id, autogenerate: true}
  schema "tb_transactions" do
    field :sender_account_id, :binary_id
    field :receiver_account_id, :binary_id
    field :value, :decimal

    timestamps(type: :utc_datetime)
  end

  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:sender_account_id, :receiver_account_id, :value])
  end


end
