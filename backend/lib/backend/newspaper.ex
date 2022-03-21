defmodule Backend.Newspaper do
  @moduledoc """
  The Newspaper context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Newspaper.{News, Tag}

  @doc """
  Returns the list of news.

  ## Examples

      iex> list_news()
      [%News{}, ...]

  """
  def list_news do
    Repo.all(News)
  end

  def list_news_with_tags do
    News |> preload(:tags) |> Repo.all()
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

  def get_news_with_tags!(id), do: News |> preload(:tags) |> Repo.get!(id)

  @doc """
  Creates a news.

  ## Examples

      iex> create_news(%{field: value})
      {:ok, %News{}}

      iex> create_news(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_news(attrs \\ %{}) do
    tags =
      attrs["tags"]
      |> Enum.map(fn tag -> String.trim(tag) end)
      |> Enum.map(
            fn tag_name -> {:ok, tag} = create_tag_if_not_exist(%{name: tag_name})
            tag 
          end
          )

    %News{}
    |> News.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:tags, tags)
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

  def update_news_with_tags(%News{} = news, attrs) do
    if is_nil(attrs["tags"]) do
      update_news(news, attrs)
    else
      tags =
        attrs["tags"]
        |> Enum.map(fn tag -> String.trim(tag) end)
        |> Enum.map(
              fn tag_name -> {:ok, tag} = create_tag_if_not_exist(%{name: tag_name})
              tag 
            end
            )

      news
      |> News.changeset(attrs)
      |> Ecto.Changeset.put_assoc(:tags, tags)
      |> Repo.update()
    end
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

  alias Backend.Newspaper.Tag

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  def create_tag_if_not_exist(attrs) do
    tag = Repo.get_by(Tag, name: attrs[:name] || attrs["name"])

    if tag do
      {:ok, tag}
    else
      create_tag(attrs)
    end
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{data: %Tag{}}

  """
  def change_tag(%Tag{} = tag, attrs \\ %{}) do
    Tag.changeset(tag, attrs)
  end
end
