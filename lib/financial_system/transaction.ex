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

end
