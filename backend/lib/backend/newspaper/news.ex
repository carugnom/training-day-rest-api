defmodule Backend.Newspaper.News do
  use Ecto.Schema
  import Ecto.Changeset

  schema "news" do
    field :headline, :string
    field :text, :string
    field :publication, :string
    field :date, :utc_datetime_usec

    many_to_many :tags, Backend.Newspaper.Tag, join_through: "news_tags", on_replace: :delete, on_delete: :delete_all
  end

  @doc false
  def changeset(news, attrs) do
    news
    |> cast(attrs, [:headline, :text, :publication, :date])
    |> validate_required([:headline, :text, :publication, :date])
  end
end
