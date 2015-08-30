defmodule VersionUtil do
  @moduledoc """
  MAPI 版本号验证和比较的module
  Date: 2015-08-30
  Author: guobao.jiang
  """

  @doc """
  查询传入的版本号是否合法
  返回 :true 或 :false
  """
  def validate(version) do
    verList = asAtomList(version)
    Enum.reduce(verList, :true,
      fn(x, acc) ->
        try do
          is_integer(String.to_integer(x))
        rescue
          ArgumentError -> :false
        end
        #String.match?(x, ~r[0-9])
        and acc
      end)
  end

  @doc """
  判断版本号的大小
  返回  1 当versionA > versionB
  返回  0 当versionA = versionB
  返回 -1 当versionA < versionB
  """
  def compare(versionA, versionB) do
  end
  
  defp asAtomList(version) do
    Enum.filter(String.split(version, "."),
      fn(x) -> x !== "." end)
  end

end


IO.puts VersionUtil.validate("1.02.09")
IO.puts VersionUtil.validate("1.23s")

