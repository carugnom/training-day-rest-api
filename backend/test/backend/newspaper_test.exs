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

  describe "tags" do
    alias Backend.Newspaper.Tag

    import Backend.NewspaperFixtures

    @invalid_attrs %{name: nil}

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Newspaper.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Newspaper.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Tag{} = tag} = Newspaper.create_tag(valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Newspaper.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Tag{} = tag} = Newspaper.update_tag(tag, update_attrs)
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Newspaper.update_tag(tag, @invalid_attrs)
      assert tag == Newspaper.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Newspaper.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Newspaper.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Newspaper.change_tag(tag)
    end
  end
end
