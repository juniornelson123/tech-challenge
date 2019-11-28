defmodule FinancialSystem.Transaction.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :currency, :string
    field :balance, :integer
    belongs_to :user, FinancialSystem.Transaction.User

    timestamps()
  end

  def changeset(account, params \\ %{}) do
    account
    |> cast(params, [:currency, :balance, :user_id])
    |> validate_required([:currency, :balance, :user_id])
  end
end
