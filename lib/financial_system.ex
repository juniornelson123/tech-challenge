defmodule FinancialSystem do
  @moduledoc """
  Documentation for FinancialSystem.
  """
  alias FinancialSystem.Repo
  alias FinancialSystem.Transaction
  alias FinancialSystem.Transaction.Account
  alias FinancialSystem.Transaction.Item
  alias FinancialSystem.Transaction.Transfer

  @doc """
  Transfer and split values to transfer
  """
  def transfer(%Account{} = account_from, [h | t] = accounts, value) when is_list(accounts) do
    #Register transfer
    {_, transfer} = register_transfer(account_from.id, value)


  end

  @doc """
  Transfer values to one account
  """
  def transfer(%Account{} = account_from, %Account{} = account_received, value) do
    #Register transfer
    case register_transfer(account_from.id, value) do
      {:ok, transfer} ->
        transfer_account(account_from, account_received, transfer)
      {:error, changeset} ->
        {:error, changeset}
    end
  end

  @doc """
  Transfer value between accounts
  """
  defp transfer_account(%Account{} = account_from, %Account{} = account_received, transfer) do
    case Repo.transaction(fn ->
      if account_from.balance >= transfer.value do
        #Register item of transfer
        register_item(transfer.value, account_received.id, transfer.id)

        #Updated balance for account from
        update_account(account_from, account_from.balance - transfer.value)
        #Updated balance for account received
        update_account(account_received, account_received.balance + transfer.value)
      else
        Repo.rollback("Insufficient funds")
      end
    end) do

      {:ok, message} ->
        #Updated transfer with status and reason
        update_transfer(transfer, true, message)
      {:error, message} ->
        #Updated transfer with status and reason
        update_transfer(transfer, false, message)
    end
  end

  @doc """
  Registry item relationship with transfer
  """
  defp register_item(value, account_received_id, transfer_id) do
    case Transaction.create_item(%{value: value, account_received_id: account_received_id, transfer_id: transfer_id}) do
      {:ok, item} -> {:ok, item}
      {:error, changeset} -> Repo.rollback("Unable create item for transfer")
    end
  end

  @doc """
  Update balance from account
  """
  defp update_account(account, value) do
    case Transaction.update_account(account, %{balance: value}) do
      {:ok, account} ->
        "Successful transfer"
      {:error, %Ecto.Changeset{} = changeset} ->
        Repo.rollback("Unable transfer")
    end
  end

  @doc """
  Set status transfer
  """
  def update_transfer(transfer, status, message) do
    case Transaction.update_transfer(transfer, %{success: status, reason: message}) do
      {:ok, transfer} ->
        message
      {:error, %Ecto.Changeset{} = changeset} ->
        Repo.rollback("Unable transfer")
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
