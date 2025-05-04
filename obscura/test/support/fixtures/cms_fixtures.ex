defmodule Obscura.CMSFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Obscura.CMS` context.
  """

  @doc """
  Generate a blog.
  """
  def blog_fixture(attrs \\ %{}) do
    {:ok, blog} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Obscura.CMS.create_blog()

    blog
  end

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        description: "some description",
        publish_at: ~N[2025-05-03 18:00:00],
        title: "some title"
      })
      |> Obscura.CMS.create_post()

    post
  end
end
