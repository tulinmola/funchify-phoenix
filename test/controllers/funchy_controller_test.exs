defmodule Funchify.FunchyControllerTest do
  use Funchify.ConnCase

  alias Funchify.Funchy
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, funchy_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing funchies"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, funchy_path(conn, :new)
    assert html_response(conn, 200) =~ "New funchy"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, funchy_path(conn, :create), funchy: @valid_attrs
    assert redirected_to(conn) == funchy_path(conn, :index)
    assert Repo.get_by(Funchy, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, funchy_path(conn, :create), funchy: @invalid_attrs
    assert html_response(conn, 200) =~ "New funchy"
  end

  test "shows chosen resource", %{conn: conn} do
    funchy = Repo.insert! %Funchy{}
    conn = get conn, funchy_path(conn, :show, funchy)
    assert html_response(conn, 200) =~ "Show funchy"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, funchy_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    funchy = Repo.insert! %Funchy{}
    conn = get conn, funchy_path(conn, :edit, funchy)
    assert html_response(conn, 200) =~ "Edit funchy"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    funchy = Repo.insert! %Funchy{}
    conn = put conn, funchy_path(conn, :update, funchy), funchy: @valid_attrs
    assert redirected_to(conn) == funchy_path(conn, :show, funchy)
    assert Repo.get_by(Funchy, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    funchy = Repo.insert! %Funchy{}
    conn = put conn, funchy_path(conn, :update, funchy), funchy: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit funchy"
  end

  test "deletes chosen resource", %{conn: conn} do
    funchy = Repo.insert! %Funchy{}
    conn = delete conn, funchy_path(conn, :delete, funchy)
    assert redirected_to(conn) == funchy_path(conn, :index)
    refute Repo.get(Funchy, funchy.id)
  end
end
