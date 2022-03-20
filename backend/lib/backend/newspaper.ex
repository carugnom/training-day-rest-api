defmodule Backend.Newspaper do
  @moduledoc """
  The Newspaper context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Newspaper.News

  @doc """
  Returns the list of news.

  ## Examples

      iex> list_news()
      [%News{}, ...]

  """
  def list_news do
    Repo.all(News)
  end

  @doc """
  Gets a single news.

  Raises `Ecto.NoResultsError` if the News does not exist.

  ## Examples

      iex> get_news!(123)
      %News{}

      iex> get_news!(456)
      ** (Ecto.NoResultsError)

  """
  def get_news!(id), do: Repo.get!(News, id)

  @doc """
  Creates a news.

  ## Examples

      iex> create_news(%{field: value})
      {:ok, %News{}}

      iex> create_news(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_news(attrs \\ %{}) do
    %News{}
    |> News.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a news.

  ## Examples

      iex> update_news(news, %{field: new_value})
      {:ok, %News{}}

      iex> update_news(news, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_news(%News{} = news, attrs) do
    news
    |> News.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a news.

  ## Examples

      iex> delete_news(news)
      {:ok, %News{}}

      iex> delete_news(news)
      {:error, %Ecto.Changeset{}}

  """
  def delete_news(%News{} = news) do
    Repo.delete(news)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking news changes.

  ## Examples

      iex> change_news(news)
      %Ecto.Changeset{data: %News{}}

  """
  def change_news(%News{} = news, attrs \\ %{}) do
    News.changeset(news, attrs)
  end
end
