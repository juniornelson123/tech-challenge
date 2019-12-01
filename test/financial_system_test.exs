defmodule FinancialSystemTest do
  use FinancialSystem.RepoCase
  alias FinancialSystem.Transaction
  doctest FinancialSystem

  def user_fixture(index) do
    {:ok, user} = Transaction.create_user(%{name: "Name#{index} client", email: "email#{index}@email.com", phone: "86984948928"})
    user
  end

  def account_fixture(user_id) do
    {:ok, account} = Transaction.create_account(%{balance: 200, currency: "BRL", user_id: user_id})
    account
  end

  test "User should be able to transfer money to another account" do
    user = user_fixture(1)
    account = account_fixture(user.id)
    user1 = user_fixture(2)
    account1 = account_fixture(user1.id)

    assert {:ok, transfer} = FinancialSystem.transfer(account.id, account1.id, 100)
    assert transfer.reason == "Successful transfer"

    account = Transaction.get_account!(account.id)
    account1 = Transaction.get_account!(account1.id)

    assert account.balance == 100
    assert account1.balance == 300
  end

  test "User cannot transfer if not enough money available on the account" do
    user = user_fixture(1)
    account = account_fixture(user.id)
    user1 = user_fixture(2)
    account1 = account_fixture(user1.id)

    assert {:error, transfer} = FinancialSystem.transfer(account.id, account1.id, 300)
    assert transfer.reason == "Insufficient funds"
  end

  test "A transfer should be cancelled if an error occurs" do
    user = user_fixture(1)
    account = account_fixture(user.id)
    user1 = user_fixture(2)
    account1 = account_fixture(user1.id)

    assert {:error, transfer} = FinancialSystem.transfer(account.id, 0, 300)
    assert transfer.reason == "Canceled transfer verify info"
  end

  test "A transfer can be splitted between 2 or more accounts" do
    user = user_fixture(1)
    account = account_fixture(user.id)
    user1 = user_fixture(2)
    account1 = account_fixture(user1.id)
    user2 = user_fixture(3)
    account2 = account_fixture(user2.id)

    assert {:ok, transfer} = FinancialSystem.transfer(account.id, [%{value: 30, account_received_id: account1.id}, %{value: 40, account_received_id: account2.id}])

    assert transfer.reason == "Successful transfer"

    account = Transaction.get_account!(account.id)
    account1 = Transaction.get_account!(account1.id)
    account2 = Transaction.get_account!(account2.id)

    assert account.balance == 130
    assert account1.balance == 230
    assert account2.balance == 240
  end

  # test "User should be able to exchange money between different currencies" do
  #   assert :false
  # end

  # test "Currencies should be in compliance with ISO 4217" do
  #   assert :false
  # end
end
