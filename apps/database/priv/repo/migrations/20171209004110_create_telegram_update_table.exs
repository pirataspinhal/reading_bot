defmodule Database.Repo.Migrations.CreateTelegramUpdateTable do
  use Ecto.Migration

  def change do
    create table(:telegram_updates) do
      add :update, :map, null: false

      timestamps
    end
  end
end
