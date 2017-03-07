defmodule Funchify.HeartbeatControllerTest do
  use Funchify.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "gets name and version", %{conn: conn} do
    conn = get conn, heartbeat_path(conn, :index)
    assert json_response(conn, 200) == %{
      "name" => Mix.Project.config[:app] |> Atom.to_string,
      "version" => Mix.Project.config[:version]
    }
  end
end
