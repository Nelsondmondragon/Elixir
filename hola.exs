nombre = IO.gets("Como te llamas?")
nombre_limpio  = String.trim(nombre)
IO.puts "Hola, #{nombre_limpio}. encantado de conocerte!"



edad = 10

mensaje = if edad >= 18 do
  IO.puts "Depuracion: edad es true"
  "Mayor de edad"
else
  IO.puts "Depuracion: edad es false"
  espera = 18 - edad
  "Menor de edad: vuelve dentro de #{espera} annios"
end

IO.puts mensaje


# unless -> es como el if pero negado
admin = false
unless admin do
  IO.puts "Atencion: no es admin"
else
  IO.puts "Esta cuenta es admin"
end


lluvia = 100
mensaje = cond do
  lluvia == 00 -> "No ha llovido"
  lluvia < 30 -> "Ha llovido un poco"
  lluvia < 60 -> "Ha llovido un rato"
  lluvia < 90 -> "Ha llovido bastante"
  true -> "Ojito vamonos"
end

IO.puts mensaje



defmodule Calculadora do
  def suma(a,b) do
    IO.puts("Me estan pidiendo que sume #{a} y #{b}")
    a+b
  end
end

IO.inspect(Calculadora.suma(4,4))


cuadrado = fn n -> n*n end
cuadrado.(5)


defmodule Calculon do
  def operar(func)do
    func.(5,3)
  end
end

IO.puts operar(fn a,b -> a+b end)

#Capturar funciones

IO.puts Calculos.operar(&rem/2)



defmodule Impuestos do
  def impuesto(precio, tipo) do
    Impuestos.porcentaje(tipo) * precio
  end

  def porcentaje(tipo) do
    cond do
      tipo ==:normal -> 0.21
      tipo ==:reducido -> 0.10
      tipo ==:super_reducido -> 0.04
    end
  end
end

IO.inspect Impuestos.impuesto(10, :reducido)


{:hola, 5, "buenas", 5.25}

# Tipos compuestos.(tuplas )
cocres = fn a,b -> {div(a,b), rem(a,b)} end
IO.inspect(cocres.(5,4))


# extraer elementos de tuplas

ele = elem({:hola,:adios,:buenas,:noches},3)
IO.puts (ele)


# operador igual -> es un operador que hace mathcing (pattern matching)


# Pattern matchig withc functions

defmodule Func3 do
  def print2(x) when is_tuple(x) do
    IO.puts(elem(x,1))
  end
end

Func3.print2({:hey,"hola"})
57818927


 exp = {:ok,"hola"}

 output = case exp do
  {:ok, x} -> "Ha resuleto"
  {:error, x} -> "No ha resuelto nada"
 end

 IO.puts output



 # Operador pin

 ^x = 4


 # Concurrencia

 defmodule Concurrencia do
  def saludar(nombre) do
    IO.puts "Hola, #{nombre}"
  end
end


pid = spawn(Concurrencia, :saludar, ["Nelson"])

i pid2
