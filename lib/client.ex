defmodule StepElixir.Client do
  def init() do
    {:ok, pid} = StepElixir.Server.create_instance
    Process.register(pid, :hi)
  end
  
  def demo(msg) do
    case Process.whereis(:hi) do
      x when is_nil x ->
        init()
        doSendMessage(msg)
      x when is_pid x ->
        doSendMessage(msg)
      _ ->
        raise "Error happen!"
    end
  end

  defp doSendMessage(msg) do
    pid = Process.whereis(:hi)
    send pid, {msg, self()}
    IO.puts "pid=#{inspect pid}"
  end
end
