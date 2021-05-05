defmodule DeliveryApi.OrderControllerTest do
  use DeliveryApiWeb.ConnCase
  use ExUnit.Case, async: false

  setup do
    client = insert(:client)
    order = insert(:order, client: client)

    {:ok, client: client, order: order}
  end

  describe "GET /orders" do
    test "list empty data when no orders matches with our criteria", %{conn: conn} do
      json_resp =
        get(conn, Routes.order_path(conn, :index))
        |> json_response(200)

      assert json_resp["data"] == []
    end

    test "Return 3 orders which are created yesterday", %{conn: conn, client: client} do
      insert(:order, client_id: client.id, inserted_at: ~U[2021-05-05 18:30:35Z])
      insert(:order, client_id: client.id, inserted_at: ~U[2021-05-05 20:30:35Z])
      insert(:order, client_id: client.id, inserted_at: ~U[2021-05-05 22:30:35Z])

      json_resp =
        get(conn, Routes.order_path(conn, :index))
        |> json_response(200)

      assert json_resp["data"] |> Enum.count() == 3
    end

    test "Return 2 orders which are created today at 12AM", %{conn: conn, client: client} do
      insert(:order, client_id: client.id, inserted_at: ~U[2021-05-03 18:30:35Z])
      insert(:order, client_id: client.id, inserted_at: ~U[2021-05-06 00:00:00Z])
      insert(:order, client_id: client.id, inserted_at: ~U[2021-05-06 00:00:00Z])

      json_resp =
        get(conn, Routes.order_path(conn, :index))
        |> json_response(200)

      assert json_resp["data"] |> Enum.count() == 2
    end
  end
end
