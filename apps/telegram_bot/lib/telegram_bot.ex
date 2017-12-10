defmodule TelegramBot do
  use GenServer
  require Logger

  def start_link() do
    GenServer.start_link(__MODULE__, {nil, 0})

  end

  def init(state) do
    fetch_update()
    {:ok, state}
  end

  def handle_info(:get_updates, {timer_ref, offset} = state) do
    fetch_update()
    state =
      case Nadia.get_updates(allowed_updates: ["messages"], offset: offset) do
        {:ok, []} ->
          state
        {:ok, telegram_updates} ->
          Logger.debug "Received #{length(telegram_updates)} updates from Telegram"
          timer_ref = reset_state(timer_ref)
          {timer_ref, save_to_db(telegram_updates) + 1}
        unexpected ->
          Logger.warn "Received unexpected response from Nadia #{inspect unexpected}"
          state
      end

      {:noreply, state}
  end

  defp fetch_update() do
    Process.send_after(self(), :get_updates, 200)
  end

  defp save_to_db([last]) do
    update = %{update: Map.from_struct(last)}
    Database.Telegram.create_telegram_update(update)
    last.update_id
  end

  defp save_to_db([first | rest]) do
    update = %{update: Map.from_struct(first)}
    Database.Telegram.create_telegram_update(update)
    save_to_db(rest)
  end

  defp save_to_db(_) do
    nil
  end

  defp reset_state(nil) do
    Process.send_after(self(), :reset_state, 7 * 24 * 60 * 60 * 1000)
  end

  defp reset_state(timer_ref) do
    Process.cancel_timer(timer_ref)
    Process.send_after(self(), :reset_state, 7 * 24 * 60 * 60 * 1000)
  end
end
