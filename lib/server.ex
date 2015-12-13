defmodule StepElixir.Server do
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
