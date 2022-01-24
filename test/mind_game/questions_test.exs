defmodule MindGame.QuestionsTest do
  use MindGame.DataCase

  alias MindGame.Questions

  describe "questions" do
    alias MindGame.Questions.Question

    import MindGame.QuestionsFixtures

    @invalid_attrs %{title: nil}

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Questions.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Questions.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Question{} = question} = Questions.create_question(valid_attrs)
      assert question.title == "some title"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Question{} = question} = Questions.update_question(question, update_attrs)
      assert question.title == "some updated title"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Questions.update_question(question, @invalid_attrs)
      assert question == Questions.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Questions.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Questions.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Questions.change_question(question)
    end
  end

  describe "answer" do
    alias MindGame.Questions.Answer

    import MindGame.QuestionsFixtures

    @invalid_attrs %{title: nil}

    test "list_answer/0 returns all answer" do
      answer = answer_fixture()
      assert Questions.list_answer() == [answer]
    end

    test "list_answer/1 return all answer from for a question" do
      question = question_fixture()
      attrs = %{title: "some_title", question_id: question.id}

      [
        answer1,
        answer2,
        answer3
      ] =
        Enum.map([attrs, attrs, attrs], fn a ->
          {:ok, answer} = Questions.create_answer(a)
          answer
        end)

      assert Questions.list_answer_by_question_id(question.id) == [answer1, answer2, answer3]
    end

    test "get_answer!/1 returns the answer with given id" do
      answer = answer_fixture()
      assert Questions.get_answer!(answer.id) == answer
    end

    test "create_answer/1 with valid data creates a answer" do
      question = question_fixture()
      valid_attrs = %{title: "some title", question_id: question.id}

      assert {:ok, %Answer{} = answer} = Questions.create_answer(valid_attrs)
      assert answer.title == "some title"
    end

    test "create_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_answer(@invalid_attrs)
    end

    test "update_answer/2 with valid data updates the answer" do
      answer = answer_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Answer{} = answer} = Questions.update_answer(answer, update_attrs)
      assert answer.title == "some updated title"
    end

    test "update_answer/2 with invalid data returns error changeset" do
      answer = answer_fixture()
      assert {:error, %Ecto.Changeset{}} = Questions.update_answer(answer, @invalid_attrs)
      assert answer == Questions.get_answer!(answer.id)
    end

    test "delete_answer/1 deletes the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{}} = Questions.delete_answer(answer)
      assert_raise Ecto.NoResultsError, fn -> Questions.get_answer!(answer.id) end
    end

    test "change_answer/1 returns a answer changeset" do
      answer = answer_fixture()
      assert %Ecto.Changeset{} = Questions.change_answer(answer)
    end

  end
end
