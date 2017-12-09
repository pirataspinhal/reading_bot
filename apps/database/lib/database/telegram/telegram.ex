defmodule Database.Telegram do
  alias Database.Telegram.Updates, as: TelegramUpdate
  alias Database.Repo

  def create_telegram_update(%{} = update) do
    %TelegramUpdate{}
    |> TelegramUpdate.changeset(update)
    |> Repo.insert
  end

  def delete_telegram_update(%TelegramUpdate{} = telegram_update) do
    telegram_update
    |> Repo.delete
  end
end
