defmodule RentifyWeb.BuyerController do
  use RentifyWeb, :controller

  alias Rentify.Properties

  def index(conn, _params) do
    properties = Properties.list_properties()
    render(conn, "index.html", properties: properties)
  end

  def show(conn, %{"id" => id}) do
    property = Properties.get_property!(id)
    render(conn, "show.html", property: property)
  end

  def interested(conn, %{"id" => id}) do
    property = Properties.get_property!(id)
    seller = property.user
    # Send email to seller and buyer with details
    # Assuming we have a Mailer module set up

    # Send email logic...

    conn
    |> put_flash(:info, "Seller details sent to your email.")
    |> redirect(to: Routes.property_path(conn, :show, property))
  end
end
