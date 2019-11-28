defmodule FinancialSystem.TransactionTest do
  use FinancialSystem.RepoCase

  alias FinancialSystem.Transaction

  describe "users" do

    @valid_user %{name: "name", email: "email@gmail.com", phone: "00000000"}
    @update_user %{name: "update name", email: "update@gmail.com", phone: "11111111"}
    @invalid_user %{name: nil, email: nil, phone: nil}

    def user_fixture() do
      {:ok, user} = Transaction.create_user(@valid_user)
      user
    end

    test "list_users/0 return list for all users" do
      user = user_fixture()
      assert Transaction.list_users == [user]
    end

    test "get_user!/1 with id valid return user by id" do
      user = user_fixture()
      assert Transaction.get_user!(user.id) == user
    end

    test "get_user!/1 with id invalid return error Ecto.NoResultsError" do
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_user!(0) end
    end

    test "create_user/1 with valid values return user created" do
      assert {:ok, user} = Transaction.create_user(@valid_user)
      assert user.name == "name"
      assert user.email == "email@gmail.com"
      assert user.phone == "00000000"
    end

    test "create_user/1 with invalid values return error changeset" do
      assert {:error, changeset} = Transaction.create_user(@invalid_user)
    end

    test "update_user/2 with valid values return user updated" do
      user = user_fixture()
      assert {:ok, user} = Transaction.update_user(user, @update_user)
      assert user.name == "update name"
    end

    test "update_user/2 with invalid values return error changeset" do
      user = user_fixture()
      assert {:error, changeset} = Transaction.update_user(user, @invalid_user)
    end

    test "delete_user/1 remove user from database" do
      user = user_fixture()
      assert {:ok, user} = Transaction.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_user!(user.id) end
    end

    test "change_user/1 return user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Transaction.change_user(user)
    end
  end

  describe "accounts" do

    @valid_user %{name: "name", email: "email@gmail.com", phone: "00000000"}
    @valid_account %{currency: "BRL", balance: 20000, user_id: 1}
    @update_account %{balance: 40000}
    @invalid_account %{currency: nil, balance: nil, user_id: nil}

    def user_fixture() do
      {:ok, user} = Transaction.create_user(@valid_user)

      user
    end

    def account_fixture() do
      user = user_fixture()

      {:ok, account} = Map.put(@valid_account, :user_id, user.id) |> Transaction.create_account

      account
    end

    test "list_accounts/0 return list for all accounts" do
      account = account_fixture()
      assert Transaction.list_accounts == [account]
    end

    test "get_account!/1 with id valid return account by id" do
      account = account_fixture()
      assert Transaction.get_account!(account.id) == account
    end

    test "get_account!/1 with id invalid return error Ecto.NoResultsError" do
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_account!(0) end
    end

    test "create_account/1 with valid values return account created" do
      user = user_fixture
      assert {:ok, account} = Map.put(@valid_account, :user_id, user.id) |> Transaction.create_account
      assert account.currency == "BRL"
      assert account.balance == 20000
      assert account.user_id == user.id
    end

    test "create_account/1 with invalid values return error changeset" do
      assert {:error, changeset} = Transaction.create_account(@invalid_account)
    end

    test "update_account/2 with valid values return account updated" do
      account = account_fixture()
      assert {:ok, account} = Transaction.update_account(account, @update_account)
      assert account.balance == 40000
    end

    test "update_account/2 with invalid values return error changeset" do
      account = account_fixture()
      assert {:error, changeset} = Transaction.update_account(account, @invalid_account)
    end

    test "delete_account/1 remove account from database" do
      account = account_fixture()
      assert {:ok, account} = Transaction.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_account!(account.id) end
    end

    test "change_account/1 return account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Transaction.change_account(account)
    end
  end
end
