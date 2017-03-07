defmodule Funchify.HeartbeatController do
  use Funchify.Web, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end
end
