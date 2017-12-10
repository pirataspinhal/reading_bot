defmodule Database.Telegram.Updates do
	alias Database.Telegram.Updates, as: Updates
	use Ecto.Schema
	import Ecto.Changeset

	schema "telegram_updates" do
		field :update, :map

		timestamps()
	end

	def changeset(%Updates{} = updates, params) do
		updates
		|> cast(params, [:update])
		|> validate_required(:update)
	end
end