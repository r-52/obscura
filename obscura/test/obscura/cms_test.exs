defmodule Obscura.CMSTest do
  use Obscura.DataCase

  alias Obscura.CMS

  describe "blogs" do
    alias Obscura.CMS.Blog

    import Obscura.CMSFixtures

    @invalid_attrs %{name: nil}

    test "list_blogs/0 returns all blogs" do
      blog = blog_fixture()
      assert CMS.list_blogs() == [blog]
    end

    test "get_blog!/1 returns the blog with given id" do
      blog = blog_fixture()
      assert CMS.get_blog!(blog.id) == blog
    end

    test "create_blog/1 with valid data creates a blog" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Blog{} = blog} = CMS.create_blog(valid_attrs)
      assert blog.name == "some name"
    end

    test "create_blog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_blog(@invalid_attrs)
    end

    test "update_blog/2 with valid data updates the blog" do
      blog = blog_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Blog{} = blog} = CMS.update_blog(blog, update_attrs)
      assert blog.name == "some updated name"
    end

    test "update_blog/2 with invalid data returns error changeset" do
      blog = blog_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_blog(blog, @invalid_attrs)
      assert blog == CMS.get_blog!(blog.id)
    end

    test "delete_blog/1 deletes the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{}} = CMS.delete_blog(blog)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_blog!(blog.id) end
    end

    test "change_blog/1 returns a blog changeset" do
      blog = blog_fixture()
      assert %Ecto.Changeset{} = CMS.change_blog(blog)
    end
  end

  describe "posts" do
    alias Obscura.CMS.Post

    import Obscura.CMSFixtures

    @invalid_attrs %{description: nil, title: nil, content: nil, publish_at: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert CMS.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert CMS.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{description: "some description", title: "some title", content: "some content", publish_at: ~N[2025-05-03 18:00:00]}

      assert {:ok, %Post{} = post} = CMS.create_post(valid_attrs)
      assert post.description == "some description"
      assert post.title == "some title"
      assert post.content == "some content"
      assert post.publish_at == ~N[2025-05-03 18:00:00]
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", content: "some updated content", publish_at: ~N[2025-05-04 18:00:00]}

      assert {:ok, %Post{} = post} = CMS.update_post(post, update_attrs)
      assert post.description == "some updated description"
      assert post.title == "some updated title"
      assert post.content == "some updated content"
      assert post.publish_at == ~N[2025-05-04 18:00:00]
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_post(post, @invalid_attrs)
      assert post == CMS.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = CMS.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = CMS.change_post(post)
    end
  end
end
