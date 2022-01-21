defmodule MindGame.Repo do
  use Ecto.Repo,
    otp_app: :mind_game,
    adapter: Ecto.Adapters.Postgres
end
