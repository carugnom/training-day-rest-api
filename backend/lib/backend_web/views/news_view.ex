defmodule BackendWeb.NewsView do
  use BackendWeb, :view
  alias BackendWeb.{NewsView, TagView}

  def render("index.json", %{news: news}) do
    %{news: render_many(news, NewsView, "news.json")}
  end

  def render("show.json", %{news: news}) do
    %{news: render_one(news, NewsView, "news.json")}
  end

  def render("show_tags.json", %{news: news}) do
    %{tags: render_many(news.tags, TagView, "tag.json")}
  end

  def render("news.json", %{news: news}) do
    %{
      id: news.id,
      headline: news.headline,
      text: news.text,
      publication: news.publication,
      date: news.date,
      tags: render_many(news.tags, TagView, "tag.json")
    }
  end
end
