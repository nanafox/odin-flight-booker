class ChangeDateTimeToDateInFlights < ActiveRecord::Migration[8.0]
  def change
    change_column :flights, :start, :date
  end
end
