defmodule StepElixir.DemoEnum do
  @moduledoc """
  列表类型的过虑
  """

  def map(arg \\ [1, 2, 3]) do
    Enum.map(arg, fn x ->
      cond do
        x > 0 ->
          2*x
        x < 0 ->
        (0 - x) * 2
        true -> 111
      end
    end)
  end

  def filter(arg \\ [1, 2, 3]) do
    Enum.filter(arg, fn x ->
      cond do
        rem(x, 3) == 0 ->   # 可被3整除的保留
          :true
        true ->
          :false
      end
    end)
  end

  def sum(arg) do
    Enum.sum(arg)
  end

  def pipe(arg) do
    filter(arg) |> sum
  end
end
