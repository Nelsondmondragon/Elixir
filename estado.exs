defmodule Estado do
  def contador(), do: contador(0)

  defp contador(value) do
    new_value =
      receive do
        {:get, pid} ->
          send(pid, value)
          value

        {:inc} ->
          value + 1

        {:dec} ->
          value - 1

        {:reset} ->
          0
      end

    contador(new_value)
  end

  def contador2() do
    value = Process.get(:valor) || 0

    receive do
      {:get, pid} ->
        send(pid, Process.get(:valor))

      {:inc} ->
        Process.put(:valor, value + 1)

      {:dec} ->
        Process.put(:valor, value - 1)

      {:reset} ->
        Process.put(:valor, 0)
    end

    contador2()
  end
end

# pid = spawn(Estado, :contador, [])
# send(pid,{:get,self()})
# send(pid,{:inc})
# send(pid,{:inc})
# send(pid,{:inc})
# send(pid,{:inc})
# send(pid,{:get,self()})
# send(pid,{:dec})
# send(pid,{:dec})
# send(pid,{:get,self()})

# Process.info(pid)

# pid = spawn(Estado, :contador2, [])
# send(pid, {:get, self()})
# flush()
# send(pid,{:inc})
# Process.info(pid)

# Process.info(pid)[:dictionary][:valor]
