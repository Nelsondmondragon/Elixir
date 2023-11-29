defmodule Concurrencia do
  # def saludar(nombre) do
  # IO.puts("Hola, #{nombre}")
  # end

  # def infinito, do: infinito()
  def saludar() do
    receive do
      x -> IO.puts("Hola, #{x}")
    end
  end

  def saludar2() do
    receive do
      {pid, x} ->
        send(pid, "Hola, #{x}")
    end

    saludar2()
  end
end

# pid = spawn(Concurrencia, :saludar, ["Nelson"])

# i pid2

# send(pid,{self(),"Rodolfo"})
