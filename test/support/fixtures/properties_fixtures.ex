defmodule Rentify.PropertiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rentify.Properties` context.
  """

  @doc """
  Generate a property.
  """
  def property_fixture(attrs \\ %{}) do
    {:ok, property} =
      attrs
      |> Enum.into(%{
        area: 42,
        bathrooms: 42,
        bedrooms: 42,
        nearby_colleges: "some nearby_colleges",
        nearby_hospitals: "some nearby_hospitals",
        place: "some place"
      })
      |> Rentify.Properties.create_property()

    property
  end
end
