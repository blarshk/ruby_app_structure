require "sequel"

Sequel.migration do
  up do
    create_table(:accounts) do
      primary_key :id
    end
  end

  down do
    drop_table(:accounts)
  end
end