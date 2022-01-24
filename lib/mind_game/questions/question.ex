defmodule MindGame.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :title, :string
    has_many :answers, MindGame.Questions.Answer

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
