defmodule StringUtils do
  @moduledoc """
  字符串处理的工具函数
  Date:2015-08-30
  Author:guobao.jiang
  """
  
  @doc """
  判断字符串是否为空串
  """
  def isBlank(str) do
    if (String.valid?(str)) do
      Enum.all?(String.codepoints(str), fn(x) -> x === " " end)
    else
      :true
    end
  end
  
  def diff(strA, strB) do
    minStr = minString(strA, strB);
    minLen = String.length(minStr);

    filterResult = Enum.filter(0..minLen, fn x ->
      if (String.at(strA, x) == String.at(strB, x)) do
        IO.puts x
      end
    end)
 
    #Enum.filter(0..length(filterResult), fn x ->
     # if (filterResult
  end
  
  @doc """
  判断是否全为英文字母
  :) 这是一个函数的注释
  """
  def onlyEnglish(str) do
    if(byte_size(str) == String.length(str)) do
      :true
    else
      :fale
    end
  end
  
  defp maxString(strA, strB) do
    if(String.length(strA) > String.length(strB)) do
      strA
    else
      strB
    end
  end

  defp minString(strA, strB) do
    if(String.length(strA) < String.length(strB)) do
      strA
    else
      strB
    end
  end

  @doc """
  去掉字符串的前缀
  """
  def takePrefix(full, prefix) do
    base = byte_size(prefix)
    binary_part(full, base, byte_size(full) - base)
  end
end

IO.puts StringUtils.diff("abc 中ff中国ffi", "abd 中gf")
