defmodule Funchify.HeartbeatView do
  use Funchify.Web, :view

  @name Mix.Project.config[:app]
  @version Mix.Project.config[:version]

  def render("index.json", _opts) do
    %{name: @name, version: @version}
  end
end
