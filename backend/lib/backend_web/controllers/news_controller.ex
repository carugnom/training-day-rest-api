defmodule BackendWeb.NewsController do
  use BackendWeb, :controller

  alias Backend.Newspaper
  alias Backend.Newspaper.News

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    news = Newspaper.list_news_with_tags()
    render(conn, "index.json", news: news)
  end

  def create(conn, %{"news" => news_params}) do
    with {:ok, %News{} = news} <- Newspaper.create_news(news_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.news_path(conn, :show, news))
      |> render("show.json", news: news)
    end
  end

  def show(conn, %{"id" => id}) do
    news = Newspaper.get_news_with_tags!(id)
    render(conn, "show.json", news: news)
  end

  def show_tags(conn, %{"id" => id}) do
    news = Newspaper.get_news_with_tags!(id)
    render(conn, "show_tags.json", news: news)
  end

  def update(conn, %{"id" => id, "news" => news_params}) do
    news = Newspaper.get_news_with_tags!(id)

    with {:ok, %News{} = news} <- Newspaper.update_news_with_tags(news, news_params) do
      render(conn, "show.json", news: news)
    end
  end

  def delete(conn, %{"id" => id}) do
    news = Newspaper.get_news!(id)

    with {:ok, %News{}} <- Newspaper.delete_news(news) do
      send_resp(conn, :no_content, "")
    end
  end
end
