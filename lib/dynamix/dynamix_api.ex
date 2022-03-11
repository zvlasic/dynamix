defmodule DynamixApi do
  alias Dynamix.{Counter, CounterDynamicSupervisor}

  def get_state_of_process_by_name(process_name), do: Counter.log_state(process_name)
  def change_process_state_by_name(process_name), do: Counter.increment(process_name)

  def add_new_process_by_name(process_name),
    do: CounterDynamicSupervisor.start_child(process_name)
end
