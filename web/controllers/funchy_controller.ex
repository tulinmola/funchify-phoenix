defmodule Funchify.FunchyController do
  use Funchify.Web, :controller

  alias Funchify.Funchy

  def index(conn, _params) do
    funchies = Repo.all(Funchy)
    render(conn, "index.html", funchies: funchies)
  end

  def new(conn, _params) do
    changeset = Funchy.changeset(%Funchy{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"funchy" => funchy_params}) do
    changeset = Funchy.changeset(%Funchy{}, funchy_params)

    case Repo.insert(changeset) do
      {:ok, _funchy} ->
        conn
        |> put_flash(:info, "Funchy created successfully.")
        |> redirect(to: funchy_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    funchy = Repo.get!(Funchy, id)
    render(conn, "show.html", funchy: funchy)
  end

  def edit(conn, %{"id" => id}) do
    funchy = Repo.get!(Funchy, id)
    changeset = Funchy.changeset(funchy)
    render(conn, "edit.html", funchy: funchy, changeset: changeset)
  end

  def update(conn, %{"id" => id, "funchy" => funchy_params}) do
    funchy = Repo.get!(Funchy, id)
    changeset = Funchy.changeset(funchy, funchy_params)

    case Repo.update(changeset) do
      {:ok, funchy} ->
        conn
        |> put_flash(:info, "Funchy updated successfully.")
        |> redirect(to: funchy_path(conn, :show, funchy))
      {:error, changeset} ->
        render(conn, "edit.html", funchy: funchy, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    funchy = Repo.get!(Funchy, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(funchy)

    conn
    |> put_flash(:info, "Funchy deleted successfully.")
    |> redirect(to: funchy_path(conn, :index))
  end
end
