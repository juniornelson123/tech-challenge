defmodule FinancialSystem do
  @moduledoc """
  Documentation for FinancialSystem.
  """
  alias Ecto.Multi
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

    case Repo.transaction(fn -> 
      accounts |> Enum.map(fn account ->
        {:ok, item} = register_item(account.value, account.account_id, transfer.id)

        item = item |> Repo.preload(:account_received)
        transfer_account(account_from, item.account_received, item)
      end)
    end) do
      {:ok, message} -> 
        update_transfer(transfer, true, message)
        {:ok, message}
      {:error, message} -> 
        update_transfer(transfer, false, message)
        {:error, message}
    end
  end

  @doc """
  Transfer values to one account
  """
  def transfer(%Account{} = account_from, %Account{} = account_received, value) do
    #Register transfer
    case register_transfer(account_from.id, value) do
      {:ok, transfer} ->
        case Repo.transaction(fn ->
          #Register item of transfer
          {:ok, item} = register_item(transfer.value, account_received.id, transfer.id)

          transfer_account(account_from, account_received, item)

        end) do
          {:ok, message} ->
            #Updated transfer with status and reason
            update_transfer(transfer, true, message)
            {:ok, message}
          {:error, message} ->
            #Updated transfer with status and reason
            update_transfer(transfer, false, message)
            {:error, message}
        end  
      {:error, changeset} ->
        {:error, changeset}
    end
  end

  @doc """
  Transfer value between accounts
  """
  defp transfer_account(%Account{} = account_from, %Account{} = account_received, item) do
    if account_from.balance >= item.value do

      #Updated balance for account from
      case Transaction.update_account(account_from, %{balance: account_from.balance - item.value}) do
        {:ok, account} ->
          "Successful transfer"
        {:error, %Ecto.Changeset{} = changeset} ->
          Repo.rollback("Unable transfer account")
      end
      
      #Updated balance for account received
      case Transaction.update_account(account_received, %{balance: account_received.balance + item.value}) do
        {:ok, account} ->
          "Successful transfer"
        {:error, %Ecto.Changeset{} = changeset} ->
          Repo.rollback("Unable transfer account")
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
      {:ok, item} -> {:ok, item}
      {:error, changeset} -> Repo.rollback("Unable create item for transfer")
    end
  end

  @doc """
  Set status transfer
  """
  def update_transfer(transfer, status, message) do
    case Transaction.update_transfer(transfer, %{success: status, reason: message}) do
      {:ok, transfer} ->
        {:ok, message}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, "Unable update transfer"}
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
