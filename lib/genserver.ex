defmodule StepElixir.GenServer do
  @moduledoc """
  GenServer demo
  """

  use GenServer

  @doc """
  初始化的callback
  """
  def init(:ok) do
    {:ok, "initial finished!"}
  end
  
  def handle_call({:hello, msg}, _from, state) do
    pid = self()
    {:reply, "I reviced message:" <> msg <>
      " [state:" <> state <> "] serverpid=#{inspect pid}", state}
  end

  def handle_call({:state}, _from, state) do
    {:reply, state, state}
  end
  

  def handle_call(request, from, state) do
    super(request, from, state)
  end

  def handle_cast(:create) do
    {:noreply}
  end
  
  def handle_cast(request, state) do
    super(request, state)
  end
  
end
