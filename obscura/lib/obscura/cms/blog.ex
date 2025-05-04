defmodule Obscura.CMS.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
