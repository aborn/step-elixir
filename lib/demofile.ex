defmodule StepElixir.DemoFile do
  def read_and_print(fileName \\ Path.join(__DIR__, "text.txt")) do
    
    unless File.exists? fileName do
      Hex.Shell.warn "#{fileName} doesn't exists!"
    end
    
    case File.read(fileName) do
      {:ok, content} ->
        File.write(Path.join(__DIR__, "out.txt"), content)
        {:ok, "content:#{inspect content}"}
      {:error, _} ->
        Hex.Shell.error "error in read: #{fileName}"
        {:error, "unknow error!"}
    end
  end
end
