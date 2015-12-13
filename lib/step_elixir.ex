defmodule StepElixir.Step do
  @moduledoc """
  学习elixir语言
  """

  alias StepElixir.StringUtils

  def helloworld() do
    a = 5
    IO.puts "hello world! #{a}"
    IO.puts StringUtils.takePrefix("abc def", "abc");
  end
end
