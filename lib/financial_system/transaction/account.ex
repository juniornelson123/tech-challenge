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
    |> cast(params, [:name, :email, :phone, :user_id])
    |> validate_required([:name, :email, :phone, :user_id])
  end
end
