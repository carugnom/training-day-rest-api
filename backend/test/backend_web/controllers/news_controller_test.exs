defmodule BackendWeb.NewsControllerTest do
  use BackendWeb.ConnCase

  import Backend.NewspaperFixtures

  alias Backend.Newspaper.News

  @create_attrs %{
    date: ~U[2022-03-19 10:22:00.000000Z],
    headline: "some headline",
    publication: "some publication",
    text: "some text"
  }
  @update_attrs %{
    date: ~U[2022-03-20 10:22:00.000000Z],
    headline: "some updated headline",
    publication: "some updated publication",
    text: "some updated text"
  }
  @invalid_attrs %{date: nil, headline: nil, publication: nil, text: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all news", %{conn: conn} do
      conn = get(conn, Routes.news_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create news" do
    test "renders news when data is valid", %{conn: conn} do
      conn = post(conn, Routes.news_path(conn, :create), news: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.news_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "date" => "2022-03-19T10:22:00.000000Z",
               "headline" => "some headline",
               "publication" => "some publication",
               "text" => "some text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.news_path(conn, :create), news: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update news" do
    setup [:create_news]

    test "renders news when data is valid", %{conn: conn, news: %News{id: id} = news} do
      conn = put(conn, Routes.news_path(conn, :update, news), news: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.news_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "date" => "2022-03-20T10:22:00.000000Z",
               "headline" => "some updated headline",
               "publication" => "some updated publication",
               "text" => "some updated text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, news: news} do
      conn = put(conn, Routes.news_path(conn, :update, news), news: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete news" do
    setup [:create_news]

    test "deletes chosen news", %{conn: conn, news: news} do
      conn = delete(conn, Routes.news_path(conn, :delete, news))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.news_path(conn, :show, news))
      end
    end
  end

  defp create_news(_) do
    news = news_fixture()
    %{news: news}
  end
end
