defmodule Mix.Tasks.BaseSeed do
  @moduledoc """

  """

  alias Data.{Client, Order}
  alias DeliveryApi.Repo

  use Mix.Task

  def run(_args) do
    [:postgrex, :ecto, :delivery_ap]
    |> Enum.each(&Application.ensure_all_started/1)

    Repo.start_link()

    client =
      DeliveryApi.Repo.insert!(%Client{
        firstname: "hammad",
        lastname: "ahmed",
        username: "hammad123",
        email: "test@test.com",
        password: "123"
      })

    Enum.map(1..10, fn _number ->
      DeliveryApi.Repo.insert!(%Order{
        pickup_address: "Metropoliton street no 2 house no 567",
        receiver_address: "main bulavard central park",
        reference_number: "123456",
        weight_pounds: 12.00,
        client_id: client.id
      })
    end)
  end
end
