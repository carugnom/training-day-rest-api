defmodule Backend.Newspaper.NewsTag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "news_tags" do

    field :news_id, :id
    field :tag_id, :id

    timestamps()
  end

  @doc false
  def changeset(news_tag, attrs) do
    news_tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
