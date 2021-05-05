defmodule DeliveryApi.Repo do
  use Ecto.Repo,
    otp_app: :delivery_api,
    adapter: Ecto.Adapters.Postgres
end
