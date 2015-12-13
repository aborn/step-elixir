defmodule StepElixir.Server do
  @moduledoc """
  服务端处理发过来的消息
  """
  
  def create_instance do
    Task.start_link(fn -> hi("hello") end)
  end

  def hi(name) do
    receive do
      {receivedInfo, caller} ->
        case receivedInfo do
          ^name ->
            send caller, "world"
          _ ->
            send caller, "unknown:" <> receivedInfo
        end
    end
    hi(name)
  end
end
