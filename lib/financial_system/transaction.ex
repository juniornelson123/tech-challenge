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

end
