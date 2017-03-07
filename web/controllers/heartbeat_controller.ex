defmodule Funchify.HeartbeatController do
  use Funchify.Web, :controller

  alias Funchify.Heartbeat

  def index(conn, _params) do
    render(conn, "index.json")
  end
end
