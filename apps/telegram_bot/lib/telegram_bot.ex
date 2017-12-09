defmodule TelegramBot do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], 0)
  end

  def init(state) do
    fetch_updates()
    :ok
  end

  def handle_info(:get_updates, state) do
    fetch_updates()
    state =
      case Nadia.get_updates(allowed_updates: ["message"], offset: state) do
        {:ok, telegram_updates} ->
          save_to_db(telegram_updates)
        _ ->
          state
      end

    {:noreply, state}
  end

  defp fetch_updates do
    Process.send_after(self(), :get_updates, 200)
  end

  defp save_to_db([first | rest]) do
  end
  defp save_to_db(_), do: nil
end
