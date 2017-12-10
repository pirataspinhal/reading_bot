defmodule Database.Telegram do
	alias Database.Telegram.Updates, as: Updates
	alias Database.Repo

	def create_telegram_update(%{} = update) do
		%Updates{}
		|> Updates.changeset(update)
		|> Repo.insert
	end

	def delete_telegram_update(%Updates{} = telegram_update) do
		telegram_update
		|> Repo.delete
	end
end