defmodule HelloPhoenix.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :name, :string

      timestamps
    end

  end
end
