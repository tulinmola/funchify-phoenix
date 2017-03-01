defmodule Funchify.Repo.Migrations.CreateFunchy do
  use Ecto.Migration

  def change do
    create table(:funchies) do
      add :name, :string
      add :description, :text

      timestamps()
    end

  end
end
