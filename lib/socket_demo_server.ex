defmodule SocketDemoServer do
  use Application

  @doc false
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Task.Supervisor, [[name: SocketDemoServer.TaskSupervisor]]),
      worker(Task, [SocketDemoServer, :accept, [4000]])
    ]

    opts = [strategy: :one_for_one, name: SocketDemoServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Starts accepting connections on the given `port`.
  """
  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port,
                                    [:binary, packet: :line, active: false, reuseaddr: true])
    IO.puts "Accepting connections on port #{port}"
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    {:ok, pid} = Task.Supervisor.start_child(SocketDemoServer.TaskSupervisor, fn -> serve(client) end)
    IO.puts "pid=#{inspect pid} created!"
    :ok = :gen_tcp.controlling_process(client, pid)
    loop_acceptor(socket)
  end

  defp serve(socket) do
    case read_line(socket) do
      {:ok, data} ->
        IO.puts "I receive msg:#{data} from socket #{inspect socket}"
        write_line(data, socket)
        serve(socket)
      {:error, :closed} ->
        IO.puts "client close connection!"
        :gen_tcp.close(socket)
      _ ->
        raise "unknown error exception!"
    end
  end

  defp read_line(socket) do
    :gen_tcp.recv(socket, 0)
  end

  defp write_line(line, socket) do
    unless is_nil line do
      :gen_tcp.send(socket, line)
    end
  end
end
