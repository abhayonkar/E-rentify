defmodule Rentify.Repo.Migrations.CreateProperties do
  use Ecto.Migration

  def change do
    create table(:properties) do
      add :place, :string
      add :area, :integer
      add :bedrooms, :integer
      add :bathrooms, :integer
      add :nearby_hospitals, :string
      add :nearby_colleges, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:properties, [:user_id])
  end
end
