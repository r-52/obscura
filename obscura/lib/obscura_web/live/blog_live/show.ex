defmodule ObscuraWeb.BlogLive.Show do
  use ObscuraWeb, :live_view

  alias Obscura.CMS

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:blog, CMS.get_blog!(id))}
  end

  defp page_title(:show), do: "Show Blog"
  defp page_title(:edit), do: "Edit Blog"
end
