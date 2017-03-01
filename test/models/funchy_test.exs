defmodule Funchify.FunchyTest do
  use Funchify.ModelCase

  alias Funchify.Funchy

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Funchy.changeset(%Funchy{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Funchy.changeset(%Funchy{}, @invalid_attrs)
    refute changeset.valid?
  end
end
