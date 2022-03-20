defmodule BackendWeb.TagController do
  use BackendWeb, :controller

  alias Backend.Newspaper
  alias Backend.Newspaper.Tag

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    tags = Newspaper.list_tags()
    render(conn, "index.json", tags: tags)
  end

  def create(conn, %{"tag" => tag_params}) do
    with {:ok, %Tag{} = tag} <- Newspaper.create_tag(tag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tag_path(conn, :show, tag))
      |> render("show.json", tag: tag)
    end
  end

  def show(conn, %{"id" => id}) do
    tag = Newspaper.get_tag!(id)
    render(conn, "show.json", tag: tag)
  end

  def update(conn, %{"id" => id, "tag" => tag_params}) do
    tag = Newspaper.get_tag!(id)

    with {:ok, %Tag{} = tag} <- Newspaper.update_tag(tag, tag_params) do
      render(conn, "show.json", tag: tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Newspaper.get_tag!(id)

    with {:ok, %Tag{}} <- Newspaper.delete_tag(tag) do
      send_resp(conn, :no_content, "")
    end
  end
end
