defmodule ProcessDemo do
  def do_send() do
    {:ok, pid} = spawn_link fn ->
      IO.puts "good"
    end
  end
end

ProcessDemo.do_send()
