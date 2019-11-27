defmodule FinancialSystem.Transaction.Transfer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transfers" do
    field :value, :integer
    field :currency, :string
    has_many :items, FinancialSystem.Transaction.Item

    timestamps()
  end

  def changeset(transfer, params \\ %{}) do
    transfer
    |> cast(params, [:value, :currency])
    |> validate_required([:value, :currency])
  end

end
