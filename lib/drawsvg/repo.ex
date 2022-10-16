defmodule Drawsvg.Repo do
  use Ecto.Repo,
    otp_app: :drawsvg,
    adapter: Ecto.Adapters.Postgres
end
