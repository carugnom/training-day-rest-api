defmodule BackendWeb.TagView do
  use BackendWeb, :view
  alias BackendWeb.TagView

  def render("index.json", %{tags: tags}) do
    %{tags: render_many(tags, TagView, "tag.json")}
  end

  def render("show.json", %{tag: tag}) do
    %{tags: render_one(tag, TagView, "tag.json")}
  end

  def render("tag.json", %{tag: tag}) do
    %{
      id: tag.id,
      name: tag.name
    }
  end
end
