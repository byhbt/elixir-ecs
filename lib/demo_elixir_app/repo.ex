defmodule DemoElixirApp.Repo do
  use Ecto.Repo,
    otp_app: :demo_elixir_app,
    adapter: Ecto.Adapters.Postgres
end
