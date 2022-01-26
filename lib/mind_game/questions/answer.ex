defmodule MindGame.Questions.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answer" do
    field :title, :string
    field :vote_count, :integer, default: 0
    belongs_to :question, MindGame.Questions.Question

    timestamps()
  end

  @doc false
  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:title, :question_id, :vote_count])
    |> validate_required([:title, :question_id])
    |> foreign_key_constraint(:question_id)
    |> assoc_constraint(:question)
  end
end
