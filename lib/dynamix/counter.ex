defmodule Dynamix.Counter do
  use GenServer
  require Logger

  @registry :counter_registry
  @initial_state 0

  def start_link(name), do: GenServer.start_link(__MODULE__, name, name: via_tuple(name))
  def log_state(process_name), do: process_name |> via_tuple() |> GenServer.call(:log_state)
  def increment(process_name), do: process_name |> via_tuple() |> GenServer.call(:increment)

  def child_spec(process_name) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [process_name]},
      restart: :transient
    }
  end

  def stop(process_name, stop_reason),
    do: process_name |> via_tuple() |> GenServer.stop(stop_reason)

  @impl true
  def init(name) do
    Logger.info("Starting process #{name}")
    {:ok, @initial_state}
  end

  @impl true
  def handle_call(:log_state, _from, state), do: {:reply, "State: #{inspect(state)}", state}

  @impl true
  def handle_call(:increment, _from, state), do: {:reply, :incremented, state + 1}

  defp via_tuple(name), do: {:via, Registry, {@registry, name}}
end
