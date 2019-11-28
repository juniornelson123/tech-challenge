defmodule FinancialSystem.Money.CoinTest do
  use ExUnit.Case

  alias FinancialSystem.Money.Coin

  test "get_coins/0 return list for currencies" do
    assert is_list(Coin.get_coins)
  end

  test "get_by_code/1 return currency map" do
    assert coin = Coin.get_by_code("BRL")
    assert coin.name == "Brazilian Real"
    assert coin.code == "BRL"
    assert coin.num_code == 986
    assert coin.multiplier == 2
  end
end
