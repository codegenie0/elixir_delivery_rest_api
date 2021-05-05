defmodule DeliveryApi.Repo.Migrations.CreateClientsTable do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add(:firstname, :string, null: false)
      add(:lastname, :string)
      add(:username, :string, null: false)
      add(:email, :string, null: false)
      add(:password, :string, null: false)

      timestamps()
    end
  end
end
