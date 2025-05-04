defmodule Obscura.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :description, :string
      add :content, :string
      add :publish_at, :naive_datetime
      add :blog_id, references(:blog, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:posts, [:blog_id])
  end
end
