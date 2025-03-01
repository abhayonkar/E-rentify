defmodule Rentify.PropertiesTest do
  use Rentify.DataCase

  alias Rentify.Properties

  describe "properties" do
    alias Rentify.Properties.Property

    import Rentify.PropertiesFixtures

    @invalid_attrs %{area: nil, bathrooms: nil, bedrooms: nil, nearby_colleges: nil, nearby_hospitals: nil, place: nil}

    test "list_properties/0 returns all properties" do
      property = property_fixture()
      assert Properties.list_properties() == [property]
    end

    test "get_property!/1 returns the property with given id" do
      property = property_fixture()
      assert Properties.get_property!(property.id) == property
    end

    test "create_property/1 with valid data creates a property" do
      valid_attrs = %{area: 42, bathrooms: 42, bedrooms: 42, nearby_colleges: "some nearby_colleges", nearby_hospitals: "some nearby_hospitals", place: "some place"}

      assert {:ok, %Property{} = property} = Properties.create_property(valid_attrs)
      assert property.area == 42
      assert property.bathrooms == 42
      assert property.bedrooms == 42
      assert property.nearby_colleges == "some nearby_colleges"
      assert property.nearby_hospitals == "some nearby_hospitals"
      assert property.place == "some place"
    end

    test "create_property/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Properties.create_property(@invalid_attrs)
    end

    test "update_property/2 with valid data updates the property" do
      property = property_fixture()
      update_attrs = %{area: 43, bathrooms: 43, bedrooms: 43, nearby_colleges: "some updated nearby_colleges", nearby_hospitals: "some updated nearby_hospitals", place: "some updated place"}

      assert {:ok, %Property{} = property} = Properties.update_property(property, update_attrs)
      assert property.area == 43
      assert property.bathrooms == 43
      assert property.bedrooms == 43
      assert property.nearby_colleges == "some updated nearby_colleges"
      assert property.nearby_hospitals == "some updated nearby_hospitals"
      assert property.place == "some updated place"
    end

    test "update_property/2 with invalid data returns error changeset" do
      property = property_fixture()
      assert {:error, %Ecto.Changeset{}} = Properties.update_property(property, @invalid_attrs)
      assert property == Properties.get_property!(property.id)
    end

    test "delete_property/1 deletes the property" do
      property = property_fixture()
      assert {:ok, %Property{}} = Properties.delete_property(property)
      assert_raise Ecto.NoResultsError, fn -> Properties.get_property!(property.id) end
    end

    test "change_property/1 returns a property changeset" do
      property = property_fixture()
      assert %Ecto.Changeset{} = Properties.change_property(property)
    end
  end
end
