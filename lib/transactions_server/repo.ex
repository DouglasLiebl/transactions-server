defmodule TransactionsServer.Repo do
  use Ecto.Repo,
    otp_app: :transactions_server,
    adapter: Ecto.Adapters.Postgres
end
