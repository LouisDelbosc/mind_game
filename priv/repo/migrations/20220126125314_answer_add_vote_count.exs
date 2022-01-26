defmodule MindGame.Repo.Migrations.AnswerAddVoteCount do
  use Ecto.Migration

  def change do
    alter table(:answer) do
      add :vote_count, :integer, default: 0
    end
  end
end
