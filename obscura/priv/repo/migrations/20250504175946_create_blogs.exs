defmodule Obscura.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
