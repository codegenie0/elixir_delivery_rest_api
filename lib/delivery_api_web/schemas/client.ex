defmodule Data.Client do
  @moduledoc false

  use Ecto.Schema
  @timestamps_opts [type: :utc_datetime]
  import Ecto.Changeset

  schema "clients" do
    field(:firstname, :string)
    field(:lastname, :string)
    field(:username, :string)
    field(:email, :string)
    field(:password, :string)
    has_many(:orders, Data.Order)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :firstname,
      :lastname,
      :username,
      :email,
      :password
    ])
    |> validate_required([:firstname, :lastname, :username, :email, :password])
    |> validate_format(:email, ~r/@/)
  end
end
