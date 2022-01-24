defmodule MindGame.Repo.Migrations.CreateAnswer do
  use Ecto.Migration

  def change do
    create table(:answer) do
      add :title, :string
      add :question_id, references(:questions, on_delete: :delete_all)

      timestamps()
    end

    create index(:answer, [:question_id])
  end
end
