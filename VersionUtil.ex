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
    # 当不是字符串类型 或者 字符串为空 返回false
    if((not String.valid?(version)) or (version === "")) do
      :false
    else 
    verList = asAtomList(version)
      Enum.all?(verList, fn(x) ->
        try do
          is_integer(String.to_integer(x))
        rescue
          ArgumentError -> :false
        end
      end)
    end
  end

  @doc """
  与validate/1 的方法一样，只是实现不一样
  """
  def valid?(version) do
    verList = asAtomList(version)
    Enum.reduce(verList, :true,
      fn(x, acc) ->
        try do
          is_integer(String.to_integer(x))
        rescue
          ArgumentError -> :false
        end
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
    if (validate(versionA) and validate(versionB) ) do
      vListA = asIntAtomList(versionA)
      vListB = asIntAtomList(versionB)
      diffLen = length(vListA) - length(vListB)
      
      if (diffLen > 0) do
        vListB = appendZero(vListB, abs(diffLen))
      else
        vListA = appendZero(vListA, abs(diffLen))
      end
      
      diffAB = String.to_integer(Enum.join(vListA)) - String.to_integer(Enum.join(vListB))
      cond do
        diffAB == 0 -> 0
        diffAB > 0 -> 1
        diffAB < 0 -> -1
      end
    else  # 谁合法谁大，都不合法取0
      cond do
        (!validate(versionA) and (!validate(versionB))) -> 0
        (validate(versionA)) -> 1
        (validate(versionB)) -> -1
      end
    end
  end

  # 在一个list后面添加num个为0的item
  defp appendZero(list, num) do
    zeroList = Enum.map(1..num, fn(x) -> x*0 end)
    list ++ zeroList
  end

  # 将版本字符串分割成list,分割符号为 .
  defp asAtomList(version) do
    Enum.filter(String.split(version, "."),
      fn(x) -> x !== "." end)
  end

  # 将版本字符串分割成int类型的list,分割符号为 .
  defp asIntAtomList(version) do
    verList = asAtomList(version)
    Enum.map(verList, fn(x) -> String.to_integer(x) end)
  end

  # 测试用的函数
  def debug(version) do
    asIntAtomList(version)
  end
end


## 下面为测试用例
IO.puts VersionUtil.validate("1.02.09")
IO.puts VersionUtil.validate("")
IO.puts VersionUtil.validate("1.23s")

## 下面测试比较
IO.puts VersionUtil.compare("1.1", "1.0.1")
IO.puts VersionUtil.compare("0.0.1", "0.1")
IO.puts VersionUtil.compare("0.1.0", "0.1s")
IO.puts VersionUtil.compare("0.1.0s", "0.1s")
IO.puts VersionUtil.compare("0.1.s0", "0.1")
