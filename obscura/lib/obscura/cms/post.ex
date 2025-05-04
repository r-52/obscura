defmodule Obscura.CMS.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :description, :string
    field :title, :string
    field :content, :string
    field :publish_at, :naive_datetime
    field :blog_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :content, :publish_at])
    |> validate_required([:title, :description, :content, :publish_at])
  end
end
