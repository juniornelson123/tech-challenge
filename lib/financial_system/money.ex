defmodule FinancialSystem.Money do
  @moduledoc """
  Module to manage currencies
  """
  alias FinancialSystem.Money.Coin

  @doc """
  Get real value(not integer) by currency

    ##Examples

      iex>  FinancialSystem.Money.get_value(1010, "BRL")
      10.1
  """
  def get_value(value, currency) do
    multiplier = :math.pow(10, Coin.get_by_code(currency).multiplier)
    value / multiplier |> Float.ceil(Coin.get_by_code(currency).multiplier)
  end

  @doc """
  Get value in integer by currency

    ##Examples

      iex>  FinancialSystem.Money.parse_value(10.1, "BRL")
      1010
  """
  def parse_value(value, currency) do
    round(value * :math.pow(10, Coin.get_by_code(currency).multiplier))
  end
end
