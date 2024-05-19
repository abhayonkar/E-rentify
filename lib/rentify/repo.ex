defmodule Rentify.Repo do
  use Ecto.Repo,
    otp_app: :rentify,
    adapter: Ecto.Adapters.Postgres
end
