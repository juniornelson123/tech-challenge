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
end
