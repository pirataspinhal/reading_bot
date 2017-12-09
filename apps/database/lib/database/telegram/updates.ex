defmodule Database.Telegram.Updates do
  alias Database.Telegram.Updates, as: TelegramUpdate
  use Ecto.Schema
  import Ecto.Changeset

  schema "telegram_updates" do
    field :update, :map
  end

  @doc false
  def changeset(%TelegramUpdate{} = updates, params) do
    updates
    |> cast(params, [:update])
    |> validate_required(:update)
  end
end
