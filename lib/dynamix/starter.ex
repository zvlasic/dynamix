defmodule Dynamix.Starter do
  use Task, restart: :transient

  alias Dynamix.CounterDynamicSupervisor

  def start_link(_), do: Task.start_link(__MODULE__, :run, [])

  def run do
    CounterDynamicSupervisor.start_child("broj1")
    CounterDynamicSupervisor.start_child("broj2")
    CounterDynamicSupervisor.start_child("broj3")
  end
end
