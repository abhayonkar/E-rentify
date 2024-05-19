defmodule Rentify.Properties.Property do
  use Ecto.Schema
  import Ecto.Changeset

  schema "properties" do
    field :place, :string
    field :area, :integer
    field :bedrooms, :integer
    field :bathrooms, :integer
    field :nearby_hospitals, :string
    field :nearby_colleges, :string
    belongs_to :user, Rentify.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(property, attrs) do
    property
    |> cast(attrs, [:place, :area, :bedrooms, :bathrooms, :nearby_hospitals, :nearby_colleges, :user_id])
    |> validate_required([:place, :area, :bedrooms, :bathrooms, :nearby_hospitals, :nearby_colleges, :user_id])
  end
end
