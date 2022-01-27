defmodule MindGameWeb.QuestionsLive do
  use Phoenix.LiveView
  alias MindGame.Questions
  alias MindGameWeb.Router.Helpers, as: Routes
  import Phoenix.HTML.Form

  def mount(_params, _session, socket) do
    {:ok, fetch_questions(socket)}
  end

  def handle_event(
        "save",
        %{
          "question" => question_payload,
          "answer_1" => answer_1,
          "answer_2" => answer_2,
          "answer_3" => answer_3,
          "answer_4" => answer_4,
          "answer_5" => answer_5
        },
        socket
      ) do
    with {:ok, question} <- Questions.create_question(question_payload),
         {:ok, _} <- Questions.create_answer(%{answer_1 | "question_id" => question.id}),
         {:ok, _} <- Questions.create_answer(%{answer_2 | "question_id" => question.id}),
         {:ok, _} <- Questions.create_answer(%{answer_3 | "question_id" => question.id}),
         {:ok, _} <- Questions.create_answer(%{answer_4 | "question_id" => question.id}),
         {:ok, _} <- Questions.create_answer(%{answer_5 | "question_id" => question.id}) do
      {:noreply, fetch_questions(socket)}
    else
      _ -> {:error, socket}
    end
  end

  def render(assigns) do
    ~H"""
    This is shit yoyo!
    <%= for question <- @questions do %>
      <%= live_patch question.title, to: Routes.live_path(@socket, MindGameWeb.QuestionLive, question.id) %>
    <% end %>
    <form phx-submit="save">
      <div>
        <%= text_input :question, :title, placeholder: "What is your question ?", autocomplete: "off" %>
        <%= text_input :answer_1, :title, placeholder: "Answer", autocomplete: "off" %>
        <%= text_input :answer_2, :title, placeholder: "Answer", autocomplete: "off" %>
        <%= text_input :answer_3, :title, placeholder: "Answer", autocomplete: "off" %>
        <%= text_input :answer_4, :title, placeholder: "Answer", autocomplete: "off" %>
        <%= text_input :answer_5, :title, placeholder: "Answer", autocomplete: "off" %>
      </div>
    </form>
    """
  end

  defp fetch_questions(socket) do
    socket
    |> assign(questions: Questions.list_questions())
  end
end

defmodule MindGameWeb.QuestionLive do
  use Phoenix.LiveView
  alias MindGame.Questions

  def mount(params, _session, socket) do
    IO.inspect(params)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h2>Hello question tktk</h2>
    """
  end
end
