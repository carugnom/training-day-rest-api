defmodule Backend.NewspaperTest do
  use Backend.DataCase

  alias Backend.Newspaper

  describe "news" do
    alias Backend.Newspaper.News

    import Backend.NewspaperFixtures

    @invalid_attrs %{date: nil, headline: nil, publication: nil, text: nil}

    test "list_news/0 returns all news" do
      news = news_fixture()
      assert Newspaper.list_news() == [news]
    end

    test "get_news!/1 returns the news with given id" do
      news = news_fixture()
      assert Newspaper.get_news!(news.id) == news
    end

    test "create_news/1 with valid data creates a news" do
      valid_attrs = %{date: ~U[2022-03-19 10:22:00.000000Z], headline: "some headline", publication: "some publication", text: "some text"}

      assert {:ok, %News{} = news} = Newspaper.create_news(valid_attrs)
      assert news.date == ~U[2022-03-19 10:22:00.000000Z]
      assert news.headline == "some headline"
      assert news.publication == "some publication"
      assert news.text == "some text"
    end

    test "create_news/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Newspaper.create_news(@invalid_attrs)
    end

    test "update_news/2 with valid data updates the news" do
      news = news_fixture()
      update_attrs = %{date: ~U[2022-03-20 10:22:00.000000Z], headline: "some updated headline", publication: "some updated publication", text: "some updated text"}

      assert {:ok, %News{} = news} = Newspaper.update_news(news, update_attrs)
      assert news.date == ~U[2022-03-20 10:22:00.000000Z]
      assert news.headline == "some updated headline"
      assert news.publication == "some updated publication"
      assert news.text == "some updated text"
    end

    test "update_news/2 with invalid data returns error changeset" do
      news = news_fixture()
      assert {:error, %Ecto.Changeset{}} = Newspaper.update_news(news, @invalid_attrs)
      assert news == Newspaper.get_news!(news.id)
    end

    test "delete_news/1 deletes the news" do
      news = news_fixture()
      assert {:ok, %News{}} = Newspaper.delete_news(news)
      assert_raise Ecto.NoResultsError, fn -> Newspaper.get_news!(news.id) end
    end

    test "change_news/1 returns a news changeset" do
      news = news_fixture()
      assert %Ecto.Changeset{} = Newspaper.change_news(news)
    end
  end
end
