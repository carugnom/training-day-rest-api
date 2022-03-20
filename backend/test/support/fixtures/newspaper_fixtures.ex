defmodule Backend.NewspaperFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.Newspaper` context.
  """

  @doc """
  Generate a news.
  """
  def news_fixture(attrs \\ %{}) do
    {:ok, news} =
      attrs
      |> Enum.into(%{
        date: ~U[2022-03-19 10:22:00.000000Z],
        headline: "some headline",
        publication: "some publication",
        text: "some text"
      })
      |> Backend.Newspaper.create_news()

    news
  end
end
