defmodule VersionUtil do
  @moduledoc """
  版本比较工具module
  """

  @doc """
  查询传入的版本号是否合法
  返回 :true 或 :false
  """
  @spec validate(String.t) :: boolean
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
  @spec valid?(String.t) :: boolean
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
  @spec compare(String.t, String.t) :: integer
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

end
