defmodule Obscura.Repo do
  use Ecto.Repo,
    otp_app: :obscura,
    adapter: Ecto.Adapters.SQLite3
end
