defmodule SampleExTest do
  use ExUnit.Case
  doctest SampleEx

  test "greets the world" do
    assert SampleEx.hello() == :world
  end
end
