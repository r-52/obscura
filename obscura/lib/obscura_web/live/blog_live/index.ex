defmodule ObscuraWeb.BlogLive.Index do
  use ObscuraWeb, :live_view

  alias Obscura.CMS
  alias Obscura.CMS.Blog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :blogs, CMS.list_blogs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Blog")
    |> assign(:blog, CMS.get_blog!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Blog")
    |> assign(:blog, %Blog{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Blogs")
    |> assign(:blog, nil)
  end

  @impl true
  def handle_info({ObscuraWeb.BlogLive.FormComponent, {:saved, blog}}, socket) do
    {:noreply, stream_insert(socket, :blogs, blog)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    blog = CMS.get_blog!(id)
    {:ok, _} = CMS.delete_blog(blog)

    {:noreply, stream_delete(socket, :blogs, blog)}
  end
end
