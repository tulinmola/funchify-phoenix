defmodule Funchify.PageController do
  use Funchify.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
