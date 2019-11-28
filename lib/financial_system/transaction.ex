defmodule FinancialSystem.Transaction do
  @moduledoc """
  Transaction Context
  """

  alias FinancialSystem.Repo

  alias FinancialSystem.Transaction.User

  @doc """
  Return %Ecto.Changeset{} for verify user changes

  ##Examples
    iex> change_user(user)
      %Ecto.changeset(source: %User{})
  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  @doc """
  Return list of users

    ##Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Get single user by id

  Raises Ecto.NoResultsError if User not exist

    ##Examples

      iex> get_user!(1)
        %User{}

      iex> get_user!(0)
        ** (Ecto.NoResultError)
  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Create user

    ##Examples
      iex> create_user(%{field: value})
        {:ok, %User{}}

      iex> create_user(%{field: invald_value})
        {:error, %Ecto.Changeset{}}
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Update user

    ##Examples
      iex> update_user(user, %{field: value})
        {:ok, %User{}}

      iex> update_user(user, %{field: invald_value})
        {:error, %Ecto.Changeset{}}
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete user

    ##Examples
      iex> delete_user(user)
        {:ok, %User{}}

      iex> delete_user(user)
        {:error, %Ecto.Changeset{}}
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  alias FinancialSystem.Transaction.Account

  @doc """
  Return %Ecto.Changeset{} for verify user changes

  ##Examples
    iex> change_account(account)
      %Ecto.changeset(source: %Account{})
  """
  def change_account(%Account{} = account) do
    Account.changeset(account, %{})
  end

  @doc """
  Return list of accounts

    ##Examples

      iex> list_accounts()
      [%Account{}, ...]

  """
  def list_accounts do
    Repo.all(Account)
  end

  @doc """
  Get single account by id

  Raises Ecto.NoResultsError if account not exist

    ##Examples

      iex> get_account!(1)
        %Account{}

      iex> get_account!(0)
        ** (Ecto.NoResultError)
  """
  def get_account!(id), do: Repo.get!(Account, id)

  @doc """
  Create account

    ##Examples
      iex> create_account(%{field: value})
        {:ok, %Account{}}

      iex> create_account(%{field: invald_value})
        {:error, %Ecto.Changeset{}}
  """
  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Update account

    ##Examples
      iex> update_account(account, %{field: value})
        {:ok, %Account{}}

      iex> update_account(account, %{field: invald_value})
        {:error, %Ecto.Changeset{}}
  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete account

    ##Examples
      iex> delete_account(account)
        {:ok, %Account{}}

      iex> delete_account(account)
        {:error, %Ecto.Changeset{}}
  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  alias FinancialSystem.Transaction.Item

  @doc """
  Return %Ecto.Changeset{} for verify user changes

  ##Examples
    iex> change_item(item)
      %Ecto.changeset(source: %Item{})
  """
  def change_item(%Item{} = item) do
    Item.changeset(item, %{})
  end

  @doc """
  Return list of items

    ##Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Get single item by id

  Raises Ecto.NoResultsError if item not exist

    ##Examples

      iex> get_item!(1)
        %Item{}

      iex> get_item!(0)
        ** (Ecto.NoResultError)
  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Create item

    ##Examples
      iex> create_item(%{field: value})
        {:ok, %Item{}}

      iex> create_item(%{field: invald_value})
        {:error, %Ecto.Changeset{}}
  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Update item

    ##Examples
      iex> update_item(item, %{field: value})
        {:ok, %Item{}}

      iex> update_item(item, %{field: invald_value})
        {:error, %Ecto.Changeset{}}
  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete item

    ##Examples
      iex> delete_item(item)
        {:ok, %Item{}}

      iex> delete_item(item)
        {:error, %Ecto.Changeset{}}
  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  alias FinancialSystem.Transaction.Transfer

  @doc """
  Return %Ecto.Changeset{} for verify user changes

  ##Examples
    iex> change_transfer(transfer)
      %Ecto.changeset(source: %Transfer{})
  """
  def change_transfer(%Transfer{} = transfer) do
    Transfer.changeset(transfer, %{})
  end

  @doc """
  Return list of transfers

    ##Examples

      iex> list_transfers()
      [%Transfer{}, ...]

  """
  def list_transfers do
    Repo.all(Transfer)
  end

  @doc """
  Get single transfer by id

  Raises Ecto.NoResultsError if transfer not exist

    ##Examples

      iex> get_transfer!(1)
        %Transfer{}

      iex> get_transfer!(0)
        ** (Ecto.NoResultError)
  """
  def get_transfer!(id), do: Repo.get!(Transfer, id)

  @doc """
  Create transfer

    ##Examples
      iex> create_transfer(%{field: value})
        {:ok, %Transfer{}}

      iex> create_transfer(%{field: invald_value})
        {:error, %Ecto.Changeset{}}
  """
  def create_transfer(attrs \\ %{}) do
    %Transfer{}
    |> Transfer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Update transfer

    ##Examples
      iex> update_transfer(transfer, %{field: value})
        {:ok, %Transfer{}}

      iex> update_transfer(transfer, %{field: invald_value})
        {:error, %Ecto.Changeset{}}
  """
  def update_transfer(%Transfer{} = transfer, attrs) do
    transfer
    |> Transfer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete transfer

    ##Examples
      iex> delete_transfer(transfer)
        {:ok, %Transfer{}}

      iex> delete_transfer(transfer)
        {:error, %Ecto.Changeset{}}
  """
  def delete_transfer(%Transfer{} = transfer) do
    Repo.delete(transfer)
  end

end
