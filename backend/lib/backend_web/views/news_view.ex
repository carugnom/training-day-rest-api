defmodule BackendWeb.NewsView do
  use BackendWeb, :view
  alias BackendWeb.NewsView

  def render("index.json", %{news: news}) do
    %{news: render_many(news, NewsView, "news.json")}
  end

  def render("show.json", %{news: news}) do
    %{news: render_one(news, NewsView, "news.json")}
  end

  def render("news.json", %{news: news}) do
    %{
      id: news.id,
      headline: news.headline,
      text: news.text,
      publication: news.publication,
      date: news.date
    }
  end
end
