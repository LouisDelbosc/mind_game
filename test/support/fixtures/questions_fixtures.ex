defmodule MindGame.QuestionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MindGame.Questions` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        title: "some title question"
      })
      |> MindGame.Questions.create_question()

    question
  end

  @doc """
  Generate a answer.
  """
  def answer_fixture(attrs \\ %{}) do
    question_id =
      case Map.get(attrs, :question_id) do
        nil -> question_fixture().id
        _ -> Map.get(attrs, :question_id)
      end

    {:ok, answer} =
      attrs
      |> Enum.into(%{
        title: "some title answer",
        question_id: question_id
      })
      |> MindGame.Questions.create_answer()

    answer
  end
end
