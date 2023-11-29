defmodule GCalc do
  use GenServer

  def init(param) do
    IO.puts("Inicio GenServer Gcalc")
    IO.inspect(param)
    {:ok, %{conteo: 0}}
  end


  def handle_call({:add, n ,m}, _from, %{conteo: conteo}) do
    IO.puts("handle_call(:add, #{n}, #{m})")
    result = n + m
    {:reply, result, %{conteo: conteo+1}}

  end



  def handle_info(msg,%{conteo: conteo}) do
  IO.puts("Me mandan mensaje #{msg}")
  IO.puts("Ha sido llamada #{conteo}")

    {:noreply, %{conteo: conteo+1}}
  end

  def handle_info(:world, state) do
   {:noreply, state}
  end
end
