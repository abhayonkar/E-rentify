defmodule RentifyWeb.PropertyController do
  use RentifyWeb, :controller

  alias Rentify.Properties
  alias Rentify.Properties.Property

  plug :load_and_authorize_resource, model: Property, non_auth: :index when action in [:edit, :update, :delete]

  def index(conn, _params) do
    properties = Properties.list_properties()
    render(conn, "index.html", properties: properties)
  end

  def new(conn, _params) do
    changeset = Properties.change_property(%Property{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"property" => property_params}) do
    case Properties.create_property(property_params) do
      {:ok, property} ->
        conn
        |> put_flash(:info, "Property created successfully.")
        |> redirect(to: Routes.property_path(conn, :show, property))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    property = Properties.get_property!(id)
    render(conn, "show.html", property: property)
  end

  def edit(conn, %{"id" => id}) do
    property = Properties.get_property!(id)
    changeset = Properties.change_property(property)
    render(conn, "edit.html", property: property, changeset: changeset)
  end

  def update(conn, %{"id" => id, "property" => property_params}) do
    property = Properties.get_property!(id)

    case Properties.update_property(property, property_params) do
      {:ok, property} ->
        conn
        |> put_flash(:info, "Property updated successfully.")
        |> redirect(to: Routes.property_path(conn, :show, property))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", property: property, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    property = Properties.get_property!(id)
    {:ok, _property} = Properties.delete_property(property)

    conn
    |> put_flash(:info, "Property deleted successfully.")
    |> redirect(to: Routes.property_path(conn, :index))
  end
end
