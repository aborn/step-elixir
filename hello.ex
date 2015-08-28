## hello word
IO.puts "Hello world"

strA = "abcd 中ef k中国kkk"
strB = "abcdkkk 中在efabc"

defmodule StringUtils do
  def diff(strA, strB) do
    #    IO.puts Enum.map(String.codepoints(strA), fn x -> x <> "1" end)
    #    IO.puts String.codepoints(strA) -- String.codepoints(strB)
    IO.puts "长字符串:" <> maxString(strA, strB)
    IO.puts "短字符串:" <> minString(strA, strB)
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
end

StringUtils.diff(strA, strB)

