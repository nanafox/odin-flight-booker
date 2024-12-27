class AddRandomFlightNumberToFlights < ActiveRecord::Migration[8.0]
  def change
    add_column :flights, :number, :bigint
    add_index :flights, :number, unique: true
  end
end
