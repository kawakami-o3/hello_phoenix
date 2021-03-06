defmodule HelloPhoenix.CardController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Card

  plug :scrub_params, "card" when action in [:create, :update]

  def index(conn, _params) do
    IO.puts "==> index"
    cards = Repo.all(Card)
    render(conn, "index.html", cards: cards)
  end

  def new(conn, _params) do
    IO.puts "==> new"
    changeset = Card.changeset(%Card{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"card" => card_params}) do
    IO.puts "==> create" + card_params
    changeset = Card.changeset(%Card{}, card_params)

    case Repo.insert(changeset) do
      {:ok, _card} ->
        conn
        |> put_flash(:info, "Card created successfully.")
        |> redirect(to: card_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    IO.puts "==> show"
    card = Repo.get!(Card, id)
    render(conn, "show.html", card: card)
  end

  def edit(conn, %{"id" => id}) do
    IO.puts "==> edit"
    card = Repo.get!(Card, id)
    changeset = Card.changeset(card)
    render(conn, "edit.html", card: card, changeset: changeset)
  end

  def update(conn, %{"id" => id, "card" => card_params}) do
    IO.puts "==> update"
    card = Repo.get!(Card, id)
    changeset = Card.changeset(card, card_params)

    case Repo.update(changeset) do
      {:ok, card} ->
        conn
        |> put_flash(:info, "Card updated successfully.")
        |> redirect(to: card_path(conn, :show, card))
      {:error, changeset} ->
        render(conn, "edit.html", card: card, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    IO.puts "==> delete"
    card = Repo.get!(Card, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(card)

    conn
    |> put_flash(:info, "Card deleted successfully.")
    |> redirect(to: card_path(conn, :index))
  end
end
