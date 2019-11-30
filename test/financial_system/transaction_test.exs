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

  describe "transfers" do

    @valid_transfer %{value: 30000, reason: "Created Transfer", success: false}
    @update_transfer %{value: 40000, reason: "Transfer Completed", success: true}
    @invalid_transfer %{value: nil}

    @valid_user %{name: "name", email: "email@gmail.com", phone: "00000000"}
    @valid_account %{currency: "BRL", balance: 20000, user_id: 1}
    @update_account %{balance: 40000}
    @invalid_account %{currency: nil, balance: nil, user_id: nil}

    def user_fixture() do
      {:ok, user} = Transaction.create_user(@valid_user)

      user
    end

    def account_fixture(account) do
      user = user_fixture()

      {:ok, account} = Map.put(@valid_account, :user_id, user.id) |> Transaction.create_account

      account
    end

    def transfer_fixture() do
      account = account_fixture()

      {:ok, transfer} = Map.put(@valid_transfer, :account_id, account.id) |> Transaction.create_transfer

      transfer
    end

    test "list_transfers/0 return list for all transfers" do
      transfer = transfer_fixture()
      assert Transaction.list_transfers == [transfer]
    end

    test "get_transfer!/1 with id valid return transfer by id" do
      transfer = transfer_fixture()
      assert Transaction.get_transfer!(transfer.id) == transfer
    end

    test "get_transfer!/1 with id invalid return error Ecto.NoResultsError" do
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_transfer!(0) end
    end

    test "create_transfer/1 with valid values return transfer created" do
      account = account_fixture()

      transfer_params = Map.put(@valid_transfer, :account_id, account.id)

      assert {:ok, transfer} = Transaction.create_transfer(transfer_params)
      assert transfer.value == 30000
      assert transfer.account_id == account.id
    end

    test "create_transfer/1 with invalid values return error changeset" do
      assert {:error, changeset} = Transaction.create_transfer(@invalid_transfer)
    end

    test "update_transfer/2 with valid values return transfer updated" do
      transfer = transfer_fixture()
      assert {:ok, transfer} = Transaction.update_transfer(transfer, @update_transfer)
      assert transfer.value == 40000
    end

    test "update_transfer/2 with invalid values return error changeset" do
      transfer = transfer_fixture()
      assert {:error, changeset} = Transaction.update_transfer(transfer, @invalid_transfer)
    end

    test "delete_transfer/1 remove transfer from database" do
      transfer = transfer_fixture()
      assert {:ok, transfer} = Transaction.delete_transfer(transfer)
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_transfer!(transfer.id) end
    end

    test "change_transfer/1 return transfer changeset" do
      transfer = transfer_fixture()
      assert %Ecto.Changeset{} = Transaction.change_transfer(transfer)
    end
  end

  describe "items" do

    @valid_user %{name: "name", email: "email@gmail.com", phone: "00000000"}
    @valid_account %{currency: "BRL", balance: 20000, user_id: 1}
    @valid_transfer %{currency: "BRL", value: 30000}
    @valid_item %{value: 20000, transfer_id: 1, account_id: 1}
    @update_item %{value: 40000}
    @invalid_item %{value: nil, transfer_id: nil, account_id: nil}

    def transfer_fixture() do
      {:ok, transfer} = Transaction.create_transfer(@valid_transfer)

      transfer
    end

    def account_fixture() do
      {:ok, user} = Transaction.create_user(@valid_user)

      {:ok, account} = Map.put(@valid_account, :user_id, user.id) |> Transaction.create_account

      account
    end

    def item_fixture() do
      account = account_fixture()
      transfer = transfer_fixture()

      {:ok, item} = Map.put(@valid_item, :transfer_id, transfer.id)
                    |> Map.put(:account_received_id, account.id)
                    |> Transaction.create_item

      item
    end

    test "list_items/0 return list for all items" do
      item = item_fixture()
      assert Transaction.list_items == [item]
    end

    test "get_item!/1 with id valid return item by id" do
      item = item_fixture()
      assert Transaction.get_item!(item.id) == item
    end

    test "get_item!/1 with id invalid return error Ecto.NoResultsError" do
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_item!(0) end
    end

    test "create_item/1 with valid values return item created" do
      account = account_fixture()
      transfer = transfer_fixture()

      assert {:ok, item} = Map.put(@valid_item, :transfer_id, transfer.id)
                    |> Map.put(:account_received_id, account.id)
                    |> Transaction.create_item
      assert item.value == 20000
      assert item.transfer_id == transfer.id
      assert item.account_received_id == account.id
    end

    test "create_item/1 with invalid values return error changeset" do
      assert {:error, changeset} = Transaction.create_item(@invalid_item)
    end

    test "update_item/2 with valid values return item updated" do
      item = item_fixture()
      assert {:ok, item} = Transaction.update_item(item, @update_item)
      assert item.value == 40000
    end

    test "update_item/2 with invalid values return error changeset" do
      item = item_fixture()
      assert {:error, changeset} = Transaction.update_item(item, @invalid_item)
    end

    test "delete_item/1 remove item from database" do
      item = item_fixture()
      assert {:ok, item} = Transaction.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_item!(item.id) end
    end

    test "change_item/1 return item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Transaction.change_item(item)
    end
  end
end
