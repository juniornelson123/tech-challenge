defmodule FinancialSystem.Transaction.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :phone, :string
    has_one :account, FinancialSystem.Transaction.Account

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :phone])
    |> validate_required([:name, :email, :phone])
  end
end
