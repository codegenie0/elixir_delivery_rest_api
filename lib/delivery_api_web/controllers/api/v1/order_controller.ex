defmodule DeliveryApi.OrderController do
  use DeliveryApiWeb, :controller

  alias DeliveryApi.Repo

  import Ecto.Query

  def index(conn, _params) do
    start_time = Timex.shift(Timex.today(), days: -1)

    orders =
      from(
        order in Data.Order,
        where:
          fragment("inserted_at::date") == ^start_time or
            (fragment("inserted_at::date") == ^Timex.today() and
               fragment("inserted_at::time") == "00:00:00")
      )
      |> Repo.all()

    render(conn, "index.json", orders: orders)
  end
end
