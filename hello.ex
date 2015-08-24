## hello word
IO.puts "Hello world"

strA = "abcd ef k中国kkk"
strB = "abcd efabc"

defmodule StringUtils do
  def diff(strA, strB) do
    #    IO.puts Enum.map(String.codepoints(strA), fn x -> x <> "1" end)
    IO.puts String.codepoints(strA) -- String.codepoints(strB)
  end
end

StringUtils.diff(strA, strB)

