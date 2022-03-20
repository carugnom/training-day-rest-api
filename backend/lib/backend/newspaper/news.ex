defmodule Backend.Newspaper.News do
  use Ecto.Schema
  import Ecto.Changeset

  schema "news" do
    field :date, :utc_datetime_usec
    field :headline, :string
    field :publication, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(news, attrs) do
    news
    |> cast(attrs, [:headline, :text, :publication, :date])
    |> validate_required([:headline, :text, :publication, :date])
  end
end
