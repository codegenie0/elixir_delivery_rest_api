defmodule Data.Order do
  @moduledoc false

  use Ecto.Schema
  @timestamps_opts [type: :utc_datetime]
  import Ecto.Changeset

  schema "orders" do
    field(:pickup_address, :string)
    field(:receiver_address, :string)
    field(:reference_number, :string)
    field(:weight_pounds, :decimal)
    belongs_to(:client, Data.Client)
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :pickup_address,
      :receiver_address,
      :weight_pounds,
      :reference_number,
      :client_id
    ])
    |> validate_required([
      :pickup_address,
      :receiver_address,
      :weight_pounds,
      :reference_number,
      :client_id
    ])
    |> foreign_key_constraint(:client_id)
  end
end
