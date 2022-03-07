defmodule Dynamix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @registry :counter_registry

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Dynamix.Worker.start_link(arg)
      # {Dynamix.Worker, arg}

      {Dynamix.CounterDynamicSupervisor, []},
      {Registry, [keys: :unique, name: @registry]},
      {Dynamix.Starter, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dynamix.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
