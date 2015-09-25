defmodule HelloPhoenix.Repo.Migrations.CreateMailAddress do
  use Ecto.Migration

  def change do
    create table(:mail) do
      add :address, :string

      timestamps
    end

  end
end
