## hello word
IO.puts "Hello world"

strA = "abcd 中ef k中国kkk"
strB = "abcdkkk 中在efabcccccc"

defmodule StringUtils do
  def diff(strA, strB) do
    #    IO.puts Enum.map(String.codepoints(strA), fn x -> x <> "1" end)
    #    IO.puts String.codepoints(strA) -- String.codepoints(strB)
    IO.puts "长字符串为:" <> maxString(strA, strB)
    IO.puts "短字符串为:" <> minString(strA, strB)
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
  
  def maxString(strA, strB) do
    if(String.length(strA) > String.length(strB)) do
      strA
    else
      strB
    end
  end

  def minString(strA, strB) do
    if(String.length(strA) < String.length(strB)) do
      strA
    else
      strB
    end
  end

  def takePrefix(full, prefix) do
    base = byte_size(prefix)
    IO.puts base
    binary_part(full, base, byte_size(full) - base)
  end
end

StringUtils.diff(strA, strB)
#IO.puts StringUtils.onlyEnglish("fsafsd")
#IO.puts StringUtils.onlyEnglish("fsafsd中")
IO.puts StringUtils.takePrefix("ab中国", "ab中")

