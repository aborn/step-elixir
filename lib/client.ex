defmodule StepElixir.Client do
  def demo(msg) do
    {:ok, pid} = StepElixir.Server.create_instance
    send pid, {msg, self()}
  end
end
