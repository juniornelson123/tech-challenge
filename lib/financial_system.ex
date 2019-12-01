defmodule FinancialSystem do
  @moduledoc """
  Documentation for FinancialSystem.
  """
  alias FinancialSystem.Repo
  alias FinancialSystem.Transaction

  @doc """
  Transfer and split values to transfer

    ##Examples
      iex> {:ok, user} = FinancialSystem.Transaction.create_user(%{name: "Name client", email: "email@email.com", phone: "86984948928"})
      iex> {:ok, account} = FinancialSystem.Transaction.create_account(%{balance: 200, currency: "BRL", user_id: user.id})
      iex> {:ok, user1} = FinancialSystem.Transaction.create_user(%{name: "Name client1", email: "email1@email.com", phone: "86984948928"})
      iex> {:ok, account1} = FinancialSystem.Transaction.create_account(%{balance: 200, currency: "BRL", user_id: user1.id})
      iex> {:ok, user2} = FinancialSystem.Transaction.create_user(%{name: "Name client2", email: "email2@email.com", phone: "86984948928"})
      iex> {:ok, account2} = FinancialSystem.Transaction.create_account(%{balance: 200, currency: "BRL", user_id: user2.id})
      iex> {:ok, transfer} = FinancialSystem.transfer(account.id, [%{value: 30, account_received_id: account1.id}, %{value: 40, account_received_id: account2.id}])
      iex> {:error, transfer} = FinancialSystem.transfer(account.id, [%{value: 300, account_received_id: account1.id}, %{value: 40, account_received_id: account2.id}])
      iex> ""
      ""
  """
  def transfer(account_from_id, accounts) do
    value = accounts |> Enum.map(&(&1.value)) |> Enum.reduce(0, &(&1+&2))

    #Register transfer
    {_, transfer} = register_transfer(account_from_id, value)

    case Repo.transaction(fn ->
      accounts |> Enum.map(fn account ->
        {:ok, item} = register_item(account.value, account.account_received_id, transfer.id)

        transfer_account(account_from_id, item.account_received_id, item)
      end)

      "Successful transfer"
    end) do
      {:ok, message} ->
        update_transfer(transfer, true, message)
      {:error, message} ->
        {_, transfer} = update_transfer(transfer, false, message)
        {:error, transfer}
    end
  end

  @doc """
  Transfer values to one account

    ##Examples
      iex> {:ok, user} = FinancialSystem.Transaction.create_user(%{name: "Name client", email: "email@email.com", phone: "86984948928"})
      iex> {:ok, account} = FinancialSystem.Transaction.create_account(%{balance: 200, currency: "BRL", user_id: user.id})
      iex> {:ok, user1} = FinancialSystem.Transaction.create_user(%{name: "Name client1", email: "email1@email.com", phone: "86984948928"})
      iex> {:ok, account1} = FinancialSystem.Transaction.create_account(%{balance: 200, currency: "BRL", user_id: user1.id})
      iex> {:ok, transfer} = FinancialSystem.transfer(account.id, account1.id, 100)
      iex> {:error, transfer} = FinancialSystem.transfer(account.id, account1.id, 1000)
      iex> ""
      ""
  """

  def transfer(account_from_id, account_received_id, value) do
    #Register transfer
    case register_transfer(account_from_id, value) do
      {:ok, transfer} ->
        case Repo.transaction(fn ->
          #Register item of transfer
          {:ok, item} = register_item(transfer.value, account_received_id, transfer.id)

          transfer_account(account_from_id, account_received_id, item)

        end) do
          {:ok, message} ->
            #Updated transfer with status and reason
            update_transfer(transfer, true, message)
          {:error, message} ->
            #Updated transfer with status and reason
            {_, transfer} = update_transfer(transfer, false, message)
            {:error, transfer}
        end
      {:error, changeset} ->
        {:error, "Canceled transfer verify info"}
    end
  end

  @doc """
  Transfer value between accounts
  """
  defp transfer_account(account_from_id, account_received_id, item) do
    account_from = Transaction.get_account!(account_from_id)
    account_received = Transaction.get_account!(account_received_id)

    if account_from.balance >= item.value do

      #Updated balance for account from
      case Transaction.update_account(account_from, %{balance: account_from.balance - item.value}) do
        {:ok, account} ->
          "Successful transfer"
        {:error, %Ecto.Changeset{} = changeset} ->
          Repo.rollback("Canceled transfer verify info")
      end

      #Updated balance for account received
      case Transaction.update_account(account_received, %{balance: account_received.balance + item.value}) do
        {:ok, account} ->
          "Successful transfer"
        {:error, %Ecto.Changeset{} = changeset} ->
          Repo.rollback("Canceled transfer verify info")
      end
    else
      Repo.rollback("Insufficient funds")
    end
  end

  @doc """
  Registry item relationship with transfer
  """
  defp register_item(value, account_received_id, transfer_id) do
    case Transaction.create_item(%{value: value, account_received_id: account_received_id, transfer_id: transfer_id}) do
      {:ok, item} ->
        {:ok, item}
      {:error, changeset} ->
        Repo.rollback("Canceled transfer verify info")
    end
  end

  @doc """
  Set status transfer
  """
  defp update_transfer(transfer, status, message) do
    case Transaction.update_transfer(transfer, %{success: status, reason: message}) do
      {:ok, transfer} ->
        {:ok, transfer}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, transfer}
    end
  end

  @doc """
  Create entity to registry transfer
  """
  defp register_transfer(account_id, value) do
    case Transaction.create_transfer(%{value: value, account_id: account_id, reason: "Created Transfer", success: false}) do
      {:ok, transfer} ->
        {:ok, transfer}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, changeset}
    end
  end

end
