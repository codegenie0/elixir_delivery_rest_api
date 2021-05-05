defmodule DeliveryApi.Repo.Migrations.CreateOrdersTable do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add(:pickup_address, :text, null: false)
      add(:receiver_address, :text, null: false)
      add(:weight_pounds, :decimal, null: false)
      add(:reference_number, :string, null: false)
      add(:client_id, references(:clients), null: false)

      timestamps()
    end
  end
end
