defmodule ObscuraWeb.PostLive.Index do
  use ObscuraWeb, :live_view

  alias Obscura.CMS
  alias Obscura.CMS.Post

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :posts, CMS.list_posts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, CMS.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Posts")
    |> assign(:post, nil)
  end

  @impl true
  def handle_info({ObscuraWeb.PostLive.FormComponent, {:saved, post}}, socket) do
    {:noreply, stream_insert(socket, :posts, post)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = CMS.get_post!(id)
    {:ok, _} = CMS.delete_post(post)

    {:noreply, stream_delete(socket, :posts, post)}
  end
end
