defmodule DeliveryApi.OrderView do
  use DeliveryApiWeb, :view

  def render("index.json", %{orders: orders}) do
    %{
      data: render_many(orders, __MODULE__, "order.json")
    }
  end

  def render("order.json", %{order: order}) do
    %{
      id: order.id,
      pickup_address: order.pickup_address,
      receiver_address: order.receiver_address,
      reference_number: order.reference_number,
      weight_pounds: order.weight_pounds,
      client_id: order.client_id,
      inserted_at: order.inserted_at
    }
  end
end
