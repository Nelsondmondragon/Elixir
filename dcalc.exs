defmodule Dcalc do
  def calculadora do
    receive do
      {pid, :+, a, b} -> send(pid, a + b)
      {pid, :-, a, b} -> send(pid, a - b)
      {pid, :x, a, b} -> send(pid, a * b)
      {pid, :/, a, 0} -> exit("Division por zero")
      {pid, :/, a, b} -> send(pid, a / b)
    end

    calculadora()
  end

  # Monitorizacion de procesos

  # pid = spawn(Dcalc, :calculadora, [])
  # ref = Process.monitor(pid)
  # Process.demonitor(ref)
  # send(pid, {self, :/,2,0})
  # flush()


  def calculadora(contador) do
    receive do
      {pid, :+, a, b} ->
        send(pid, a + b)

      {pid, :-, a, b} ->
        send(pid, a - b)

      {pid, :x, a, b} ->
        send(pid, a * b)

      {pid, :/, a, 0} ->
        exit("Division por zero")

      {pid, :/, a, b} ->
        send(pid, a / b)
    end

    calculadora(contador + 1)
  end


  #GenServer

  
end
