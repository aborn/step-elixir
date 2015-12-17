defmodule StepElixir.Condition do
  @moduledoc """
  条件语句的示例
  """
  
  def democase(arg) do
    case arg do
      [x, 5, 5] ->
        IO.puts "[x, 5, 5]"
      {_, x} when x > 3 ->
        IO.puts "x > 3"
      _ ->
        IO.puts "other else"
    end
  end

  def democond(arg) do
    cond do
      is_binary(arg) ->
        IO.puts "input: string #{arg}"
      arg == 5 ->
        IO.puts "input:5"
      arg > 4 ->
        IO.puts "input:#{inspect arg}>4"
      arg < 0 ->
        IO.puts "intput:#{inspect arg}<0"
      true ->
        IO.puts "else"
    end
  end

  def demoif(arg) do
    if arg > 0 do
      IO.puts "positive"
    else
      IO.puts "negative"
    end
  end
end

