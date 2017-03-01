defmodule Funchify.PageControllerTest do
  use Funchify.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to the clicky-clicky world"
  end
end
