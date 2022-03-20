defmodule Backend.Newspaper.NewsTag do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "news_tags" do
    field :news_id, :id, primary_key: true
    field :tag_id, :id, primary_key: true
  end

  @doc false
  def changeset(news_tag, attrs) do
    news_tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
