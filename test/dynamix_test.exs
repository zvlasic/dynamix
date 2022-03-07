defmodule DynamixTest do
  use ExUnit.Case
  doctest Dynamix

  test "greets the world" do
    assert Dynamix.hello() == :world
  end
end
