defmodule StepElixir.GenClient do
  @servername :hello
  @moduledoc """
  GenServer对应的客户端
  """

  @doc """
  对服务进行初始化
  """
  def init() do
    GenServer.start_link(StepElixir.GenServer, :ok, name: @servername)
  end

  def say(msg) do
    case Process.whereis(@servername) do
      x when is_nil x ->
        {:ok, pid} = init()
        IO.puts "初始化成功:#{inspect pid}"
      _ ->     # do nothing
    end
    reply = GenServer.call(@servername, {:hello, msg})
    clientpid = self()
    IO.puts "clientpid = #{inspect clientpid} reply:" <> reply
    IO.puts "" <> GenServer.call(@servername, {:state})
  end
  
end
